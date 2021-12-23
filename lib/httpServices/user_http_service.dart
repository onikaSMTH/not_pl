import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/models/product_model.dart';
import 'package:mini_project/models/user_model.dart';
import 'package:mini_project/httpServices/url.dart';

class UserHttpService {
  Future<dynamic> registerUser(String name, String email, String password,
      String passwordConfirmation) async {
    final url = Uri.parse('${URL.ipAddress}/auth/register');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation
        }),
      );

      var jsonData = jsonDecode(response.body);
      var token = jsonData['data']['token'];
      var user = User.fromMap(jsonData['data']['user']);

      return [user, token];
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> loginUser(String email, String password) async {
    final url = Uri.parse('${URL.ipAddress}/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
      var jsonData = jsonDecode(response.body);
      var token = jsonData['data']['token'];
      var user = User.fromMap(jsonData['data']['user']);

      print(token);
      return [user, token];
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> logoutUser(String token) async {
    final url = Uri.parse('${URL.ipAddress}/auth/logout');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonData = jsonDecode(response.body);

      return jsonData;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> updateUser(String token, String name, String email,
      String password, String password_confirmation) async {
    final url = Uri.parse('${URL.ipAddress}/users/update');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation
        }),
      );
      var jsonData = jsonDecode(response.body);
      var user = User.fromMap(jsonData['data']);

      return user;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> userFavoritesProducts(String token) async {
    final url = Uri.parse('${URL.ipAddress}/user/likes');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var products =
          content.map((dynamic item) => Product.fromMap(item)).toList();

      return products;
    } catch (error) {
      throw (error);
    }
  }
}
