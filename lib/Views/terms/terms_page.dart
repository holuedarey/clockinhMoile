import 'package:sng/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sng/provider/terms_provider.dart';

import '../../Components/page_state_widget.dart';
import '../../Util/constant.dart';
import '../../component/ph_button.dart';
import '../../component/ph_flash_message.dart';
import '../dashboard/dashboard_page.dart';
import '../profile/setup_profile.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  State<TermsPage> createState() => _TermsPagePageState();
}

class _TermsPagePageState extends State<TermsPage> implements TermsState {
  final _formKey = GlobalKey<FormState>();

  bool checkedValue = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;
  bool checkedValue4 = false;
  bool checkedValue5 = false;
  bool checkedValue6 = false;
  bool checkedValue7 = false;
  bool checkedValue8 = false;
  bool checkedValue9 = false;
  bool checkedValue10 = false;
  bool result = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kSecondaryTextColor,
            elevation: 0.0,
            iconTheme: const IconThemeData(
              color: kPrimaryColor,
            ),
            title: Text(
              "Terms and Condition",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: _Terms(context),
          )),
    );
  }

  Widget _Terms(BuildContext context) {
    return Consumer<TermsProvider>(builder: (context, state, _) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: kPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraFullPadding),
                  child: Text('Terms of use of this App',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: kSubtextColor)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  child: Text(
                      'The company has invested in an app to improve administration, assist with job costing on each project and Installing and facilitate the end of week renumeration.  This should streamline the process for all contractors and reduce administration time necessary for us to scales the business.',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: kSubtextColor)),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Text(
                      'By using this app means you agree to the following:',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: kSubtextColor)),
                ),
                SizedBox(height: kPaddingSmall),
                Column(
                  children: [
                    CheckboxListTile(
                      value: checkedValue,
                      onChanged: (val) {
                        setState(() => checkedValue = val!);
                      },
                      subtitle: !checkedValue!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "South North Group and family of businesses processing your data for the purposes of business administration.  We will use the check in and check out times for your renumeration and our job costing information.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue1,
                      onChanged: (val) {
                        setState(() => checkedValue1 = val!);
                      },
                      subtitle: !checkedValue1!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "Check in – Please only check in when you are at site and ready to start work.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue2,
                      onChanged: (val) {
                        setState(() => checkedValue2 = val!);
                      },
                      subtitle: !checkedValue2!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "“Break Check out” – when you are on lunch, a comfort break or cigarette and check back in when back working. You have up to an hour of break time per day and we encourage you to use it.  If you are working less, then 6 hours the break time will be different depending on hours worked please speak with your line manager who will be able to let you know what you are entitled too.  ",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue3,
                      onChanged: (val) {
                        setState(() => checkedValue3 = val!);
                      },
                      subtitle: !checkedValue3!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "We decided to include cigarette breaks also as part of a break, please be transparent.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue4,
                      onChanged: (val) {
                        setState(() => checkedValue4 = val!);
                      },
                      subtitle: !checkedValue4!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "Check out – when you have finished for the day",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue5,
                      onChanged: (val) {
                        setState(() => checkedValue5 = val!);
                      },
                      subtitle: !checkedValue5!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "If you forget to check in or out post a check in or out in the subbies group. Your attendance and work will need verifying before we pay you.  This may cause a delay in paying you. ",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue6,
                      onChanged: (val) {
                        setState(() => checkedValue6 = val!);
                      },
                      subtitle: !checkedValue6!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "If you fraudulently put in false, check in and check out times the management has the right to withhold pay for that day.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue7,
                      onChanged: (val) {
                        setState(() => checkedValue7 = val!);
                      },
                      subtitle: !checkedValue7!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "Drugs and Alcohol – if you are found to be under the influence of drugs or alcohol you will be removed off site",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue8,
                      onChanged: (val) {
                        setState(() => checkedValue8 = val!);
                      },
                      subtitle: !checkedValue8!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "Medical conditions – if you have a medical condition that affects your role working for us, you must inform us before completing this agreement. The information will be held in the strictest of confidence.  If in any doubt you should inform David Reid or Robin Dunn.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue9,
                      onChanged: (val) {
                        setState(() => checkedValue9 = val!);
                      },
                      subtitle: !checkedValue9!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "If you see activity that is unsafe or dubious for any reason you must inform the management team immediately.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    CheckboxListTile(
                      value: checkedValue10,
                      onChanged: (val) {
                        setState(() => checkedValue10 = val!);
                      },
                      subtitle: !checkedValue10!
                          ? const Text(
                              'You have to accept terms and condition.',
                              style: TextStyle(color: Colors.red),
                            )
                          : null,
                      title: Text(
                        "Tools and equipment - You may be issued tools and equipment to carry out your role.  It is your responsibility to return this equipment when no longer required.  Do not leave equipment unsecured as items often go missing. The management reserves the right to bill you for the equipment if you are negligent.",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Colors.green,
                    ),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: PhButton(
                        buttonName: "Accept Terms and Condition",
                        isLoading: state.pageState == PageState.loading,
                        buttonCallBack: () =>
                            (state.pageState == PageState.loading ||
                                    !checkForm() ||
                                    !_formKey.currentState!.validate())
                                ? null
                                : state.submitTerms(this,),
                        buttonColor: primaryColor,
                        buttonRadius: 12.0,
                        buttonHeight: 50.0,
                      ),
                    ),
                    SizedBox(
                      height: kRegularPadding,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  checkForm() {
    if (!this.checkedValue ||
        !this.checkedValue1 ||
        !this.checkedValue2 ||
        !this.checkedValue3 ||
        !this.checkedValue4 ||
        !this.checkedValue5 ||
        !this.checkedValue6 ||
        !this.checkedValue7 ||
        !this.checkedValue8 ||
        !this.checkedValue9 ||
        !this.checkedValue10) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void termsError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Oh Snap Error',
        message: error,
        statusColor: true,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  @override
  void termsSuccess(String msg) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashBoardPage()),
    );
  }

  @override
  void termsProfileSuccess(String msg) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SetUpProfilePage()),
    );
  }
}
