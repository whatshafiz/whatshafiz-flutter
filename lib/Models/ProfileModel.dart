import 'User.dart';

class ProfileModel {
  ProfileModel({
      this.user, 
      this.permissions, 
      this.roles,});

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