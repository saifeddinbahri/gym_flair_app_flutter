import 'package:flutter/material.dart';
import 'package:gym_flair/screens/scan_qrcode_screen/widgets/qr_scanner_screen.dart';
import '../../../shared/sizes.dart';

class ScanQrCodeButton extends StatelessWidget {
  const ScanQrCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (e) => const QrScannerScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.03
          ),
            elevation: 4,
            shadowColor: Theme.of(context).colorScheme.shadow
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Scan QR code',
                 style: TextStyle(
                   fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                   fontFamily: Theme.of(context).textTheme.labelLarge!.fontFamily,
                   fontWeight: Theme.of(context).textTheme.labelLarge!.fontWeight,
                   fontStyle: Theme.of(context).textTheme.labelLarge!.fontStyle,
                   color: Colors.white
                 ),
            ),
            SizedBox(
              width: screenWidth*0.05,
            ),
            Icon(
              Icons.qr_code_scanner,
              color: Theme.of(context).colorScheme.onInverseSurface ,
            ),
          ],
        )
    );
  }
}


/*
SizedBox(
          height: screenHeight*0.03,
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Scan QR code',
                   style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(
                width: screenWidth*0.05,
              ),
              Icon(
                Icons.qr_code_scanner,
                color: Theme.of(context).colorScheme.onInverseSurface ,
              ),
            ],

* */