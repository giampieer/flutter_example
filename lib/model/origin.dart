class Origin {
  String name;
  String url;

  Origin({this.name, this.url});

  factory Origin.fromJson(Map<String, dynamic> parsedJson) {
    return Origin(
      name: parsedJson['name'] ?? "",
      url: parsedJson['url'] ?? "",
    );
  }

  factory Origin.fromJsonNull() {
    return Origin(name: "", url: "");
  }
}
