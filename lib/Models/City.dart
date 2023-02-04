class City {
  City({
    required this.name,
    required this.countryId,
    required this.id,
  });

  City.fromJson(dynamic json) {
    name = json['name'];
    countryId = json['country_id'];
    id = json['id'];
  }

  late String name;
  late int countryId;
  late int id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country_id'] = countryId;
    map['id'] = id;
    return map;
  }
}
