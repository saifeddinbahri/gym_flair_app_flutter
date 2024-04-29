
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
      height: screenHeight * 0.15,
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
          SizedBox(height: screenHeight * 0.02,),
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
                  Text(
                    'Courses',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                  ),
                  Text(
                    'Events',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
