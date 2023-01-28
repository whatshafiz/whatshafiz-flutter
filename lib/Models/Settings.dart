class Settings {
  Settings({
    this.id,
    this.name,
    this.value,
  });

  Settings.fromJson(dynamic json) {
    //id = json['id'];
    id=0;
    name = json['name'];

    value = json['value'];

  }

  int? id;
  String? name;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['value'] = value;
    return map;
  }
}
