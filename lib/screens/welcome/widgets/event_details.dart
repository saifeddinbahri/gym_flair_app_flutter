
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/widgets/backward_button.dart';

import '../../../shared/sizes.dart';
import 'data_container.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({
    super.key,
    required this.title,
    required this.hour,
    required this.date,
    required this.participantCount,
    required this.description,
    required this.image,
    required this.participated
  });
  final String image;
  final String title;
  final String date;
  final String hour;
  final String description;
  final String participantCount;
  final bool participated;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.network(
              image,
              fit: BoxFit.fill,
              height: screenHeight * 0.35,
              width: screenWidth,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.03,
                left: screenWidth * ConstantSizes.horizontalPadding
            ),
            child: BackwardButton(
                onPressed: () {Navigator.pop(context);},
                color: Colors.white
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight * 0.3
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * ConstantSizes.horizontalPadding,
              vertical: screenHeight * 0.01,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(ConstantSizes.circularRadius),
                topLeft: Radius.circular(ConstantSizes.circularRadius)
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      participated ? 'Participating' : 'Not participating',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: screenWidth * 0.04
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: '$participantCount ',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.04
                          ),
                          children: [
                            TextSpan(
                              text: 'people are going',
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: screenWidth * 0.04
                              ),
                            )
                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02,),
                const Divider(
                  thickness: 3,
                  height: 5,
                ),
                SizedBox(height: screenHeight * 0.02,),
                DataContainer(icon: Icons.calendar_month,content: date),
                SizedBox(height: screenHeight * 0.01,),
                DataContainer(icon: Icons.access_time, content: hour),
                SizedBox(height: screenHeight * 0.03,),
                Text(
                  description,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: screenWidth * 0.04
                  ),
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: OutlinedButton(
                        onPressed: participated ? null : () {} ,
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                            side: BorderSide(
                                color: participated ? Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05)
                                     : Theme.of(context).colorScheme.inversePrimary),
                            fixedSize: Size(
                                screenWidth * 0.4,
                                screenHeight * ConstantSizes.buttonHeight),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
                            ),
                          disabledBackgroundColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),

                        ),
                        child: Text(
                            participated ? 'Already joined' : 'Join event',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: participated ? Colors.black
                                     : Theme.of(context).colorScheme.onInverseSurface,
                                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
                            )
                        ),
                      ),
                    )
                ),
                SizedBox(height: screenHeight * 0.01,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
