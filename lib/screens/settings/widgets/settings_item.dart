import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/sizes.dart';

class SettingsItem extends StatelessWidget {
  final String label;
  final IconData icon;
  const SettingsItem({
    super.key,
    required this.label,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return OutlinedButton(
        onPressed: (){},
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * ConstantSizes.inputVerticalPadding,
              horizontal: screenWidth * ConstantSizes.inputHorizontalPadding
          ),
          side: const BorderSide(color: Colors.transparent),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
          ),
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(
              width: screenWidth*0.03,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios)
                )
            )
          ],
        )
    );
  }
}
