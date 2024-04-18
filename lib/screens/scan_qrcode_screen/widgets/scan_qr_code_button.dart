import 'package:flutter/material.dart';

import '../../../shared/sizes.dart';

class ScanQrCodeButton extends StatelessWidget {
  const ScanQrCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.7
          ),
            elevation: 4,
            shadowColor: Theme.of(context).colorScheme.shadow
        ),
        child: Icon(
            Icons.qr_code_scanner,
            size: screenWidth * 0.1,
            color: Theme.of(context).colorScheme.onInverseSurface ,
        )
    );
  }
}
