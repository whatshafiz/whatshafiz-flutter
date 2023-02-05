class Faculty {
  Faculty({
      this.name, 
      this.universityId, 
      this.id,});

  Faculty.fromJson(dynamic json) {
    name = json['name'];
    universityId = json['university_id'];
    id = json['id'];
  }
  String? name;
  int? universityId;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['university_id'] = universityId;
    map['id'] = id;
    return map;
  }

}