import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/httpServices/url.dart';
import 'package:mini_project/models/category_model.dart';
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/providers/products.dart';
import 'package:provider/provider.dart';

class HttpService {
  Future<dynamic> getProducts() async {
    final url = Uri.parse('${URL.ipAddress}/products');

    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var products =
      content.map((dynamic item) => Product.fromMap(item)).toList();
      return products;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> showProduct(int ? id) async {
    final url = Uri.parse('${URL.ipAddress}/products/$id');

    try {
      final response = await http.get(url);

      var jsonDate = jsonDecode(response.body);
      var content = jsonDate['data'];
      var product = Product.fromMap(content);

      return product;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> getProductCategories(int ? id) async {
    final url = Uri.parse('${URL.ipAddress}/products/$id/categories');

    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var categories = content.map((dynamic item) => Category.fromMap(item)).toList();

      // print(categories);
      return categories;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> createProduct(
      Product product,
      String token,
      dynamic categories,
      double discount1,
      String date1start,
      String date1end,
      String discount2,
      String date2start,
      String date2end,
      String discount3,
      String date3start,
      String date3end,
      ) async {
    final url = Uri.parse('${URL.ipAddress}/user/create/product');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "name": product.name,
          "expiration_date": product.expirationDate,
          "contact_info": product.contactInfo,
          "quantity": product.quantity,
          "price": product.price,
          "image": product.image,
          "categories": categories, // must be an array, like: [0,1,2]
          "discount1": discount1,
          "date1start": date1start,
          "date1end": date1end,
          "discount2": discount2,
          "date2start": date2start,
          "date2end": date2end,
          "discount3": discount3,
          "date3start": date3start,
          "date3end": date3end
        }),
      );
      var jsonDate = jsonDecode(response.body);
      var content = jsonDate['data'];
      var newProduct = Product.fromMap(content);

      return newProduct;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> getUserProducts(String token) async {
    final url = Uri.parse('${URL.ipAddress}/user/products');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },);
      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var products =
      content.map((dynamic item) => Product.fromMap(item)).toList();

      return products;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> updateProduct(
      String token,
      Product updatedProduct,
      dynamic categories,
      int ? id,
      double discount1,
      String date1start,
      String date1end,
      double discount2,
      String date2start,
      String date2end,
      double discount3,
      String date3start,
      String date3end,
      ) async {
    final url = Uri.parse(
        '${URL.ipAddress}/user/update/product/${id}');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "name": updatedProduct.name,
          "contact_info": updatedProduct.contactInfo,
          "quantity": updatedProduct.quantity,
          "price": updatedProduct.price,
          "image": updatedProduct.image,
          "categories": categories,
          "discount1": discount1,
          "date1start": date1start,
          "date1end": date1end,
          "discount2": discount2,
          "date2start": date2start,
          "date2end": date2end,
          "discount3": discount3,
          "date3start": date3start,
          "date3end": date3end
        }),
      );
      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var product = Product.fromMap(content);

      return product;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> deleteProduct(String token, int ? id) async {
    final url = Uri.parse('${URL.ipAddress}/user/delete/product/$id');

    try {
      final response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var product = Product.fromMap(content);

      return product;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> getCategories() async {
    final url = Uri.parse('${URL.ipAddress}/categories');

    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var categories = content.map((dynamic item) => Category.fromMap(item)).toList();

      return categories;
    } catch (error) {
      throw (error);
    }
  }
}

