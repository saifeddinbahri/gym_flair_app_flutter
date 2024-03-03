
import 'package:flutter/cupertino.dart';

class LoginFormController {

  String? validateUsername(String? value) {
    if(value == null || value.isEmpty){
      return "Please fill this field";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if(value == null || value.isEmpty){
      return "Please fill this field";
    }
    return null;
  }

  void submitLogin(GlobalKey<FormState> formKey) {
    formKey.currentState!.validate();
  }

}