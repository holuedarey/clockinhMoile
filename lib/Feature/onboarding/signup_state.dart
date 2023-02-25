part of 'package:clockingapp/provider/signup_provider.dart';

abstract class SignUpUserState {
  void loginSuccess(String msg);
  void loginError(String error);
}
