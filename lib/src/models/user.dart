import 'dart:convert';

import 'package:app/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? dni;
  String? name;
  String? lastname1;
  String? lastname2;
  String? phone;
  String? location;
  String? image;
  String? password;
  String? sessionToken;
  String? description;
  String? age;
  String? price;
  String? experience;
  List<Rol>? roles = [];

  User({
    this.id,
    this.email,
    this.dni,
    this.name,
    this.lastname1,
    this.lastname2,
    this.phone,
    this.location,
    this.image,
    this.password,
    this.sessionToken,
    this.roles,
    this.description,
    this.age,
    this.price,
    this.experience,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        dni: json["dni"],
        name: json["name"],
        lastname1: json["lastname1"],
        lastname2: json["lastname2"],
        phone: json["phone"],
        location: json["location"],
        image: json["image"],
        password: json["password"],
        description: json["description"],
        age: json["age"],
        price: json["price"],
        experience: json["experience"],
        sessionToken: json["sessionToken"],
        roles: json["roles"] == null
            ? []
            : List<Rol>.from(json["roles"].map((model) => Rol.fromJson(model))),
      );

  static List<User> fromJsonList(List<dynamic> jsonList) {
    List<User> toList = [];

    jsonList.forEach((item) {
      User user = User.fromJson(item);
      toList.add(User.fromJson(item));
    });
    return toList;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "dni": dni,
        "name": name,
        "lastname1": lastname1,
        "lastname2": lastname2,
        "phone": phone,
        "location": location,
        "image": image,
        "password": password,
        "age": age,
        "description": description,
        "price": price,
        "experience": experience,
        "sessionToken": sessionToken,
        "roles": roles
      };
}
