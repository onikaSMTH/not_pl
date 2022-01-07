import 'package:http/http.dart' as http;
import 'package:mini_project/httpServices/url.dart';

class LikeHttpService {
  Future<dynamic> addLike(String token, int ? id) async {
    final url = Uri.parse('${URL.ipAddress}/products/$id/like');

    try {
      final response = await http.post(
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

  Future<dynamic> removeLike(String token, int ? id) async {
    final url = Uri.parse('${URL.ipAddress}/products/$id/deleteLike');

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
