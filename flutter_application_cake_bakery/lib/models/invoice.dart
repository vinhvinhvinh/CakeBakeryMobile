class Invoice {
  String id;
  String userId;
  String issueDate;
  String? phoneShipping;
  String? shippingAddress;
  int total;
  int discount;
  int orderStatusesId;
  int paymentsId;
  String? updatedAt;
  String? createdAt;

  Invoice(
      {required this.id,
      required this.userId,
      required this.issueDate,
      this.phoneShipping,
      this.shippingAddress,
      required this.total,
      required this.discount,
      required this.orderStatusesId,
      required this.paymentsId,
      this.updatedAt,
      this.createdAt});

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        id: json['Id'],
        userId: json['user_id'],
        issueDate: json['issueDate'],
        phoneShipping: json['PhoneShipping'],
        shippingAddress: json['ShippingAddress'],
        total: json['Total'],
        discount: json['Discount'],
        orderStatusesId: json['order_statuses_id'],
        paymentsId: json['payments_id'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['user_id'] = userId;
    data['issueDate'] = issueDate;
    data['PhoneShipping'] = phoneShipping;
    data['ShippingAddress'] = shippingAddress;
    data['Total'] = total;
    data['Discount'] = discount;
    data['order_statuses_id'] = orderStatusesId;
    data['payments_id'] = paymentsId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}
