class UserCheckModel {
  UserCheckModel({
      this.phoneNumber, 
      this.isRegistered, 
      this.isBanned,});

  UserCheckModel.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    isRegistered = json['is_registered'];
    isBanned = json['is_banned'];
  }
  String? phoneNumber;
  bool? isRegistered;
  bool? isBanned;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['is_registered'] = isRegistered;
    map['is_banned'] = isBanned;
    return map;
  }

}