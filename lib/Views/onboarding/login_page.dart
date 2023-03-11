import 'package:sng/Views/onboarding/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Components/page_state_widget.dart';
import '../../Controllers/signup_validator.dart';
import '../../Data/models/user.dart';
import '../../Util/constant.dart';
import '../../component/header_logo.dart';
import '../../component/ph_button.dart';
import '../../component/ph_flash_message.dart';
import '../../component/ph_form_field.dart';
import '../../provider/login_user_provider.dart';
import '../dashboard/dashboard_page.dart';
import 'forget_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LoginPageForm(),
      ),
    );
  }
}

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({Key? key}) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm>
    implements LoginUserState {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  String? username = '';
  String? password = '';
  String? confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginUserProvider>(builder: (context, state, _) {
      return SafeArea(
        child: ListView(
          children: [
            const HeaderLogo(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                  ),
                ),
                SizedBox(height: kPadding),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kFullPaddingSpacer),
                  child: Text('Welcome back',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: kSubtextColor)),
                ),
                SizedBox(
                  height: kFullPaddingSpacer,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kExtraMediumPadding),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PhFormField(
                            labelText: 'Email',
                            hintText: 'someone@mail.com',
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                SignupValidator.validateEmail(value),
                            // controller: emailController
                            onChanged: (value) => {username = value},
                            obscureText: false,
                            toggle: () {},
                          ),
                          SizedBox(height: kRegularPadding),
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
                          SizedBox(height: kPadding),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPasswordPage()),
                                  );
                                },
                                child: Text("Forget Password?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: kPrimaryColor)),
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: kRegularPadding),
                              child: PhButton(
                                buttonName: 'Login',
                                isLoading: state.pageState == PageState.loading,
                                buttonCallBack: () =>
                                    (state.pageState == PageState.loading ||
                                            !_formKey.currentState!.validate())
                                        ? null
                                        : state.submitUserLogin(this,
                                            phone: username!,
                                            password: password!),
                                buttonColor: primaryColor,
                                buttonRadius: 12.0,
                                buttonHeight: 50.0,
                              )),
                        ],
                      )),
                ),
                SizedBox(
                  height: kFullPaddingSpacer,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have and account? ',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                        );
                      },
                      child: Text(
                        'Register here',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  void loginError(String error) {
    print("got to error");
    print(error);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Oh Snap Error',
        message: error,
        statusColor: true,
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 0,
          left: 20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }

  @override
  void loginSteppedRegistration(user) {
    // Navigator.pushReplacement(
    //   context,
    //   // MaterialPageRoute(builder: (context) => const ProfilePage()),
    //   MaterialPageRoute(builder: (context) => DashBoardPage()),
    //
    // );
  }

  @override
  void loginSuccess(String msg) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const DashBoardPage()),
    );
  }

}
