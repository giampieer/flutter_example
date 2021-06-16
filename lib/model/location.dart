class Location {
  String name;
  String url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> parsedJson) {
    return Location(
      name: parsedJson['name'] ?? "",
      url: parsedJson['url'] ?? "",
    );
  }

  factory Location.fromJsonNull() {
    return Location(name: "", url: "");
  }
}
