import 'package:clockingapp/provider/clocking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Components/page_state_widget.dart';
import '../../Util/constant.dart';
import '../../component/ph_button.dart';
import '../../component/ph_flash_message.dart';
import '../dashboard/dashboard_page.dart';

class ClockingPage extends StatefulWidget {
  const ClockingPage({Key? key}) : super(key: key);

  @override
  State<ClockingPage> createState() => _ClockingPagePageState();
}

class _ClockingPagePageState extends State<ClockingPage>
    implements ClockingState {

  final _formKey = GlobalKey<FormState>();

  final siteNames = [
    "Bookwell",
    "Catherine Street",
    "Dentholme",
    "Duke Street",
    "Ennerdale",
    "Fleece",
    "Lily Lane",
    "Primrose",
    "Sawery House",
    "Swinley House",
    "Station House",
    "Warrington Road",
  ];

  final checkingPurposes = [
    "Checking Into Job",
    "Checking Out of Job",
    "Break Check-Out",
    "Break Check-In",
  ];
  String? siteName;
  String? checkingPurpose;

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
              "Create Sign in / Out",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: _Clocking(context),
          )),
    );
  }

  Widget _Clocking(BuildContext context) {
    return Consumer<ClockingProvider>(builder: (context, state, _) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 30,),
                SizedBox(height: kPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraFullPadding),
                  child: Text(
                      'We need a few more details to create your sign In / Out',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: kSubtextColor)),
                ),
                SizedBox(height: kFullPaddingSpacer),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kExtraMediumPadding),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Site Name",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kPaddingSmall,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(color: Colors.black, width: 0),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: siteName,
                          isExpanded: true,
                          // icon: const Icon(Icons.arrow_downward),
                          elevation: 2,
                          dropdownColor: kSecondaryTextColor,
                          style: const TextStyle(color: Colors.black),
                          validator: (value) => value == null
                              ? 'Please fill in your Site Name': null,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              siteName = value!;
                            });
                          },
                          items: siteNames
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Check In / Out Purpose",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kPaddingSmall,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(color: Colors.black, width: 0),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: checkingPurpose,
                          isExpanded: true,

                          // icon: const Icon(Icons.arrow_downward),
                          elevation: 2,
                          dropdownColor: kSecondaryTextColor,
                          style: const TextStyle(color: Colors.black),
                          // underline: Container(
                          //   // height: 2,
                          //   color: Colors.white,
                          // ),
                          validator: (value) => value == null
                              ? 'Please fill in your Check in / out': null,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              checkingPurpose = value!;
                            });
                          },
                          items: checkingPurposes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      SizedBox(
                        height: kPaddingForm,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: kRegularPadding),
                          child: PhButton(
                            buttonName: 'Create Clocking',
                            isLoading: state.pageState == PageState.loading,
                            buttonCallBack: () =>
                                (state.pageState == PageState.loading ||
                                        !_formKey.currentState!.validate())
                                    ? null
                                    : state.submitClocking(
                                        this, siteName: siteName, clockingPurpose: checkingPurpose,
                                      ),
                            buttonColor: primaryColor,
                            buttonRadius: 12.0,
                            buttonHeight: 50.0,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: kPaddingSmall,
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  void clcokingError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Oh Snap Error',
        message: error,
        statusColor: true,
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 10,
          right: 0,
          left: 20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  @override
  void clockingSuccess(String msg) {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashBoardPage()),
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Successful',
        message: msg,
        statusColor: false,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
