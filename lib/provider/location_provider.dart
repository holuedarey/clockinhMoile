import 'package:sng/Data/models/location.dart';
import 'package:sng/Services/clcoking_services.dart';
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';

// part '../Feature/clocking/location_state.dart';

class LocationProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;
  var response;

  void fetchLocation(_clockingPagePageState) async {
    pageState = PageState.loading;
    // notifyListeners();
    try {
      var res = await ClockingService.allLocations();
      AllLocation allLocation = AllLocation.fromJson(res);
      response = allLocation.data?.map((e) => e.name);
      print("res ${response.toString()}");
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
