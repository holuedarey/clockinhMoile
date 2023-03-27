import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/user.dart';
import '../Helper/storage_keys.dart';
import '../Services/auth_services.dart';
import '../Util/storage.dart';
part '../Feature/onboarding/login_state.dart';

class LoginUserProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  void submitUserLogin(
  LoginUserState loginUserState, {required String phone, required String password}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.login(email: phone, password: password);
      UserModel userModel = UserModel.fromJson(res);
      UserTokenManager.insertAccessToken(userModel.data?.token ?? "");
      LocalStorageUtils.saveObject<UserModel>(
          StorageKeys.userObject, userModel);
      pageState = PageState.loaded;
      if(userModel.data?.user?.acceptTerms == false){
        loginUserState.loginSteppedRegistration(userModel);
      }else if(userModel.data?.user?.isProfile == false){
        loginUserState.loginProfileRegistration(userModel);
      }else{
        loginUserState.loginSuccess("Login successful");
      }
      notifyListeners();
    } catch (ex) {
      loginUserState.loginError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}
