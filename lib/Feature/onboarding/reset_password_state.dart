part of 'package:sng/provider/reset_password_provider.dart';

abstract class ResetPasswordState {
  void resetSuccess(String msg);
  void resetError(String error);
}
