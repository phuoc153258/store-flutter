import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String GetListCategory =
      "https://fakestoreapi.com/products/categories";
  static const String GetProductByCategory =
      "https://fakestoreapi.com/products/category/";
}

class CategoryProvider extends ChangeNotifier {
  List<dynamic> list = [];

  void getList() async {
    String apiUrl = ProductService.GetListCategory;

    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);

    list = jsonObject;
    list.insert(0, "All");
    notifyListeners();
  }
}
