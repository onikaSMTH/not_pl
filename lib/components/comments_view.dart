import 'package:flutter/material.dart';
import 'package:mini_project/colors.dart';
import 'package:mini_project/httpServices/comment_http_service.dart';
import 'package:mini_project/providers/products.dart';
import 'package:mini_project/providers/single_product.dart';
import 'package:mini_project/providers/token_provider.dart';
import 'package:provider/provider.dart';

class CommentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var comments = Provider.of<SingleProduct>(context).getComments();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(
                  Icons.person,
                  color: mainColor,
                ),
                title: Text(comments[index].content.toString()),
                tileColor: niceColor,
                trailing: comments[index].user_id ==
                        Provider.of<CurrentUserToken>(context).getUser().id
                    ? TextButton(
                        onPressed: () {
                          _deleteComment(context,comments[index].id);
                        },
                        child:Provider.of<CurrentUserToken>(context).isUserLogedIn()? Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ):Container())
                    : null);
          }),
    );
  }

  _deleteComment(BuildContext context, int? commentID) async {
    await CommentHttpService()
        .deleteComment(
            Provider.of<CurrentUserToken>(context,listen: false).getToken(), commentID)
        .then((_) {
      Provider.of<SingleProduct>(context,listen: false).updateComments();
    });
  }
}
