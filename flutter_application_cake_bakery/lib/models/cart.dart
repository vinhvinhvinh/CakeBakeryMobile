class Cart {
  int id;
  String cakeId;
  String name;
  int price;
  int quantity;
  String image;
  String typeName;
  int userId;

  Cart(
      {required this.id,
      required this.cakeId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.image,
      required this.typeName,
      required this.userId});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json['Id'],
        cakeId: json['CakeId'],
        name: json['Name'],
        price: json['Price'],
        quantity: json['Quantity'],
        image: json['Image'],
        typeName: json['TypeName'],
        userId: json['UserId'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CakeId'] = cakeId;
    data['Name'] = name;
    data['Price'] = price;
    data['Quantity'] = quantity;
    data['Image'] = image;
    data['TypeName'] = typeName;
    data['UserId'] = userId;
    return data;
  }
}
