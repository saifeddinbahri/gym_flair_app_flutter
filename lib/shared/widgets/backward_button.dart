
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';

class BackwardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackwardButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
          side: BorderSide(color: Theme.of(context).colorScheme.surfaceVariant),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
          )
      ),
      child: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onSurfaceVariant,)
    );
  }
}
