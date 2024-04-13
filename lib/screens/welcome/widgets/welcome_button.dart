
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';


class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key,this.buttonText, this.onTap, this.color, this.textColor});
  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (e)=>onTap!,
          ),
        );
      },
      child:
      ClipRRect(
        borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 6,
            sigmaY: 6
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.7),
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
              // boxShadow: const [
              //BoxShadow(
              //color: Color(0xA69E9E9E), // Set shadow color and opacity
              // spreadRadius: 10, // Set spread radius
              //  blurRadius: 10, // Set blur radius
              // offset: Offset(2, 0), // Set offset for shadow
              //),
              //],
            ),
            child: Text(
              buttonText!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}