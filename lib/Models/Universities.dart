import 'Cities.dart';

class Universities {
  Universities({
    this.universities,
  });

  Universities.fromJson(dynamic json) {
    if (json['universities'] != null) {
      universities = [];
      json['universities'].forEach((v) {
        universities?.add(Cities.fromJson(v));
      });

    }
  }

  List<Cities>? universities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (universities != null) {
      map['universities'] = universities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
