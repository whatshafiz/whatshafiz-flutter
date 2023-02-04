import 'package:whatshafiz/Models/Cities.dart';

import 'Departments.dart';

class Departments {
  Departments({
    this.departments,
  });

  Departments.fromJson(dynamic json) {
    if (json['departments'] != null) {
      departments = [];
      json['departments'].forEach((v) {
        departments?.add(Cities.fromJson(v));
      });
    }
  }

  List<Cities>? departments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (departments != null) {
      map['departments'] = departments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
