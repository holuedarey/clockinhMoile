import 'package:clockingapp/Services/clcoking_services.dart';
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/create_clocking.dart';


part '../Feature/clocking/user_clocking_state.dart';

class UserClockingProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;
  var response;
  void viewClocking(
      UserClockingState userClockingState) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await ClockingService.myClocking();
      AddClocking addClocking = AddClocking.fromJson(res);
      response = addClocking.data;
      userClockingState.clockingSuccess("Sign In ? out Successful");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      userClockingState.clcokingError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

