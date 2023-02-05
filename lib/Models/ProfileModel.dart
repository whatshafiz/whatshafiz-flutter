import 'package:whatshafiz/Models/LoginModel.dart';

import 'User.dart';

class ProfileModel {
  ProfileModel({
    this.user,
    this.permissions,
    this.roles,
  });

  ProfileModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        //permissions?.add(Dynamic.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = [];
      json['roles'].forEach((v) {
        //roles?.add(Dynamic.fromJson(v));
      });
    }
  }

  User? user;
  List<dynamic>? permissions;
  List<dynamic>? roles;

  get toProfile {
    return Profile(
        id: user?.id,
        countryId: user?.countryId,
        cityId: user?.cityId,
        universityId: user?.universityId,
        universityFacultyId: user?.universityFacultyId,
        universityDepartmentId: user?.universityDepartmentId,
        name: user?.name,
        surname: user?.surname,
        email: user?.email,
        gender: user?.gender,
        phoneNumber: user?.phoneNumber,
        phoneNumberVerifiedAt: user?.phoneNumberVerifiedAt,
        verificationCode: user?.verificationCode,
        verificationCodeValidUntil: user?.verificationCodeValidUntil,
        isBanned: user?.isBanned);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    if (roles != null) {
      map['roles'] = roles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
