class Product {
  late String id;
  late String name;
  late int price;
  late int stock;
  late String date;
  late String image;
  late String productTypeId;
  late String description;
  late int status;
  String? createdAt;
  String? updatedAt;
  String? typeName;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.stock,
      required this.date,
      required this.image,
      required this.productTypeId,
      required this.description,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.typeName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    price = json['Price'];
    stock = json['Stock'];
    date = json['Date'];
    image = json['Image'];
    productTypeId = json['ProductTypeId'];
    description = json['Description'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    typeName = json['TypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['Name'] = name;
    data['Price'] = price;
    data['Stock'] = stock;
    data['Date'] = date;
    data['Image'] = image;
    data['ProductTypeId'] = productTypeId;
    data['Description'] = description;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['TypeName'] = typeName;
    return data;
  }
}
