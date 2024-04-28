import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_flair/screens/scan_qrcode_screen/widgets/scan_qr_code_button.dart';

import '../../shared/sizes.dart';
import '../../shared/widgets/screen_title.dart';

class ScanQrCodeScreen extends StatelessWidget {
  const ScanQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ScreenTitle(title: 'Scan Qr code'),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * ConstantSizes.horizontalPadding,
              right: screenWidth * ConstantSizes.horizontalPadding,
              top: screenHeight * 0.02
          ),
          child: SizedBox(
            height: screenHeight * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.03),
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.asset(
                    'assets/images/qr-code.png',
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Text('To enter the gym, scan the QR code',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const Expanded(
                    child: Align(
                        alignment: Alignment.center ,
                        child: ScanQrCodeButton()
                    )
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
