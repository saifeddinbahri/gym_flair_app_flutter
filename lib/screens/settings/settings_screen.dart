import 'package:flutter/material.dart';
import 'package:gym_flair/screens/settings/widgets/avatar.dart';
import 'package:gym_flair/screens/settings/widgets/change_birthday.dart';
import 'package:gym_flair/screens/settings/widgets/change_email.dart';
import 'package:gym_flair/screens/settings/widgets/change_password.dart';
import 'package:gym_flair/screens/settings/widgets/change_username.dart';
import 'package:gym_flair/screens/settings/widgets/settings_item.dart';
import 'package:gym_flair/services/user_service.dart';
import 'package:gym_flair/shared/sizes.dart';
import 'package:gym_flair/shared/widgets/screen_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  bool loading = true;
  late Map<String, dynamic> data;
  final service = UserService();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData();
  }
  
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
            child: loading ?
              const Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.05),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SettingsAvatar(photo:data['photo']),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  data['username'],
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
                SettingsItem(
                  callbackAction: userData,
                  label: 'Username',
                  icon: Icons.person,
                  screen: ChangeUsername(username: data['username']),
                ),
                SizedBox(height: screenHeight * 0.01),
                SettingsItem(
                  callbackAction: userData,
                  label: 'Email',
                  icon: Icons.email,
                  screen: ChangeEmail(email: data['email']),
                ),
                SizedBox(height: screenHeight * 0.01),
                SettingsItem(
                  callbackAction: userData,
                  label: 'Birthdate',
                  icon: Icons.cake,
                  screen: ChangeBirthday(birth: data['birth']),
                ),
                SizedBox(height: screenHeight * 0.01),
                SettingsItem(
                  callbackAction: userData,
                  label: 'Password',
                  icon: Icons.lock,
                  screen: const ChangePassword(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void userData() async{
    data = await service.getProfileData();
    loading = false;
    setState(() {
    });
  }
}
