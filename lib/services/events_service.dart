
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../bottom_navigation_page.dart';
import '../shared/widgets/dialogs.dart';
import 'constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EventsService {
  final url = Uri.parse('http://${Constants.url}/event');
  final url1 = Uri.parse('http://${Constants.url}/event/join');

  final storage = const FlutterSecureStorage();


  Future<List<dynamic>> getEvents() async {
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
      return [];
    }
    if (response.statusCode == 404 || response.statusCode == 500 || response.statusCode == 401) {
      return [];
    }
    return jsonDecode(response.body)['events'];
  }

  Future<int> joinEvents(String id,BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    String? token = await storage.read(key: 'token');
    http.Response? response;
    try {
      response = await http.post(url1,
          headers: {
            'Authorization':'Bearer $token',
            "Content-Type": "application/json"
          },
          body: jsonEncode({'eventId': id})
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

}