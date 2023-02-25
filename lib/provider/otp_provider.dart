import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Services/auth_services.dart';


part '../Feature/onboarding/otp_state.dart';

class OtpUserProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;
  // }

  void submitUserOtp(
      OtpUserState otpUserState, {required String otp}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.otp(otp: otp,phone: "+2348102020680");
      otpUserState.otpSuccess("userModel.message.toString()");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      otpUserState.otpError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

