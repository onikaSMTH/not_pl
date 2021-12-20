import 'package:http/http.dart' as http;

class LikeHttpService {
  Future<dynamic> addLike(String token, int id) async {
    final url = Uri.parse('http://192.168.1.103:8000/products/$id/like');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print(response.body);
      return (response.body);
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> removeLike(String token, int id) async {
    final url = Uri.parse('http://192.168.1.103:8000/products/$id/deleteLike');

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return (response.body);
    } catch (error) {
      throw (error);
    }
  }
}