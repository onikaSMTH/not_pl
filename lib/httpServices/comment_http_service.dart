import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/hadi_models/comment_model.dart';

class CommentHttpService {
  Future<dynamic> getProductComments(int id) async {
    final url = Uri.parse('http://192.168.1.103:8000/products/$id/comments');

    try {
      final response = await http.get(url);

      var jsonData = jsonDecode(response.body);
      var content = jsonData['data'];
      var comments = content.map((dynamic item) => Comment.fromMap(item)).toList();

      return comments;
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> createComment(String token, int id, String content) async {
    final url = Uri.parse('http://192.168.1.103:8000/products/$id/create/comment');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "content": content
        }),
      );

      var jsonData = jsonDecode(response.body);
      var jsonContent = jsonData['data'];
      var comment = Comment.fromMap(jsonContent);

      // print(comment);
      return comment;

    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> deleteComment (String token, int id) async {
    final url = Uri.parse('http://192.168.1.103:8000/products/delete/comments/$id');

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