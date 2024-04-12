import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? id;
    String? email;
    String? name;
    String? lastname1;
    String? lastname2;
    String? phone;
    String? location;
    String? image;
    String? imageback;
    String? password;

    User({
        this.id,
        this.email,
        this.name,
        this.lastname1,
        this.lastname2,
        this.phone,
        this.location,
        this.image,
        this.imageback,
        this.password,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastname1: json["lastname1"],
        lastname2: json["lastname2"],
        phone: json["phone"],
        location: json["location"],
        image: json["image"],
        imageback: json["imageback"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname1": lastname1,
        "lastname2": lastname2,
        "phone": phone,
        "location": location,
        "image": image,
        "imageback": imageback,
        "password": password,
    };
}
