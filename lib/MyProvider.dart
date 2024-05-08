import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'User.dart';

class MyProvider extends ChangeNotifier {

  List<User> _users = [];

  List<User> get user => _users;

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode==200){
      final List<dynamic> data = json.decode(response.body);
      _users = data.map((e) => User.fromJson(e)).toList();
      notifyListeners();
    }
    else {
      throw Exception('Failed to load post');
    }
  }


}