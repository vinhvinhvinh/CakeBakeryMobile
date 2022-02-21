class Favorite {
  late int id;
  late int userId;
  late String productId;
  late int status;
  String? createdAt;
  String? updatedAt;
  String? name;
  int? price;
  String? image;

  Favorite(
      {required this.id,
      required this.userId,
      required this.productId,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.price,
      this.image});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['user_id'];
    productId = json['ProductId'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['Name'];
    price = json['Price'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['user_id'] = userId;
    data['ProductId'] = productId;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['Name'] = name;
    data['Price'] = price;
    data['Image'] = image;
    return data;
  }
}
