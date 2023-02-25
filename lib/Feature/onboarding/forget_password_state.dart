part of 'package:clockingapp/provider/forget_password_provider.dart';

abstract class ForgetPasswordState {
  void forgetSuccess(String msg);
  void forgetError(String error);
}
