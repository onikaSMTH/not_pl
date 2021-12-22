import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/hadi_models/product_model.dart';
import 'package:mini_project/httpServices/url.dart';

class SortHttpService {
  Future<dynamic> sortAsc (String sortBy) async {
    final url = Uri.parse('${URL.ipAddress}/products?sort_by_asc=$sortBy');

    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var products = content.map((dynamic item) => Product.fromMap(item)).toList();

      return products;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> sortDesc (String sortBy) async {
    final url = Uri.parse('${URL.ipAddress}/products?sort_by_desc=$sortBy');

    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var products = content.map((dynamic item) => Product.fromMap(item)).toList();

      return products;
    } catch (error) {
      throw (error);
    }
  }
}