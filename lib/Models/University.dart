class University {
  University({
      this.name, 
      this.id,});

  University.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
  }
  String? name;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    return map;
  }

}