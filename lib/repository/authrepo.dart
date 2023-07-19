import 'dart:convert';

import 'package:flutter_ex_ecom/utils/appconst.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  //login
  Future<String> loginUser(String username, String password) async {
    String url = '${AppConst.baseUrl}auth/login';

    Map<String, String> body = {'username': username, 'password': password};

    var response = await http.post(Uri.parse(url), body: body);

    print(response.statusCode);
    print(response.body);

    // var obj = jsonDecode(response.body);
    if (response.statusCode != 200) {
      print('Server Error : ${response.statusCode}');
      return 'NA';
    }
    try {
      return jsonDecode(response.body)['token'];
    } catch (e) {
      print('Erorr Catch $e');
      return 'NA';
    }
  }
}
