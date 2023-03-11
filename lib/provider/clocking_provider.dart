import 'package:sng/Services/clcoking_services.dart';
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/create_clocking.dart';
import '../Data/models/location.dart';
import '../Services/auth_services.dart';


part '../Feature/clocking/clocking_state.dart';

class ClockingProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;
  var response;
  void submitClocking(
      ClockingState clockingState, {required siteName, required clockingPurpose}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await ClockingService.createClocking(name: siteName, clockingPurpose: clockingPurpose);
      clockingState.clockingSuccess("Sign In / out Successful");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      clockingState.clcokingError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

  void fetchLocation( ClockingState clockingState,) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await ClockingService.allLocations();
      AllLocation allLocation = AllLocation.fromJson(res);
      response = allLocation.data;
      print("new data");
      print(allLocation.data);
      // locationState.clockingSuccess("");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      // locationState.clcokingError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

