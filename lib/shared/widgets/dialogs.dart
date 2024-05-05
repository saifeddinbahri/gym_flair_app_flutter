
import 'package:flutter/material.dart';

void loadingDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      color: Colors.transparent,
      alignment: FractionalOffset.center,
      child: const CircularProgressIndicator(),
    ),
  );
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => alert);
}

void errorDialog(BuildContext context,Size size,String error){
  AlertDialog alert = AlertDialog(
    content:  Text(
      error,
      style: TextStyle(
          fontSize: size.width*0.05
      ),
    ),
    actions: [
      TextButton(
          onPressed:() => Navigator.pop(context) ,
          child: Text(
            "Fermer",
            style: TextStyle(
                fontSize: size.width*0.04,
                color: Theme.of(context).colorScheme.primary
            ),
          )
      ),
    ],

  );
  showDialog(context: context,
      builder:(BuildContext context)=>alert
  );
}

