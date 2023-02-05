import 'University.dart';

class AddUniversityResponseModel {
  AddUniversityResponseModel({
    this.university,
  });

  AddUniversityResponseModel.fromJson(dynamic json) {
    university = json['university'] != null
        ? University.fromJson(json['university'])
        : null;
  }

  University? university;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (university != null) {
      map['university'] = university?.toJson();
    }
    return map;
  }
}
