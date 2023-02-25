
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

part '../Feature/onboarding/signup_state.dart';

class SignUpUserProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;x
  // }

  void submitUserSignUp(
      SignUpUserState signUpUserState, {required String address, required String email, required String password, required String firstname, required String lastname, required String phoneNumber}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.signUpFirebase(email:email, password: password);
      await AuthService.saveUserInfoToFireStore(firstname: firstname, lastname: lastname, address: address, phoneNumber: phoneNumber);
      signUpUserState.loginSuccess("Registration Successful");
      pageState = PageState.loaded;
      notifyListeners();
    } on FirebaseAuthException catch (ex) {
      print(ex);
      signUpUserState.loginError(ex.message.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

