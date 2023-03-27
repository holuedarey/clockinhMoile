import 'package:sng/Services/clcoking_services.dart';
import 'package:flutter/foundation.dart';

import '../Components/page_state_widget.dart';
import '../Data/models/user_profile.dart';


part '../Feature/clocking/terms_state.dart';

class TermsProvider with ChangeNotifier {
  PageState pageState = PageState.loaded;
  var response;
  void submitTerms(TermsState termsState) async {
    pageState = PageState.loading;
    notifyListeners();
    try {
      var res = await ClockingService.createTerms();
      UserProfile profile = UserProfile.fromJson(res);

      if(profile.data?.isProfile == false){
        termsState.termsProfileSuccess("Kindly Complete Your Profile");
      }else{
        termsState.termsSuccess("Successful");
      }
      pageState = PageState.loaded;
      notifyListeners();
    } catch (ex) {
      termsState.termsError(ex.toString());
      pageState = PageState.loaded;
      notifyListeners();
    }
  }
}

