import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/user.dart';
import '../Services/auth_services.dart';

part '../Feature/onboarding/forget_password_state.dart';

class ForgetPasswordProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;
  // }

  void submitUserForgetPassword(ForgetPasswordState forgetPasswordState,
      {required String email}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.forgetPasswordFirebase(email: email);
      // UserModel userModel = UserModel.fromJson(res);
      forgetPasswordState.forgetSuccess("Check your email for password reset link. ");
      email = "";
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      forgetPasswordState.forgetError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }
}
