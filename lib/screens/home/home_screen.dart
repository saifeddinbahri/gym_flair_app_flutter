
import 'package:flutter/material.dart';
import '../../shared/sizes.dart';

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
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * ConstantSizes.horizontalPadding,
            right: screenWidth * ConstantSizes.horizontalPadding,
            top: screenHeight * 0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Text('Hi, saif',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: screenHeight * 0.03),

          ],
        ),
      ),
    );
  }
}
