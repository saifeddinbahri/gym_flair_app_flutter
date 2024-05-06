
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gym_flair/screens/equipments/widgets/input_field.dart';
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
  });
  final String label;
  final String price;
  final String description;
  final String image;

  @override
  State<EquipmentItemDetails> createState() => _EquipmentItemDetailsState();
}

class _EquipmentItemDetailsState extends State<EquipmentItemDetails> {
  final TextEditingController _dateStart = TextEditingController();
  final TextEditingController _dateEnd = TextEditingController();
  DateTime? selectedDate;
  final _formKey = GlobalKey<FormState>();
  final _focusNodeStart = FocusNode();
  final _focusNodeEnd = FocusNode();

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
                widget.image,
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
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: screenHeight* 0.15,
                    width: screenWidth * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const InputLabel(label: 'Start date'),
                        SizedBox(height: screenHeight * 0.015,),
                        InputField(
                          readOnly: true,
                          controller: _dateStart,
                          focusNode: _focusNodeStart,
                          context: context,
                          icon: IconButton(
                            onPressed: (){setStartDate(context);},
                            icon: const Icon(Icons.calendar_month),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Please fill this field";
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight* 0.15,
                    width: screenWidth * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const InputLabel(label: 'End date'),
                        SizedBox(height: screenHeight * 0.015,),
                        InputField(
                          readOnly: true,
                          focusNode: _focusNodeEnd,
                          controller: _dateEnd,
                          context: context,
                          icon: IconButton(
                            onPressed: (){setEndDate(context);},
                            icon: const Icon(Icons.calendar_month),
                          ),
                          validator: (value) {
                            if(value == null || value.isEmpty){
                              return "Please fill this field";
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
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

  Future<String> _selectDate(BuildContext context) async {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null) {
      return dateFormat.format(picked);
    }
    return '';
  }

  void setStartDate(BuildContext context) async{
    _dateStart.text = await _selectDate(context);
    _focusNodeStart.unfocus();
  }

  void setEndDate(BuildContext context) async{
    _dateEnd.text = await _selectDate(context);
    _focusNodeEnd.unfocus();
  }

  void submit() {
    if(_formKey.currentState!.validate()) {
      var start = DateFormat("dd-MM-yyyy").parse(_dateStart.text);
      var end = DateFormat("dd-MM-yyyy").parse(_dateEnd.text);
      log(end.difference(start).inDays.toString());
    }
  }

}

