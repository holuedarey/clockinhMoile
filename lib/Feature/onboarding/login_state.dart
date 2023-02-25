part of 'package:clockingapp/provider/login_user_provider.dart';

abstract class LoginUserState {
  void loginSuccess(String msg);
  void loginError(String error);
  void loginSteppedRegistration(user);
}
