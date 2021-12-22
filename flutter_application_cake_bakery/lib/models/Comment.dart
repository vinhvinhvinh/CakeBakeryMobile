import 'package:flutter/material.dart';

class Comment {
  final String content;
  final int accountId, productId, id;
  final DateTime postedDate;
  Comment({
    required this.id,
    required this.content,
    required this.accountId,
    required this.productId,
    required this.postedDate,
  });
}

List<Comment> lstComments = [
  Comment(
    id: 1,
    content: 'Bánh ngon lắm ạ',
    accountId: 1,
    productId: 1,
    postedDate: DateTime.now(),
  ),
  Comment(
    id: 2,
    content: 'Nên mua nha mọi người',
    accountId: 1,
    productId: 1,
    postedDate: DateTime.now(),
  ),
  Comment(
    id: 3,
    content: 'Bánh ngon lắm ạ',
    accountId: 1,
    productId: 1,
    postedDate: DateTime.now(),
  ),
];
