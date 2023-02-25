import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Components/page_state_widget.dart';
import '../../Controllers/signup_validator.dart';
import '../../Util/constant.dart';
import '../../component/header_logo.dart';
import '../../component/ph_button.dart';
import '../../component/ph_flash_message.dart';
import '../../component/ph_form_field.dart';
import '../../provider/signup_provider.dart';
import '../dashboard/dashboard_page.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SignUpPageForm(),
      ),
    );
  }
}

class SignUpPageForm extends StatefulWidget {
  const SignUpPageForm({Key? key}) : super(key: key);

  @override
  State<SignUpPageForm> createState() => _SignUpPageFormState();
}

class _SignUpPageFormState extends State<SignUpPageForm>
    implements SignUpUserState {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  String? firstname = '';
  String? lastname = '';
  String? username = '';
  String? email = '';
  String? password = '';
  String? confirmPassword = '';
  bool? checkedValue = false;
  String address='';
  String phoneNumber ='';
  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpUserProvider>(builder: (context, state, _) {
      return SafeArea(
        child: ListView(
          children: [
            const HeaderLogo(),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kPadding),
                  child: Text(
                    "Create a new account",
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: kFullPadding),
                    child: Text('Join Now to monitor your attendance activity',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: kSubtextColor))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kExtraMediumPadding),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PhFormField(
                            labelText: 'First Name',
                            hintText: 'John',
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                SignupValidator.validateName(value),
                            // controller: emailController
                            onChanged: (value) => {firstname = value},
                            obscureText: false,

                            toggle: () {},
                          ),
                          SizedBox(height: kRegularPadding),
                          PhFormField(
                            labelText: 'Last Name',
                            hintText: 'Doe',
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                SignupValidator.validateSurname(value),
                            // controller: emailController
                            onChanged: (value) => {lastname = value},
                            obscureText: false,

                            toggle: () {},
                          ),
                          SizedBox(height: kRegularPadding),
                          PhFormField(
                            labelText: 'Address',
                            hintText: '200 Ringwood road wv10 9ey',
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                SignupValidator.validateSurname(value),
                            // controller: emailController
                            onChanged: (value) => {address = value},
                            obscureText: false,

                            toggle: () {},
                          ),
                          SizedBox(height: kRegularPadding),
                          PhFormField(
                            labelText: 'phone Number',
                            hintText: '+4412345678',
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                SignupValidator.validateSurname(value),
                            // controller: emailController
                            onChanged: (value) => {phoneNumber = value},
                            obscureText: false,
                            toggle: () {},
                          ),
                          SizedBox(height: kRegularPadding),
                          PhFormField(
                            labelText: 'Email',
                            hintText: 'someone@mail.com',
                            keyboardType: TextInputType.text,
                            validator: (value) =>
                                SignupValidator.validateEmail(value),
                            // controller: emailController
                            onChanged: (value) => {email = value},
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
                              isPassword: true),
                          SizedBox(height: kRegularPadding),
                          PhFormField(
                              hintText: 'Enter your Confirm  password',
                              labelText: 'Confirm Password',
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) =>
                                  SignupValidator.validateConfirmPassword(
                                      value, password),
                              onChanged: (value) => {confirmPassword = value},
                              obscureText: _obscureText,
                              isPassword: true),
                          CheckboxListTile(
                            value: checkedValue,
                            onChanged: (val) {
                              setState(() => checkedValue = val);
                            },
                            subtitle: !checkedValue!
                                ? const Text(
                                    'You have to accept terms and condition.',
                                    style: TextStyle(color: Colors.red),
                                  )
                                : null,
                            title: InkWell(
                                onTap: () {
                                  _showGeneralDialog(context);
                                },
                                child: Text(
                                  "Agree to Terms and condition of Use",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                )),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.green,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: kRegularPadding),
                              child: PhButton(
                                buttonName: 'Sign Up',
                                isLoading: state.pageState == PageState.loading,
                                buttonCallBack: () => {
                                  (state.pageState == PageState.loading ||
                                          !_formKey.currentState!.validate())
                                      ? null
                                      : state.submitUserSignUp(this,
                                          address: address,
                                          phoneNumber:phoneNumber,
                                          firstname: firstname!,
                                          lastname: lastname!,
                                          email: email!,
                                          password: password!)
                                },
                                buttonColor: primaryColor,
                                buttonRadius: 12.0,
                                buttonHeight: 50.0,
                              )),
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: kRegularPadding),

              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  void loginError(String error) {
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

  _showGeneralDialog(context) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width - 10,
              // margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0),
                  topRight: Radius.circular(23.0),
                  bottomLeft: Radius.circular(0.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Terms and Condition of Use",
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Text(
                            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laboru    numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam recusandae alias error harum maxime adipisci amet laborum. Perspiciatis minima nesciunt dolorem! Officiis iure rerum voluptates a cumque velit quibusdam sed amet tempora. Sit laborum ab, eius fugit doloribus tenetur fugiat, temporibus enim commodi iusto libero magni deleniti quod quam consequuntur! Commodi minima excepturi repudiandae velit hic maxime doloremque. Quaerat provident commodi consectetur veniam similique ad earum omnis ipsum saepe, voluptas, hic voluptates pariatur est explicabo fugiat, dolorum eligendi quam cupiditate excepturi mollitia maiores labore suscipit quas? Nulla, placeat. Voluptatem quaerat non architecto ab laudantium modi minima sunt esse temporibus sint culpa, recusandae aliquam numquam totam ratione voluptas quod exercitationem fuga. Possimus quis earum veniam quasi aliquam eligendi, placeat qui corporis!",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    child: PhButton(
                        buttonName: "Close",
                        buttonCallBack: () => Navigator.pop(context)),
                  )
                ],
              )),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  void loginSuccess(message) {
    print("got to success");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashBoardPage()),
    );

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: PhFlashMessage(
        title: 'Account Creation',
        message: message,
        statusColor: false,
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 20, right: 0, left: 20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
