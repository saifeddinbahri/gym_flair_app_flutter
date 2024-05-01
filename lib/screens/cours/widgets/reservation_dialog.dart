
import 'package:flutter/material.dart';
import '../../../shared/sizes.dart';

class ReservationDialog extends StatelessWidget {
  const ReservationDialog({
    super.key,
    required this.title,
    required this.time,
    required this.date,
    required this.trainer,
  });
  final String title;
  final String time;
  final String date;
  final String trainer;


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
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight:FontWeight.w700
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Container(
            height: screenHeight * 0.17,
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * ConstantSizes.inputVerticalPadding,
                horizontal: screenWidth * ConstantSizes.inputHorizontalPadding
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
                color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.1)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Instructor',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: screenWidth * 0.045
                  )
                ),
                SizedBox(height: screenHeight * 0.01,),
                const Divider(
                  thickness: 3,
                  height: 5,
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const NetworkImage(
                        'https://img.freepik.com/free-photo/fit-cartoon-character-training_23-2151149055.jpg?t=st=1714464379~exp=1714467979~hmac=33bec062ba355e62ec4d139d428a260a4a6f6073869814b658c5c373fc94cf45&w=740'
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                      radius: screenWidth *0.07,
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            trainer,
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: screenWidth * 0.045
                              )
                                              ),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          dataContainer('date', date, context),
          SizedBox(height: screenHeight * 0.01),
          dataContainer('time', time, context),
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
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    fontSize: screenWidth * 0.045
                  )
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
              overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
