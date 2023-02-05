import 'Cities.dart';

class Faculties {
  Faculties({
    this.faculties,
  });

  Faculties.fromJson(dynamic json) {
    if (json['faculties'] != null) {
      faculties = [];
      json['faculties'].forEach((v) {
        faculties?.add(Cities.fromJson(v));
      });

    }

  }

  List<Cities>? faculties;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (faculties != null) {
      map['faculties'] = faculties?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
