
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gym_flair/bottom_navigation_page.dart';
import 'package:gym_flair/screens/home/home_screen.dart';
import 'package:gym_flair/screens/welcome/welcome_screen.dart';


class Redirect extends StatefulWidget {
  const Redirect({super.key});

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  final storage = const FlutterSecureStorage();
  late Future<Map<String,String>> _data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data=storage.readAll();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String,String>>(
      future:_data ,
      builder: (context,snap){
        if(snap.hasData && snap.data!['token']!=null){
            final jwt = JWT.decode(snap.data!['token']!);
            if(isExpired(jwt.payload)){
              return const WelcomeScreen();
            } else {
              return const BottomNavigation();
            }
        }
        return const  WelcomeScreen();
      },
    ) ;
  }

  bool isExpired(Map<String,dynamic> token){

    int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return currentTime > token['exp'];

  }

}