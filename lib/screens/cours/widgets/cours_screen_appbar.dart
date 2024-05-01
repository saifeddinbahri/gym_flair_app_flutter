
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_flair/shared/sizes.dart';

class CoursesScreenAppbar extends StatelessWidget {
  const CoursesScreenAppbar({
    super.key,
    required this.title,
    required this.controller
  });
  final String title;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * 0.16,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 5,
              blurStyle: BlurStyle.normal,
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:EdgeInsets.only(
                top: screenHeight * 0.06,
                left: screenWidth * ConstantSizes.horizontalPadding
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(height: screenHeight * 0.01,),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TabBar(
                controller: controller,
                dividerColor: Colors.transparent,
                dividerHeight: 0,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
                ),
                tabs: [
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.13 ,
                        vertical: screenHeight *0.01
                    ),
                    child: Text(
                      'Classes',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.13 ,
                        vertical: screenHeight *0.01
                    ),
                    child: Text(
                      'Events',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01,),
        ],
      ),
    );
  }
}
