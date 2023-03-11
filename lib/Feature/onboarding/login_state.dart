part of 'package:sng/provider/login_user_provider.dart';

abstract class LoginUserState {
  void loginSuccess(String msg);
  void loginError(String error);
  void loginSteppedRegistration(user);
}
