import 'City.dart';

class AddCityResponseModel {
  AddCityResponseModel({
    this.city,
  });

  AddCityResponseModel.fromJson(dynamic json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
}
