class Account {
  late String id;
  late String username;
  late String password;
  late String email;
  late String fullname;
  late String address1;
  String? address2;
  late String phone;
  String? avatar;
  late int isAdmin;
  late int status;
  String? createdAt;
  String? updatedAt;

  Account(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.fullname,
      required this.address1,
      this.address2,
      required this.phone,
      this.avatar,
      required this.isAdmin,
      required this.status,
      this.createdAt,
      this.updatedAt});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    fullname = json['Fullname'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    phone = json['Phone'];
    avatar = json['Avatar'];
    isAdmin = json['IsAdmin'];
    status = json['Status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Username'] = username;
    data['Password'] = password;
    data['Email'] = email;
    data['Fullname'] = fullname;
    data['Address1'] = address1;
    data['Address2'] = address2;
    data['Phone'] = phone;
    data['Avatar'] = avatar;
    data['IsAdmin'] = isAdmin;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
