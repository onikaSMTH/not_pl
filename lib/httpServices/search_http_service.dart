import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/models/product_model.dart';

class SearchHttpService {
  Future<dynamic> searchByName (String name) async {
    final url = Uri.parse('http://192.168.1.103:8000/products?name=$name');

    try {
      final response = await http.get(url);

      final jsonData = jsonDecode(response.body);
      final content = jsonData['data'];
      var result = content.map((dynamic item) => Product.fromMap(item)).toList();

      return result;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> searchByExpirationDate (String date) async {
    final url = Uri.parse('http://192.168.1.103:8000/products?date=$date');

    try {
      final response = await http.get(url);

      final jsonData = jsonDecode(response.body);
      final content = jsonData['data'];
      var result = content.map((dynamic item) => Product.fromMap(item)).toList();

      return result;
    } catch (error) {
      throw error;
    }
  }

  Future<dynamic> searchByCategory (String categories) async {
    final url = Uri.parse('http://192.168.1.103:8000/products?category=$categories');

    try {
      final response = await http.get(url);

      final jsonData = jsonDecode(response.body);
      final content = jsonData['data'];
      var result = content.map((dynamic item) => Product.fromMap(item)).toList();

      return result;
    } catch (error) {
      throw error;
    }
  }




}