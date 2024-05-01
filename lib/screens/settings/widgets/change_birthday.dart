import 'package:flutter/material.dart';
import 'package:gym_flair/screens/settings/widgets/input_label.dart';
import 'package:gym_flair/screens/settings/widgets/submit_button.dart';
import 'package:gym_flair/screens/settings/widgets/text_field.dart';
import 'package:intl/intl.dart';

import '../../../shared/sizes.dart';
import '../../../shared/widgets/backward_button.dart';

class ChangeBirthday extends StatefulWidget {
  const ChangeBirthday({super.key});

  @override
  State<ChangeBirthday> createState() => _ChangeBirthdayState();
}

class _ChangeBirthdayState extends State<ChangeBirthday> {

  final TextEditingController _date = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? day;
  int? month;
  int? year;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * ConstantSizes.horizontalPadding,
            right: screenWidth * ConstantSizes.horizontalPadding,
            top: screenHeight * 0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackwardButton(
                  onPressed: (){Navigator.pop(context);},
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Change birthday',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: screenHeight * 0.03),
            const InputLabel(label: 'New birthday'),
            SizedBox(height: screenHeight * 0.01),
            Form(
              key: _formKey,
              child: SettingsFormField(
                readOnly: true,
                context: context,
                onTap: (){_selectDate(context);},
                controller: _date,
                hintText: 'pick a date',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            SubmitButton(
              text: 'Confirm',
              onPressed: () {
                _formKey.currentState!.validate();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: dateFormat.format(picked));
        day = int.parse(selectedDate.toString().substring(8,10));
        month = int.parse(selectedDate.toString().substring(5, 7));
        year = int.parse(selectedDate.toString().substring(0,4));
      });
    }
  }
}
