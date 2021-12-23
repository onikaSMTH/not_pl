import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/httpServices/url.dart';

class SearchHttpService {
  Future<dynamic> searchByName(String name) async {
    final url = Uri.parse('${URL.ipAddress}/products?name=$name');

    try {
      final response = await http.get(url);

      final jsonData = jsonDecode(response.body);
      final content = jsonData['data'];
      var result =
          content.map((dynamic item) => Product.fromMap(item)).toList();

      return result;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> searchByExpirationDate(String date) async {
    final url = Uri.parse('${URL.ipAddress}/products?date=$date');

    try {
      final response = await http.get(url);

      final jsonData = jsonDecode(response.body);
      final content = jsonData['data'];
      var result =
          content.map((dynamic item) => Product.fromMap(item)).toList();

      return result;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> searchByCategory(String categories) async {
    final url = Uri.parse('${URL.ipAddress}/products?category=$categories');

    try {
      final response = await http.get(url);

      final jsonData = jsonDecode(response.body);
      final content = jsonData['data'];
      var result =
          content.map((dynamic item) => Product.fromMap(item)).toList();

      return result;
    } catch (error) {
      throw error;
    }
  }
}
