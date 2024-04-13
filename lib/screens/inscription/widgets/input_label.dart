
import 'package:flutter/material.dart';

class InscriptionInputLabel extends StatelessWidget {
  final String label;
  const InscriptionInputLabel({
    super.key,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
