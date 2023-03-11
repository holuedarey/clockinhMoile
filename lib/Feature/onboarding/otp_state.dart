part of 'package:sng/provider/otp_provider.dart';

abstract class OtpUserState {
  void otpSuccess(String msg);
  void otpError(String error);
}
