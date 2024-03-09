
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';

class LoginSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;


  const LoginSubmitButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        fixedSize: Size(
            double.infinity,
            MediaQuery.of(context).
             size.height*ConstantSizes.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
        )
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onInverseSurface,
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
        ),
      ),
    );
  }
}
