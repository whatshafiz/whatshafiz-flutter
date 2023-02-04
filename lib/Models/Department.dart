class Department {
  Department({
      this.universityId, 
      this.name, 
      this.universityFacultyId, 
      this.id,});

  Department.fromJson(dynamic json) {
    universityId = json['university_id'];
    name = json['name'];
    universityFacultyId = json['university_faculty_id'];
    id = json['id'];
  }
  int? universityId;
  String? name;
  int? universityFacultyId;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['university_id'] = universityId;
    map['name'] = name;
    map['university_faculty_id'] = universityFacultyId;
    map['id'] = id;
    return map;
  }

}