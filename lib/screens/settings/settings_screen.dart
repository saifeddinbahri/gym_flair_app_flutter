import 'package:flutter/material.dart';
import 'package:gym_flair/screens/settings/widgets/avatar.dart';
import 'package:gym_flair/screens/settings/widgets/change_birthday.dart';
import 'package:gym_flair/screens/settings/widgets/change_email.dart';
import 'package:gym_flair/screens/settings/widgets/change_password.dart';
import 'package:gym_flair/screens/settings/widgets/change_username.dart';
import 'package:gym_flair/screens/settings/widgets/settings_item.dart';
import 'package:gym_flair/shared/sizes.dart';
import 'package:gym_flair/shared/widgets/screen_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenTitle(title: 'Account settings'),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * ConstantSizes.horizontalPadding,
              right: screenWidth * ConstantSizes.horizontalPadding,
              top: screenHeight * 0.02
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.05),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SettingsAvatar(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Bahri Saif Eddine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: Theme.of(context).textTheme.titleLarge!.fontStyle,
                    fontWeight: FontWeight.w600,
                    fontFamily: Theme.of(context).textTheme.titleLarge!.fontFamily,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                const SettingsItem(
                  label: 'Username',
                  icon: Icons.person,
                  screen: ChangeUsername(),
                ),
                SizedBox(height: screenHeight * 0.01),
                const SettingsItem(
                  label: 'Email',
                  icon: Icons.email,
                  screen: ChangeEmail(),
                ),
                SizedBox(height: screenHeight * 0.01),
                const SettingsItem(
                  label: 'Birthdate',
                  icon: Icons.cake,
                  screen: ChangeBirthday(),
                ),
                SizedBox(height: screenHeight * 0.01),
                const SettingsItem(
                  label: 'Password',
                  icon: Icons.lock,
                  screen: ChangePassword(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
