
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: (){},
      child: Text('Forgot Password?',
          textAlign: TextAlign.right,
          style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.6)
      ),
      ),
    );
  }
}
