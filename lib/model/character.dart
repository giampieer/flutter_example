import 'package:app_prueba/model/origin.dart';
import 'location.dart';

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Location location;
  String image;

  Character(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image});

  factory Character.fromJson(Map<String, dynamic> parsedJson) {
    return Character(
      id: parsedJson['id'] ?? 0,
      name: parsedJson['name'] ?? "",
      status: parsedJson['status'] ?? "",
      species: parsedJson['species'] ?? "",
      type: parsedJson['type'] ?? "",
      gender: parsedJson['gender'] ?? "",
      origin: Origin(name: parsedJson['origin']['name']),
      location: Location(name: parsedJson['origin']['name']),
      image: parsedJson['image'] ?? "",
    );
  }

  factory Character.fromJsonNull() {
    return Character(
        id: 0,
        name: "",
        status: "",
        species: "",
        type: "",
        gender: "",
        origin: Origin(name: ""),
        location: Location(name: ""),
        image: "");
  }
}

class CharacterList {
  final List<Character> listTag;

  CharacterList({
    this.listTag,
  });

  factory CharacterList.fromJsonTag(List<dynamic> parsedJson) {
    List<Character> listTag = List<Character>();
    listTag = parsedJson.map((i) => Character.fromJson(i)).toList();
    return CharacterList(listTag: listTag);
  }
}
