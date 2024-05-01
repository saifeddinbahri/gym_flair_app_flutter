
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';

class BackwardButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  const BackwardButton({
    super.key,
    required this.onPressed,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: color,
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
          )
      ),
      child: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurfaceVariant,)
    );
  }
}
