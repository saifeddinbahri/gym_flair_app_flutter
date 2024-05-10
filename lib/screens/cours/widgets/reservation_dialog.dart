
import 'package:flutter/material.dart';
import 'package:gym_flair/services/constant.dart';
import 'package:gym_flair/services/courses_service.dart';
import '../../../shared/sizes.dart';

class ReservationDialog extends StatelessWidget {
  const ReservationDialog({
    super.key,
    required this.title,
    required this.time,
    required this.date,
    required this.end,
    required this.count,
    required this.capacity,
    required this.trainer,
    required this.id
  });
  final String title;
  final String id;
  final String time;
  final String end;
  final String count;
  final String capacity;
  final String date;
  final Map<String, dynamic> trainer;


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
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight:FontWeight.w400
                    ),
                  ),
                ),
              ),
              Icon(
                  Icons.person,
                  size: screenWidth * 0.1,
              ),
              Text(
                '$count/$capacity',
                  style: Theme.of(context).textTheme.headlineLarge
              ),
            ],
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
                  'Coach',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: screenWidth * 0.045
                  )
                ),
                SizedBox(height: screenHeight * 0.01,),
                const Divider(
                  thickness: 2,
                  height: 5,
                ),
                SizedBox(height: screenHeight * 0.01,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        '${Constants.imageUrl}${trainer['photo']}'
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                      radius: screenWidth *0.07,
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${trainer['firstname']} ${trainer['lastname']}',
                              style: Theme.of(context).textTheme.labelLarge!.copyWith(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: screenWidth * 0.46,
                  child: dataContainer('Start', time, context)
              ),
              SizedBox(
                  width: screenWidth * 0.46,
                  child: dataContainer('End', end, context)
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                onPressed: (){
                  submit(context);
                },
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
            thickness: 2,
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
  void submit( BuildContext context) async {

      var service = CoursesService();
      var res = await service.bookCourse(id, context);
      if (res == 1) {
        Navigator.pop(context,1);
      }

  }
}
