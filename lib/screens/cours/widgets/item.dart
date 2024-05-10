import 'package:flutter/material.dart';
import 'package:gym_flair/screens/cours/widgets/reservation_dialog.dart';
import '../../../shared/sizes.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.title,
    required this.date,
    required this.capacity,
    required this.hour,
    required this.end,
    required this.count,
    required this.valid,
    required this.trainer,
    required this.callback,
    required this.id
  });
  final String title;
  final String id;
  final String date;
  final String count;
  final String hour;
  final String end;
  final Map<String, dynamic> trainer;
  final bool valid;
  final String capacity;
  final void Function() callback;

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
          backgroundColor: valid ?
          Theme.of(context).colorScheme.surfaceVariant :
          Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05)
        ),
        onPressed: () async{
          if (!valid) {
            var res = await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ReservationDialog(
                      title: title,
                      id: id,
                      capacity: capacity,
                      count: count,
                      time: hour,
                      end: end,
                      date: date,
                      trainer: trainer,
                  );
                }
            );
            if (res!= null && res == 1) {
              callback();
            }
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      date,
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hour,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text(
                      end,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    Text(
                      '$count/$capacity',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                  Icon(
                     valid ? Icons.check_circle : Icons.circle_outlined
                  )
              ],
            ),
          ],
        )
    );
  }
}
