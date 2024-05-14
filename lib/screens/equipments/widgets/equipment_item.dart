import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gym_flair/screens/cours/widgets/reservation_dialog.dart';
import 'package:gym_flair/screens/equipments/widgets/equipment_item_details.dart';
import 'package:shimmer/shimmer.dart';
import '../../../services/constant.dart';
import '../../../shared/sizes.dart';

class EquipmentItem extends StatelessWidget {
  const EquipmentItem({
    super.key,
    required this.label,
    required this.price,
    required this.description,
    required this.image,
    required this.id,
    required this.callback,
  });
  final String label;
  final int price;
  final void Function() callback;
  final String id;
  final String description;
  final String image;


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
            backgroundColor: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.05)
        ),
        onPressed: () async {
          var res = await Navigator.push(
              context,
              _createRoute()
          );
          if (res != null && res == 1 ) {
            callback();
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
                      label,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    RichText(
                        text: TextSpan(
                          text: '${price}DT ',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: screenWidth *0.045,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.inverseSurface
                          ),
                         children: [
                           TextSpan(
                             text: '/hour',
                             style: Theme.of(context).textTheme.labelLarge!.copyWith(
                               fontSize: screenWidth * 0.04
                             )
                           )
                         ]
                    ),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(ConstantSizes.circularRadius),
                  child: Image.network(
                    '${Constants.imageUrl}$image',
                    fit: BoxFit.fill,
                    height: screenHeight * 0.15,
                    width: screenWidth *0.35,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loading) {
                      if (loading != null) {
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.1),
                          highlightColor: Theme.of(context).colorScheme.inversePrimary!.withOpacity(0.03),
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
              ],
            ),
          ],
        )
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EquipmentItemDetails(
          label: label,
          id: id,
          price: price,
          description: description,
          image: image),
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
