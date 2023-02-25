import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Components/page_state_widget.dart';
import '../../Controllers/signup_validator.dart';
import '../../Util/constant.dart';
import '../../component/header_logo.dart';
import '../../component/ph_button.dart';
import '../../component/ph_flash_message.dart';
import '../../component/ph_form_field.dart';
import '../../provider/forget_password_provider.dart';
import 'login_page.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> implements ForgetPasswordState{
  bool isApiCallProcess = false;
  final _formKey = GlobalKey<FormState>();

  String? phone;

  void dispose() {
    super.dispose();
    phone = "";
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: _forgetPwd(context),
          )),
    );
  }

  Widget _forgetPwd(BuildContext context) {
    return Consumer<ForgetPasswordProvider>(
      builder: (context, state, _) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const HeaderLogo(),
                  Image.asset(
                    'assets/forget_password.png',
                    width: 250,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kPadding),
                    child: Text(
                      'Oops Don’t Worry',
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
                        'Kindly enter your email number and let us get you started',
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
                          labelText: 'Email Address',
                          hintText: 'someone@mail..com',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) => {phone = value},
                          validator: (value) =>
                              SignupValidator.validateEmail(value),
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
                              buttonName: 'Reset Password',
                              isLoading:state.pageState==PageState.loading,
                              buttonCallBack: () => (state.pageState==PageState.loading ||  !_formKey.currentState!.validate()) ? null  :
                              state.submitUserForgetPassword(this, email: phone!, ),

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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Back to Login',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: primaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

  @override
  void forgetError(String error) {
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
  void forgetSuccess(String msg) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Success',
        message: msg,
        statusColor: false,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
