import 'dart:convert';

import 'package:learn_api/users_modal.dart';
import 'package:http/http.dart' as http;

class UsersDetails {
  Future<List<UsersModel>> getImage() async {
    var apiUrl = Uri.parse("https://api.unsplash.com/photos");
    var headers = {
      "Authorization": 'Client-ID E_wuGUqCN5SoXjyI0S1vq5Yd2wmirPjWGdHhmerPELg'
    };
    var responce = await http.get(apiUrl, headers: headers);
    if (responce.statusCode == 200) {
      print("secc");
      var decode = jsonDecode(responce.body)as List;
      var data = decode.map((json) => UsersModel.fromJson(json)).toList();
      return data;
    } else {
      return [];
    }
  }
}
