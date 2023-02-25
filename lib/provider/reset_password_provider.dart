import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Services/auth_services.dart';


part '../Feature/onboarding/reset_password_state.dart';

class OtpUserProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;
  // }

  void submitUserResetPassword(
      ResetPasswordState resetPasswordState, {required String phone}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.forgetPassword(phone: phone);
      resetPasswordState.resetSuccess("userModel.message.toString()");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      resetPasswordState.resetError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

