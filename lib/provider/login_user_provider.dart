import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/user.dart';
import '../Helper/storage_keys.dart';
import '../Services/auth_services.dart';
import '../Util/storage.dart';
part '../Feature/onboarding/login_state.dart';

class LoginUserProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;
  // }

  void submitUserLogin(
  LoginUserState loginUserState, {required String phone, required String password}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.loginFirebase(phone: phone, password: password);
      pageState = PageState.loaded;
      loginUserState.loginSuccess("Login successful");
      notifyListeners();
    } catch (ex) {
      loginUserState.loginError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}
