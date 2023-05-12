import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? email;
  String? name;
  String? lastName;
  String? phone;
  String? image;
  String? password;
  String? sessionToken;

  User({
    this.id,
    this.email,
    this.name,
    this.lastName,
    this.phone,
    this.image,
    this.password,
    this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastName: json["last_name"],
        phone: json["phone"],
        image: json["image"],
        password: json["password"],
        sessionToken: json["session_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "last_name": lastName,
        "phone": phone,
        "image": image,
        "password": password,
        "session_token": sessionToken,
      };
}
