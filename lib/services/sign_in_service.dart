
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bottom_navigation_page.dart';
import '../shared/widgets/dialogs.dart';
import 'constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInService {
  final url = Uri.parse('http://${Constants.url}/user/signin');
  final storage = const FlutterSecureStorage();
  Future<void> signIn(BuildContext context, bool mounted, Map<String, String> data) async {
    loadingDialog(context);
    Size size = MediaQuery.of(context).size;
    http.Response? response;

    try {
      response = await http.post(url,
        headers: { "Content-Type": "application/json" },
        body: jsonEncode(data)
      ).timeout(const Duration(seconds: 6));
    } catch (error) {
      log(error.toString());
      response = null;
    }
    if(mounted) Navigator.of(context, rootNavigator: true).pop();
    if (response == null) {
      errorDialog(context, size, 'An error occurred');
    } else {
      if (response.statusCode == 401) {
        log(response.body);
        errorDialog(context, size, 'Invalid credentials');
      } else if(response.statusCode == 200) {
        Future.delayed(Duration.zero, () async {
          await storage.write(
              key: 'token', value: jsonDecode(response!.body)['token']);
        }).then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigation()
              ),
              ModalRoute.withName("/Home")
          );
        });
      }
    }
  }
}