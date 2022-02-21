class Invoice {
  late int id;
  late int userId;
  late String issueDate;
  late int total;
  late String phoneShipping;
  late String shippingAddress;
  late int discount;
  late int orderStatusesId;
  late int paymentsId;
  String? createdAt;
  String? updatedAt;
  int? quantity;
  String? image;
  String? productName;
  int? price;
  String? trangthai;

  Invoice(
      {required this.id,
      required this.userId,
      required this.issueDate,
      required this.total,
      required this.phoneShipping,
      required this.shippingAddress,
      required this.discount,
      required this.orderStatusesId,
      required this.paymentsId,
      this.createdAt,
      this.updatedAt,
      this.quantity,
      this.image,
      this.productName,
      this.price,
      this.trangthai});

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    userId = json['user_id'];
    issueDate = json['IssueDate'];
    total = json['Total'];
    phoneShipping = json['PhoneShipping'];
    shippingAddress = json['ShippingAddress'];
    discount = json['Discount'];
    orderStatusesId = json['order_statuses_id'];
    paymentsId = json['payments_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quantity = json['Quantity'];
    image = json['Image'];
    productName = json['productName'];
    price = json['Price'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['user_id'] = userId;
    data['IssueDate'] = issueDate;
    data['Total'] = total;
    data['PhoneShipping'] = phoneShipping;
    data['ShippingAddress'] = shippingAddress;
    data['Discount'] = discount;
    data['order_statuses_id'] = orderStatusesId;
    data['payments_id'] = paymentsId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['Quantity'] = quantity;
    data['Image'] = image;
    data['productName'] = productName;
    data['Price'] = price;
    data['trangthai'] = trangthai;
    return data;
  }
}
