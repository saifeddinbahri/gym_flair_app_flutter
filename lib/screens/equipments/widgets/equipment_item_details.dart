
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gym_flair/screens/equipments/widgets/input_field.dart';
import 'package:gym_flair/services/constant.dart';
import 'package:gym_flair/services/equipments_service.dart';
import 'package:gym_flair/shared/widgets/backward_button.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/sizes.dart';
import '../../../shared/widgets/input_label.dart';

class EquipmentItemDetails extends StatefulWidget {
  const EquipmentItemDetails({
    super.key,
    required this.label,
    required this.price,
    required this.description,
    required this.image,
    required this.id,
  });
  final String label;
  final int price;
  final String id;
  final String description;
  final String image;

  @override
  State<EquipmentItemDetails> createState() => _EquipmentItemDetailsState();
}

class _EquipmentItemDetailsState extends State<EquipmentItemDetails> {
  
  int currentIndex = 1;
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * ConstantSizes.inputVerticalPadding,
            horizontal: screenWidth * ConstantSizes.inputHorizontalPadding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackwardButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Theme
                        .of(context)
                        .colorScheme
                        .surfaceVariant
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.015),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  ConstantSizes.circularRadius),
              child: Image.network(
                '${Constants.imageUrl}${widget.image}',
                fit: BoxFit.fill,
                height: screenHeight * 0.4,

                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loading) {
                  if (loading != null) {
                    return Shimmer.fromColors(
                      baseColor: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary
                          .withOpacity(0.1),
                      highlightColor: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary!
                          .withOpacity(0.03),
                      child: Container(
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.35,
                        color: Colors.white,
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.label,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(
                      fontWeight: FontWeight.w400
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: '${widget.price} ',
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .inverseSurface
                      ),
                      children: [
                        TextSpan(
                            text: '/hour',
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                fontSize: screenWidth * 0.04
                            )
                        )
                      ]
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                offer(context, 1, '01h'),
                offer(context, 2, '02h'),
                offer(context, 3, '03h'),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: screenWidth * 0.04
              ),
            ),
            Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: OutlinedButton(
                    onPressed: submit ,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                      side: BorderSide(
                          color: Theme.of(context).colorScheme.inversePrimary),
                      fixedSize: Size(
                          screenWidth ,
                          screenHeight * ConstantSizes.buttonHeight),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ConstantSizes.circularRadius)
                      ),
                      disabledBackgroundColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05),

                    ),
                    child: Text(
                        'Rent now',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onInverseSurface,
                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
                        )
                    ),
                  ),
                )
            ),
            SizedBox(height: screenHeight * 0.01,)
          ],
        ),
      ),
    );
  }

  Widget offer(BuildContext context, int index, String text) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
          height: screenHeight* 0.15,
          width: screenWidth * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
              color: currentIndex == index ?
              Theme.of(context).colorScheme.surfaceVariant :
              Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05)
          ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ) ,
      ),
    );
  }

  void submit() async {

    var start = DateTime.now();
    var end = start.add(Duration(hours: currentIndex));
    var service = EquipmentsService();
    var res = await service.reserveEquipment(widget.id, start.toIso8601String(), end.toIso8601String(), context);
    log(res.toString());
    if (res == 1) {
      Navigator.pop(context,1);
    }
  }

}

