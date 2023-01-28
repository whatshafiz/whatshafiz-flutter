class Profile {
  Profile({
    this.phoneNumber,
    this.id,
  });

  Profile.fromJson(dynamic json) {
    phoneNumber = json['phone_number'];
    id = json['id'];
  }

  String? phoneNumber;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone_number'] = phoneNumber;
    map['id'] = id;
    return map;
  }
}
