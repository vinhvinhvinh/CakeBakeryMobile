class ProductType {
  late String id;
  late String name;
  late String? image;
  late int status;
  late String? createdAt;
  late String? updatedAt;

  ProductType(
      {required this.id,
      required this.name,
      this.image,
      required this.status,
      this.createdAt,
      this.updatedAt});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    image = json['Image'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Image'] = image;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
