
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(
        top: screenHeight * 0.06,
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
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
