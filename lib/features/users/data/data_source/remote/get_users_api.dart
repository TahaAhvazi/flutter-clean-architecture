import 'dart:convert';

import 'package:flutter_json_clean/core/constant.dart';
import 'package:flutter_json_clean/features/users/data/models/users.dart';
import 'package:http/http.dart' as http;

class UsersApiService {
  Future<List<UsersModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => UsersModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load the Users!");
    }
  }
}
