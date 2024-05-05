import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/settings/widgets/input_label.dart';
import 'package:gym_flair/screens/settings/widgets/submit_button.dart';
import 'package:gym_flair/screens/settings/widgets/text_field.dart';

import '../../../services/user_service.dart';
import '../../../shared/sizes.dart';
import '../../../shared/widgets/backward_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * ConstantSizes.horizontalPadding,
            right: screenWidth * ConstantSizes.horizontalPadding,
            top: screenHeight * 0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackwardButton(
                  onPressed: (){Navigator.pop(context);},
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Change password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: screenHeight * 0.03),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const InputLabel(label: 'Password'),
                  SizedBox(height: screenHeight * 0.01),
                  SettingsFormField(
                    context: context,
                    controller: _password,
                    hintText: 'Enter password',
                    obscureText: _hidePassword,
                    icon: IconButton(
                      icon: Icon(_hidePassword ? Icons.visibility: Icons.visibility_off),
                      onPressed: () => setState(() {
                        _hidePassword = !_hidePassword;
                      }),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please fill this field";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  const InputLabel(label: 'New password'),
                  SizedBox(height: screenHeight * 0.01),
                  SettingsFormField(
                    context: context,
                    controller: _confirmPassword,
                    hintText: 'New password',
                    obscureText: _hidePassword,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Please fill this field";
                      }
                      return null;
                    },
                  ),
                ],
              )
            ),
            SizedBox(height: screenHeight * 0.03),
            SubmitButton(
              text: 'Confirm',
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }
  void submit() async {
    if (_formKey.currentState!.validate()) {
      var service = UserService();
      var res = await service.editPassword(_password.text, _confirmPassword.text, context);
      if (res == 1) {
        Navigator.pop(context,0);
      }
    }
  }
}
