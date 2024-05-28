import 'dart:convert';


Profile userFromJson(String str) => Profile.fromJson(json.decode(str));

String userToJson(Profile data) => json.encode(data.toJson());

class Profile {

    String? id;
    String? name;
    String? lastname1;
    String? lastname2;
    String? age;
    String? image;
    String? idUser;


    Profile({
        this.id,
        this.name,
        this.lastname1,
        this.lastname2,
        this.age,
        this.image,
        this.idUser

    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        lastname1: json["lastname1"],
        lastname2: json["lastname2"],
        age: json["age"],
        image: json["image"],
        idUser: json["id_user"]
    );

    static List<Profile> fromJsonList(List<dynamic> jsonList) {
      List<Profile> toList = [];

      jsonList.forEach((item) {
        Profile profile = Profile.fromJson(item);
        toList.add(profile);
      });
      return toList;
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname1": lastname1,
        "lastname2": lastname2,
        "age": age,
        "image": image,
        "id_user": idUser
    };
}
