
import 'package:flutter/material.dart';

class LoginInputLabel extends StatelessWidget {
  final String label;
  const LoginInputLabel({
    super.key,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(left: screenWidth*0.03),
      child: Text(label,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
            fontWeight: FontWeight.bold
          )
      ),
    );
  }
}
