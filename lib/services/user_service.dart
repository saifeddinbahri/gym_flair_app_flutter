
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../bottom_navigation_page.dart';
import '../shared/widgets/dialogs.dart';
import 'constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  final url = Uri.parse('http://${Constants.url}/user/profile');
  final url1 = Uri.parse('http://${Constants.url}/user/edit-profile-photo');
  final url2 = Uri.parse('http://${Constants.url}/user/edit-username');
  final url3 = Uri.parse('http://${Constants.url}/user/edit-birth');
  final url4 = Uri.parse('http://${Constants.url}/user/edit-email');
  final url5 = Uri.parse('http://${Constants.url}/user/edit-password');

  final storage = const FlutterSecureStorage();


  Future<Map<String,dynamic>> getProfileData() async {
    String? token = await storage.read(key: 'token');
    http.Response? response;
    try {
      response = await http.get(url,
          headers: {
            'Authorization':'Bearer $token',
          },
      );
    } catch (error) {
      log(error.toString());
      return {};
    }
    log(response.statusCode.toString());
    if (response.statusCode == 404 || response.statusCode == 500 || response.statusCode == 401) {
      return {};
    }
    return jsonDecode(response.body);
  }

  Future<String> updateImage(XFile file) async {
    String? token = await storage.read(key: 'token');
    http.StreamedResponse? response;
    var request = http.MultipartRequest('POST',url1);
    request.files.add(await http.MultipartFile.fromPath('image', file.path));
    request.headers['Authorization'] = 'Bearer $token';
    try {
      response = await request.send();
    } catch (error) {
      log(error.toString());
      return '';
    }
    log(response.statusCode.toString());
    if (response.statusCode == 404 || response.statusCode == 500 || response.statusCode == 401) {
      return '';
    }
    var data = await http.Response.fromStream(response);
    return jsonDecode(data.body)['photo'];
  }

  Future<int> editUsername(String username, BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    String? token = await storage.read(key: 'token');
    http.Response? response;
    try {
      response = await http.post(url2,
        headers: {
          'Authorization':'Bearer $token',
          "Content-Type": "application/json"
        },
        body: jsonEncode({'username': username})
      );
    } catch(error) {
      log(error.toString());
      response = null;
    }
    if (response == null) {
      errorDialog(context, size, 'An error as occurred');
    } else {
      var data = jsonDecode(response.body);
      if( response.statusCode == 200) {
        return 1;
      } else if (response.statusCode == 409) {
        errorDialog(context, size, data['message']);
      } else {
        errorDialog(context, size, 'Failed to update');
      }
    }
    return 0;
  }

  Future<int> editEmail(String email, BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    String? token = await storage.read(key: 'token');
    http.Response? response;
    try {
      response = await http.post(url4,
          headers: {
            'Authorization':'Bearer $token',
            "Content-Type": "application/json"
          },
          body: jsonEncode({'email': email})
      );
    } catch(error) {
      log(error.toString());
      response = null;
    }
    if (response == null) {
      errorDialog(context, size, 'An error as occurred');
    } else {
      var data = jsonDecode(response.body);
      if( response.statusCode == 200) {
        return 1;
      } else if (response.statusCode == 409) {
        errorDialog(context, size, data['message']);
      } else {
        errorDialog(context, size, 'Failed to update');
      }
    }
    return 0;
  }

  Future<int> editBirth(String birth, BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    String? token = await storage.read(key: 'token');
    http.Response? response;
    try {
      response = await http.post(url4,
          headers: {
            'Authorization':'Bearer $token',
            "Content-Type": "application/json"
          },
          body: jsonEncode({'email': birth})
      );
    } catch(error) {
      log(error.toString());
      response = null;
    }
    if (response == null) {
      errorDialog(context, size, 'An error as occurred');
    } else {
      var data = jsonDecode(response.body);
      if( response.statusCode == 200) {
        return 1;
      } else {
        errorDialog(context, size, 'Failed to update');
      }
    }
    return 0;
  }

  Future<int> editPassword(String password, String newPassword,BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    String? token = await storage.read(key: 'token');
    http.Response? response;
    try {
      response = await http.post(url5,
          headers: {
            'Authorization':'Bearer $token',
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            'currentPassword': password,
            'newPassword': newPassword,
          })
      );
    } catch(error) {
      log(error.toString());
      response = null;
    }
    if (response == null) {
      errorDialog(context, size, 'An error as occurred');
    } else {
      var data = jsonDecode(response.body);
      if(response.statusCode == 200) {
        return 1;
      }
      else if (response.statusCode == 401) {
        errorDialog(context, size, data['message']);
      } else {
        log(response.statusCode.toString());
        errorDialog(context, size, 'Failed to update');
      }
    }
    return 0;
  }
}