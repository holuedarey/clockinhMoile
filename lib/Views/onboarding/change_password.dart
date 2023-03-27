import 'package:sng/Views/onboarding/login_page.dart';
import 'package:flutter/material.dart';

import '../../Components/page_state_widget.dart';
import '../../Controllers/signup_validator.dart';
import '../../Util/constant.dart';
import '../../component/header_logo.dart';
import '../../component/ph_button.dart';
import '../../component/ph_flash_message.dart';
import '../../component/ph_form_field.dart';
import '../../provider/reset_password_provider.dart';
import 'package:provider/provider.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> implements ResetPasswordState {
  final _formKey = GlobalKey<FormState>();

  final bool _obscureText = true;

  String? token ='';
  String? password ='';
  String? confirmPassword ='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: _changePwdUI(context),
          )),
    );
  }

  Widget _changePwdUI(BuildContext context,) {
    return Consumer<ResetUserProvider>(
        builder: (context, state, _) {
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
                        'Create New password',
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
                          'Kindly enter your email/phone number and let us get you started',
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
                            hintText: 'Enter your Token',
                            labelText: 'Token',
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) =>
                                SignupValidator.validateName(value),
                            onChanged: (value) => {token = value},
                            obscureText: false,
                            isPassword: false,
                          ),
                          PhFormField(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) =>
                                SignupValidator.validatePassword(value),
                            onChanged: (value) => {password = value},
                            obscureText: _obscureText,
                            isPassword: true,
                          ),
                          SizedBox(height: kRegularPadding),
                          PhFormField(
                            hintText: 'Enter your password',
                            labelText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) =>
                                SignupValidator.validateConfirmPassword(value, password),
                            onChanged: (value) => {confirmPassword = value},
                            obscureText: _obscureText,
                            isPassword: true,
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
                                state.submitUserResetPassword(this, token: token!,password: password!, email: ""),
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
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(
                        'Home',
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
        });
  }

  @override
  void resetError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Oh Snap Error',
        message: error, statusColor: true,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  @override
  void resetSuccess(String msg) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
