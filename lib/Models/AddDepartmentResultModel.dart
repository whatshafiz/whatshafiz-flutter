import 'Department.dart';

class AddDepartmentResultModel {
  AddDepartmentResultModel({
    this.department,
  });

  AddDepartmentResultModel.fromJson(dynamic json) {
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
  }

  Department? department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (department != null) {
      map['department'] = department?.toJson();
    }
    return map;
  }
}
