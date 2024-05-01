
import 'package:flutter/material.dart';
import 'package:gym_flair/screens/home/widgets/scan_qr_code_button.dart';
import 'package:gym_flair/screens/home/widgets/section_container.dart';
import '../../shared/sizes.dart';
import '../../shared/widgets/screen_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenTitle(title: 'Home'),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * ConstantSizes.horizontalPadding,
                right: screenWidth * ConstantSizes.horizontalPadding,
                top: screenHeight * 0.02
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.03),
                const SectionContainer(
                  title: 'QR Scan',
                  child: ScanQrCodeButton()
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
