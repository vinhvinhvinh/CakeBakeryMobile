class Favorite {
  late int id;
  late int userId;
  late String productId;
  late int status;
  String? createdAt;
  String? updatedAt;

  Favorite(
      {required this.id,
      required this.userId,
      required this.productId,
      required this.status,
      this.createdAt,
      this.updatedAt});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['user_id'];
    productId = json['ProductId'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['user_id'] = userId;
    data['ProductId'] = productId;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
