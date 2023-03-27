import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Components/page_state_widget.dart';
import '../../Controllers/signup_validator.dart';
import '../../Util/constant.dart';
import '../../component/header_logo.dart';
import '../../component/ph_button.dart';
import '../../component/ph_form_field.dart';
import '../../provider/create_profile_provider.dart';
import '../dashboard/dashboard_page.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SetUpProfilePage extends StatefulWidget {
  const SetUpProfilePage({Key? key}) : super(key: key);

  @override
  State<SetUpProfilePage> createState() => _SetUpProfilePagePageState();
}

class _SetUpProfilePagePageState extends State<SetUpProfilePage>
    implements SetUpProfileState {
  bool isApiCallProcess = false;
  final _formKey = GlobalKey<FormState>();

  String? address;
  String? dob;
  String? ni;
  String? UTR;
  String? nok;
  String? nokRelation;
  String? nokPhone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: _profile(context),
          )),
    );
  }

  Widget _profile(BuildContext context) {
    return Consumer<SetUpProfileProvider>(builder: (context, state, _) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const HeaderLogo(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Text(
                    'Personal Details',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                  ),
                ),
                SizedBox(height: kPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraFullPadding),
                  child: Text(
                      'We need a few more details to get you all set up',
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
                      PhFormField(
                        labelText: 'National Insurance',
                        hintText: 'Enter your National Insurance',
                        keyboardType: TextInputType.text,
                        onChanged: (value) => {ni = value},
                        validator: (value) =>
                            SignupValidator.validateName(value),
                        obscureText: false,
                        toggle: () {},
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      PhFormField(
                        labelText: 'UTR Number',
                        hintText: 'Enter your UTR Number',
                        keyboardType: TextInputType.text,
                        onChanged: (value) => {UTR = value},
                        validator: (value) =>
                            SignupValidator.validateSurname(value),
                        obscureText: false,
                        toggle: () {},
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      PhFormField(
                        labelText: 'Address',
                        hintText: 'Enter your Address',
                        keyboardType: TextInputType.text,
                        onChanged: (value) => {address = value},
                        validator: (value) =>
                            SignupValidator.validateAddress(value),
                        obscureText: false,
                        toggle: () {},
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Date of Birth",
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
                      TextFormField(
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1970, 3, 5),
                                maxTime: DateTime.now(), onChanged: (date) {
                              print('change $date');
                            }, onConfirm: (date) {
                              setState(() {
                                dob = '${date.year}-${date.month}-${date.day}';
                              });
                              print('confirm $date');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          decoration: InputDecoration(
                            hintText: dob != '' ? dob : "Select Date of Birth",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: kColorGreyII),
                            alignLabelWithHint: false,
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          )),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      PhFormField(
                        labelText: 'Next of Kin Name ',
                        hintText: 'Enter your Next of Kin name ',
                        keyboardType: TextInputType.text,
                        onChanged: (value) => {nok = value},
                        validator: (value) =>
                            SignupValidator.validateAddress(value),
                        obscureText: false,
                        toggle: () {},
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      PhFormField(
                        labelText: 'Next of Kin relationship',
                        hintText: 'Enter your Next of Kin relationship',
                        keyboardType: TextInputType.text,
                        onChanged: (value) => {nokRelation = value},
                        validator: (value) =>
                            SignupValidator.validateAddress(value),
                        obscureText: false,
                        toggle: () {},
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      PhFormField(
                        labelText: 'Next of Kin contact number',
                        hintText: 'Enter your Next of Kin contact number/s',
                        keyboardType: TextInputType.text,
                        onChanged: (value) => {nokPhone = value},
                        validator: (value) =>
                            SignupValidator.validateAddress(value),
                        obscureText: false,
                        toggle: () {},
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: kRegularPadding),
                          child: PhButton(
                            buttonName: 'Update Profile',
                            isLoading: state.pageState == PageState.loading,
                            buttonCallBack: () =>
                                (state.pageState == PageState.loading ||
                                        !_formKey.currentState!.validate())
                                    ? null
                                    : state.submitProfile(
                                        this,
                                        ni: ni!,
                                        utr: UTR!,
                                        address: address!,
                                        dob: dob!,
                                        nok: nok!,
                                        nokRelation: nokRelation!,
                                        nokPhone: nokPhone!,
                                      ),
                            buttonRadius: 12.0,
                            buttonHeight: 50.0,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: kRegularPadding,
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  void profileError(String error) {
    if (error == "User profile already exists") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashBoardPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            error,
            style: const TextStyle(color: Colors.white),
          ),
          duration: const Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Dismiss',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }

  @override
  void profileSuccess(String msg) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashBoardPage()),
    );
  }
}
