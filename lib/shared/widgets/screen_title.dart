
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym_flair/screens/home/home_screen.dart';
import 'package:gym_flair/screens/welcome/welcome_screen.dart';
import 'package:gym_flair/shared/sizes.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.title,
    this.icon,
    this.pageToNavigate
  });
  final String title;
  final IconData? icon;
  final Widget? pageToNavigate;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.04,
        bottom: screenHeight * 0.02,
        left: screenWidth * ConstantSizes.horizontalPadding
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 3,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              iconButton(context),
              IconButton(
                  onPressed: (){
                    _disconnectDialog(context);
                  },
                  icon: const Icon(Icons.logout)
              ),
            ],
          )
        ],
      )
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
  Widget iconButton(BuildContext context) {
    if(icon == null) return const SizedBox();
    return IconButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (e)=>pageToNavigate!,
            ),
          );
        },
        icon: Icon(icon)
    );
  }
}
