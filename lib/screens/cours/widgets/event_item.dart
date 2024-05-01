
import 'package:flutter/material.dart';
import 'package:gym_flair/screens/welcome/widgets/event_details.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/sizes.dart';
import '../../welcome/widgets/data_container.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.title,
    required this.hour,
    required this.date,
    required this.participantCount,
    required this.description,
    required this.image,
    required this.participated,
  });
  final bool participated;
  final String image;
  final String title;
  final String date;
  final String hour;
  final String description;
  final String participantCount;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * ConstantSizes.inputVerticalPadding,
                horizontal: screenWidth * ConstantSizes.inputHorizontalPadding
            ),
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
            ),
            backgroundColor: participated ?
            Theme.of(context).colorScheme.surfaceVariant :
            Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05)
        ),
        onPressed: (){
          Navigator.push(
            context,
            _createRoute()
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
              child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  height: screenHeight * 0.26,
                  width: screenWidth,
                  loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loading) {
                   if (loading == null) {
                     return child;
                   }
                   return Shimmer.fromColors(
                       baseColor: Colors.grey[300]!,
                       highlightColor:Colors.grey[100]!,
                       child: Container(
                         height: screenHeight * 0.26,
                         width: screenWidth,
                         color: Colors.white,
                       ),
                       );
                  },
              ),
            ),
            SizedBox(height: screenHeight * 0.01,),
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
            DataContainer(icon: Icons.access_time, content: hour)
          ],
    )
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EventDetails(
          title: title,
          hour: hour,
          date: date,
          participantCount: participantCount,
          description: description,
          image: image,
          participated: participated
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}
