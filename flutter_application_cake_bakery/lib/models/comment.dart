class Comment {
  late String id;
  late int userId;
  late String productId;
  late String content;
  late String postedDate;
  late int status;
  String? createdAt;
  String? updatedAt;
  String? fullname;
  String? avatar;

  Comment(
      {required this.id,
      required this.userId,
      required this.productId,
      required this.content,
      required this.postedDate,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.fullname,
      this.avatar});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['user_id'];
    productId = json['ProductId'];
    content = json['Content'];
    postedDate = json['PostedDate'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullname = json['Fullname'];
    avatar = json['Avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['user_id'] = userId;
    data['ProductId'] = productId;
    data['Content'] = content;
    data['PostedDate'] = postedDate;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['Fullname'] = fullname;
    data['Avatar'] = avatar;
    return data;
  }
}
