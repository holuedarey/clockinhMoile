import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Helper/storage_keys.dart';
import '../Services/auth_services.dart';
import '../Util/storage.dart';


part '../Feature/onboarding/reset_password_state.dart';

class ResetUserProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;
  // }

  void submitUserResetPassword(
      ResetPasswordState resetPasswordState, {required String email, required String password, required String token}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      final email = await LocalStorageUtils.read(StorageKeys.userEmail);
      var res = await AuthService.changePassword(email: email!, password: password, token: token);
      resetPasswordState.resetSuccess("Password Change successfully");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      resetPasswordState.resetError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

