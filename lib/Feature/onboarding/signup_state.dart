part of 'package:sng/provider/signup_provider.dart';

abstract class SignUpUserState {
  void loginSuccess(String msg);
  void loginError(String error);
}
