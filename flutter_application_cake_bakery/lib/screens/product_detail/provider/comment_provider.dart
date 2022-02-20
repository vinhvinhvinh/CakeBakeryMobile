import 'package:flutter/material.dart';
import 'package:flutter_application_cake_bakery/models/comment.dart';
import 'package:flutter_application_cake_bakery/services/comment_service.dart';

//San pham provider
class CommentProvider extends ChangeNotifier {
  List<Comment> lstComments = [];

  bool loading = false;
  getCommentByProduct(context, productId) async {
    loading = true;
    lstComments = await getCommentByProductId(context, productId);
    loading = false;
    notifyListeners();
  }
}
