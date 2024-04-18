import 'package:flutter/material.dart';
import 'package:gym_flair/screens/settings/widgets/settings_item.dart';
import 'package:gym_flair/shared/sizes.dart';

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
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * ConstantSizes.horizontalPadding,
          right: screenWidth * ConstantSizes.horizontalPadding,
          top: screenHeight * 0.05
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Text(
                'Profile settings',
                style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: screenHeight * 0.03),
            const SettingsItem(
              label: 'Username',
              icon: Icons.person,
            ),
            SizedBox(height: screenHeight * 0.03),
            const SettingsItem(
              label: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: screenHeight * 0.03),
            const SettingsItem(
              label: 'Birthdate',
              icon: Icons.cake,
            ),
            SizedBox(height: screenHeight * 0.03),
            const SettingsItem(
              label: 'Password',
              icon: Icons.lock,
            ),
          ],
        ),
      ),
    );
  }
}
