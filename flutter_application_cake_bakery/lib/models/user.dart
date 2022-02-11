// class UserToken {
//   User? user;
//   String? userToken;

//   UserToken({this.user, this.userToken});

//   UserToken.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     userToken = json['user_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     data['user_token'] = this.userToken;
//     return data;
//   }
// }
class UserToken {
  User? user;
  String userToken;

  UserToken({this.user, required this.userToken});

  factory UserToken.fromJson(Map<String, dynamic> json) => UserToken(
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        userToken: json['user_token'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['user_token'] = this.userToken;
    return data;
  }
}

class User {
  int id;
  String username;
  String password;
  String email;
  String fullname;
  String address1;
  String? address2;
  String phone;
  String? avatar;
  int isAdmin;
  String? otp;
  int status;
  String? createdAt;
  String? updatedAt;

  User(
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
      this.otp,
      required this.status,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        username: json['Username'],
        password: json['Password'],
        email: json['Email'],
        fullname: json['Fullname'],
        address1: json['Address1'],
        address2: json['Address2'],
        phone: json['Phone'],
        avatar: json['Avatar'],
        isAdmin: json['IsAdmin'],
        otp: json['otp'],
        status: json['Status'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Username'] = username;
    data['Password'] = password;
    data['Email'] = email;
    data['Fullname'] = fullname;
    data['Address1'] = address1;
    data['Address2'] = address2;
    data['Phone'] = phone;
    data['Avatar'] = avatar;
    data['IsAdmin'] = isAdmin;
    data['otp'] = otp;
    data['Status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserDB {
  int id;
  String username;
  String password;
  String email;
  String fullname;
  String address1;
  String? address2;
  String phone;
  String? avatar;
  String? otp;
  String? userToken;
  int status;

  UserDB({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.fullname,
    required this.address1,
    this.address2,
    required this.phone,
    this.avatar,
    this.otp,
    this.userToken,
    required this.status,
  });

  factory UserDB.fromJson(Map<String, dynamic> json) => UserDB(
        id: json['id'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        fullname: json['fullname'],
        address1: json['address1'],
        address2: json['address2'],
        phone: json['phone'],
        avatar: json['avatar'],
        otp: json['otp'],
        userToken: json['userToken'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Username'] = username;
    data['Password'] = password;
    data['Email'] = email;
    data['Fullname'] = fullname;
    data['Address1'] = address1;
    data['Address2'] = address2;
    data['Phone'] = phone;
    data['Avatar'] = avatar;
    data['otp'] = otp;
    data['userToken'] = userToken;
    data['Status'] = status;
    return data;
  }
}
