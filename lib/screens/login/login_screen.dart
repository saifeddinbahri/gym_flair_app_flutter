
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/login/controllers/login_form_controller.dart';
import 'package:gym_flair/screens/login/widgets/login_submit_button.dart';
import 'package:gym_flair/screens/login/widgets/login_text_field.dart';
import 'package:gym_flair/shared/sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final LoginFormController _formController = LoginFormController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            right: screenWidth*ConstantSizes.horizontalPadding,
            left: screenWidth*ConstantSizes.horizontalPadding,
            top: screenHeight*0.1
        ),
        child: Form(
          key: _formKey,
            child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Sign in',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
             SizedBox(
              height: screenHeight*0.1,
            ),
            LoginFormField(
              context: context,
              controller: _username,
              hintText: 'Username',
              validator: (value){_formController.validateUsername(value);},
            ),
             SizedBox(
              height: screenHeight*0.03,
            ),
            LoginFormField(
              context: context,
              controller: _password,
              hintText: 'Password',
              validator:  (value){_formController.validatePassword(value);},
            ),
            SizedBox(
              height: screenHeight*0.1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.1 ),
              child: LoginSubmitButton(
                onPressed: () {  },
                text: 'Connect',
              ),
            ),
          ],
        )
        ),
      )
    );
  }
}
