import 'package:sng/Services/clcoking_services.dart';
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/create_clocking.dart';
import '../Data/models/location.dart';
import '../Services/auth_services.dart';


part '../Feature/clocking/create_profile_state.dart';

class SetUpProfileProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;
  var response;
  void submitProfile(SetUpProfileState setUpProfileState, {required String ni, required String utr, required String address, required String dob, required String nok, required String nokRelation, required String nokPhone, }) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await AuthService.createProfile(ni:ni, utr:utr, address:address, dob:dob, nok:nok, nokRelation:nokRelation, nokPhone:nokPhone,);
      setUpProfileState.profileSuccess("Successful");
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      setUpProfileState.profileError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }
}

