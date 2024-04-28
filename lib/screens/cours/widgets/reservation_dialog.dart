
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../shared/sizes.dart';

class ReservationDialog extends StatelessWidget {
  const ReservationDialog({
    super.key,
    required this.title,
    required this.time,
    required this.date,
  });
  final String title;
  final String time;
  final String date;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * ConstantSizes.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: screenHeight * 0.03),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight:FontWeight.w700
            ),
          ),
          SizedBox(height: screenHeight * 0.07),
          dataContainer('date', date, context),
          SizedBox(height: screenHeight * 0.03),
          dataContainer('time', time, context),
          SizedBox(height: screenHeight * 0.03),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                    side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                    fixedSize: Size(
                        screenWidth,
                        screenHeight * ConstantSizes.buttonHeight),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
                    )
                ),
                child: Text(
                  'Confirm reservation',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }
  Widget dataContainer(String title, String content, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.08,
      padding: EdgeInsets.symmetric(
          vertical: height * ConstantSizes.inputVerticalPadding,
          horizontal: width * ConstantSizes.inputHorizontalPadding
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
          color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.1)
      ),
      child: Row(
        children: [
          Text(
              title,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: width * 0.045
              ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
          const VerticalDivider(
            width: 5,
            thickness: 3,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                content,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: width * 0.045
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
