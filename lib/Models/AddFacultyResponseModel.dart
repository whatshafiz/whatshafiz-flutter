import 'Faculty.dart';

class AddFacultyResponseModel {
  AddFacultyResponseModel({
    this.faculty,
  });

  AddFacultyResponseModel.fromJson(dynamic json) {
    faculty =
        json['faculty'] != null ? Faculty.fromJson(json['faculty']) : null;
  }

  Faculty? faculty;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (faculty != null) {
      map['faculty'] = faculty?.toJson();
    }
    return map;
  }
}
