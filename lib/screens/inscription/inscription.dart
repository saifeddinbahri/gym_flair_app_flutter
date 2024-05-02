
import 'package:flutter/material.dart';
import 'package:gym_flair/screens/inscription/controller/inscription_form_controller.dart';
import 'package:gym_flair/screens/inscription/widgets/input_label.dart';
import 'package:gym_flair/screens/inscription/widgets/inscription_submit_button.dart';
import 'package:gym_flair/screens/inscription/widgets/inscription_text_field.dart';

import 'package:gym_flair/shared/sizes.dart';
import 'package:gym_flair/shared/widgets/backward_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({super.key});

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _pickImage = TextEditingController();
  final InscriptionController _formController = InscriptionController();

  bool _hidePassword = true;
  int? day;
  int? month;
  int? year;
  DateTime? selectedDate;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: screenWidth*ConstantSizes.horizontalPadding,
                left: screenWidth*ConstantSizes.horizontalPadding,
                top: screenHeight*0.1
            ),
            child: Form(
                key: _formKey,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BackwardButton(
                            onPressed: (){Navigator.pop(context);},
                            color: Theme.of(context).colorScheme.surfaceVariant,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight*0.04,
                    ),
                    Text('Sign up',
                      style: TextStyle(
                          fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                          fontWeight: FontWeight.w500
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenHeight*0.04,
                    ),
                    const InscriptionInputLabel(label: 'Username'),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    InscriptionFormField(
                      context: context,
                      controller: _username,
                      hintText: 'Enter username',
                      validator: (value) => _formController.validateUsername(value),
                    ),
                    SizedBox(
                      height: screenHeight*0.03,
                    ),
                    const InscriptionInputLabel(label: 'Profile image'),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    InscriptionFormField(
                      context: context,
                      controller: _pickImage,
                      readOnly: true,
                      onTap: () {getImage();},
                      hintText: 'Select image',
                      validator: (value) => _formController.validateUsername(value),
                    ),
                    SizedBox(
                      height: screenHeight*0.03,
                    ),
                    const InscriptionInputLabel(label: 'Email'),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    InscriptionFormField(
                      context: context,
                      controller: _email,
                      hintText: 'Enter email',
                      validator: (value) => _formController.validateEmail(value),
                    ),
                    SizedBox(
                      height: screenHeight*0.03,
                    ),
                    const InscriptionInputLabel(label: 'Birthdate'),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    InscriptionFormField(
                      readOnly: true,
                      context: context,
                      onTap: (){_selectDate(context);},
                      controller: _date,
                      hintText: 'pick a date',
                      validator: (value) => _formController.validateDate(value),
                    ),
                    SizedBox(
                      height: screenHeight*0.03,
                    ),
                    const InscriptionInputLabel(label: 'Password'),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    InscriptionFormField(
                      context: context,
                      controller: _password,
                      hintText: 'Enter password',
                      validator:  (value) => _formController.validatePassword(value),
                      obscureText: _hidePassword,
                      icon: IconButton(
                        icon: Icon(_hidePassword ? Icons.visibility: Icons.visibility_off),
                        onPressed: () => setState(() {
                          _hidePassword = !_hidePassword;
                        }),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight*0.03,
                    ),
                    const InscriptionInputLabel(label: 'Confirm Password'),
                    SizedBox(
                      height: screenHeight*0.01,
                    ),
                    InscriptionFormField(
                      context: context,
                      controller: _confirmPassword,
                      hintText: 'Re enter password',
                      validator:  (value) => _formController.confirmPassword(value, _password.value.text),
                      obscureText: _hidePassword,
                    ),
                   SizedBox(
                     height: screenHeight*0.055,
                   ),
                    InscriptionSubmitButton(
                      onPressed: () { _formController.submitInscription(_formKey); },
                      text: 'Confirm',
                    ),
                    SizedBox(
                      height: screenHeight*0.03,
                    ),
          
                  ],
                )
            ),
          ),
        )
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
        print(month);
        print(day);
        print(year);
      });
    }
  }

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _pickImage.text = image!.name;
    });
  }
}
