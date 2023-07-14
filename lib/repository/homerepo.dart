import 'dart:convert';

import 'package:flutter_ex_ecom/models/product_model.dart';
import 'package:flutter_ex_ecom/utils/appconst.dart';
import 'package:http/http.dart' as http;

class HomeRepo {
  Future<ProductModel?> getData() async {
    String url = '${AppConst.baseUrl}products/1';
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);

    // var obj = jsonDecode(response.body);
    if (response.statusCode != 200) {
      print('Server Error : ${response.statusCode}');
      return null;
    }
    try {
      return productModelFromJson(response.body);
    } catch (e) {
      print('Erorr Catch $e');
      return null;
    }
  }
}
