import 'LoginModel.dart';

class UserModel {
  String? userEmail;
  String? userPassword;
  String? token;
  bool isSigned = false;
  Profile? profile;

  UserModel({this.userEmail, this.userPassword, this.token});

  set Signed(bool val) => this.isSigned = val;

  get IsSigned async => this.isSigned;

  set setProfile(Profile? profile) {
    this.profile = profile;
  }

  get fullName => profile?.name + " " + profile?.surname;

  @override
  String toString() {
    // TODO: implement toString
    return "userEmail :$userEmail , userPass:$userPassword , token:$token";
  }
}
