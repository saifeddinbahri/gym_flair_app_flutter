
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/inscription/inscription.dart';
import 'package:gym_flair/screens/login/login_screen.dart';
import 'package:gym_flair/screens/welcome/widgets/custom_scaffold.dart';
import 'package:gym_flair/screens/welcome/widgets/welcome_button.dart';

import '../../shared/sizes.dart';



class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      child: Padding(
          padding: EdgeInsets.only(
              right: screenWidth * ConstantSizes.horizontalPadding,
              left: screenWidth * ConstantSizes.horizontalPadding,
              top: screenHeight * 0.1
          ),
        child: Column(
          children: [
            Flexible(
                flex: 8,
                child: Container(
                  padding:  EdgeInsets.only(top: screenHeight * 0.01),

                  child: Center(child: RichText(

                    textAlign: TextAlign.start,

                    text:  TextSpan(
                        children: [
                          TextSpan(
                              text: 'Welcome To \n',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface ,
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                          TextSpan(
                              text: 'GymFlair !\n',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                              )
                          ),
                          TextSpan(
                              text: 'Enter your personal details account\n',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 20,
                              )
                          )
                        ]
                    ),
                  )),
                )),
             Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    const Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign In ',
                        onTap: LoginScreen(),
                        color:Colors.white70 ,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    const Expanded(
                      child: WelcomeButton(
                        buttonText: 'Sign Up',
                        onTap: InscriptionScreen(),
                        color:Colors.white70 ,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.02 ,)
          ],
        ),
      ),
    );
  }
}