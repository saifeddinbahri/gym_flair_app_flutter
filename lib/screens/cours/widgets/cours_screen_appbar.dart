
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym_flair/shared/sizes.dart';

import '../../welcome/welcome_screen.dart';

class CoursesScreenAppbar extends StatelessWidget {
  const CoursesScreenAppbar({
    super.key,
    required this.title,
    required this.controller
  });
  final String title;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.16,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 5,
              blurStyle: BlurStyle.normal,
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:EdgeInsets.only(
                top: screenHeight * 0.04,
                left: screenWidth * ConstantSizes.horizontalPadding,
                right: screenWidth * ConstantSizes.horizontalPadding
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                    onPressed: (){
                      _disconnectDialog(context);
                    },
                    icon: const Icon(Icons.logout)
                )
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01,),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TabBar(
                controller: controller,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
                ),
                tabs: [
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.13 ,
                        vertical: screenHeight *0.01
                    ),
                    child: Text(
                      'Classes',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.13 ,
                        vertical: screenHeight *0.01
                    ),
                    child: Text(
                      'Events',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01,),
        ],
      ),
    );
  }
  void _disconnectDialog(BuildContext context){
    Size size = MediaQuery.of(context).size;
    AlertDialog alert = AlertDialog(
      content:  Text(
        "Déconnecter",
        style: TextStyle(
            fontSize: size.width*0.05
        ),
      ),
      actions: [
        TextButton(
            onPressed:()=>Navigator.pop(context) ,
            child: Text(
              "Fermer",
              style: TextStyle(
                  fontSize: size.width*0.04,
                  color: Theme.of(context).colorScheme.primary
              ),
            )
        ),
        TextButton(
            onPressed:() async{

              const storage =  FlutterSecureStorage();
              await storage.delete(key: 'token');
              await storage.delete(key: 'role');
              if(context.mounted){
                Navigator.pop(context);
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const WelcomeScreen(),
                  ),
                );
              }

            },
            child: Text(
              "Déconnecter",
              style: TextStyle(
                  fontSize: size.width*0.04,
                  color: Colors.red
              ),
            )
        )
      ],
      shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    );
    showDialog(context: context,
        builder:(BuildContext context)=>alert
    );
  }
}
