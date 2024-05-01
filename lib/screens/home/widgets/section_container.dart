
import 'package:flutter/material.dart';

import '../../../shared/sizes.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * ConstantSizes.inputVerticalPadding,
          horizontal: screenWidth * ConstantSizes.inputHorizontalPadding
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
        color: Theme.of(context).colorScheme.surfaceVariant
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: screenHeight * 0.02,),
          child
        ],
      ),
    );
  }
}
