part of 'package:clockingapp/provider/clocking_provider.dart';

abstract class ClockingState {
  void clockingSuccess(String msg);
  void clcokingError(String error);
}
