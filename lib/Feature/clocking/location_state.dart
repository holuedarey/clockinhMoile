part of 'package:sng/provider/location_provider.dart';

abstract class LocationState {
  void clockingSuccess(String msg);
  void clcokingError(String error);
}
