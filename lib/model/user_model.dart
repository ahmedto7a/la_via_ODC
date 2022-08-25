// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
 required   this.type,
    required  this.message,
    required this.data,
  });

  String type;
  String message;
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    type: json["type"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  UserClass user;
  String accessToken;
  String refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: UserClass.fromJson(json["user"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
  };
}

class UserClass {
  UserClass({
    required  this.userId,
    required this.firstName,
    required  this.lastName,
    required  this.email,
    required  this.imageUrl,
    required this.address,
    required  this.role,
  });

  String userId;
  String firstName;
  String lastName;
  String email;
  String imageUrl;
  dynamic address;
  String role;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    imageUrl: json["imageUrl"],
    address: json["address"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "imageUrl": imageUrl,
    "address": address,
    "role": role,
  };
}
