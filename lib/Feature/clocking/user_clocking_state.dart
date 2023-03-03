part of 'package:clockingapp/provider/user_clocking_provider.dart';

abstract class UserClockingState {
  void clockingSuccess(String msg);
  void clcokingError(String error);
}
