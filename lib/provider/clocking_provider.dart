import 'package:clockingapp/Services/clcoking_services.dart';
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Services/auth_services.dart';


part '../Feature/clocking/clocking_state.dart';

class ClockingProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;

  // set setLoginView(LoginUserState view) {
  //   _loginUserState = view;
  // }

  void submitClocking(
      ClockingState clockingState, {required siteName, required clockingPurpose}) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await ClockingService.createClocking(name: siteName, clockingPurpose: clockingPurpose);
      clockingState.clockingSuccess("Sign In ? out Successful");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      clockingState.clcokingError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }

}

