part of 'package:clockingapp/provider/otp_provider.dart';

abstract class OtpUserState {
  void otpSuccess(String msg);
  void otpError(String error);
}
