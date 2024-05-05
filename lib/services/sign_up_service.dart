
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../shared/widgets/dialogs.dart';
import 'constant.dart';

class SignUpService {
  final url = Uri.parse('http://${Constants.url}/user/signup');

  Future<void> signUp(BuildContext context, bool mounted, Map<String,dynamic> data) async {
    loadingDialog(context);
    Size size = MediaQuery.of(context).size;
    var request = http.MultipartRequest('POST', url);
    http.StreamedResponse? response;
    request.files.add(await http.MultipartFile.fromPath('image', data['image'].path));
    request.fields['username'] = data['username'];
    request.fields['birth'] = data['birth'];
    request.fields['email'] = data['email'];
    request.fields['password'] = data['password'];
    request.fields['role'] = 'adherant';
    try {
      response = await request.send();
    } catch(error) {
      response = null;
    }
    if(mounted) Navigator.of(context, rootNavigator: true).pop();
    if (response == null) {
      errorDialog(context, size, 'an error occured');
    } else {
      errorDialog(context, size, 'You registred successfuly');
    }


  }
}