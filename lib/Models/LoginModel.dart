/// token : "73|O8jzqJgjds5fMZRCNbOVEMsYft8AHxQF7utOCEbA"
/// profile : {"id":22,"country_id":null,"city_id":null,"university_id":null,"university_faculty_id":null,"university_department_id":null,"name":null,"surname":null,"email":null,"gender":null,"phone_number":"5063671155","phone_number_verified_at":null,"verification_code":null,"verification_code_valid_until":null,"is_banned":0}

class LoginModel {
  LoginModel({
    String? token,
    Profile? profile,
  }) {
    _token = token;
    _profile = profile;
  }

  LoginModel.fromJson(dynamic json) {
    _token = json['token'];
    _profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  String? _token;
  Profile? _profile;

  LoginModel copyWith({
    String? token,
    Profile? profile,
  }) =>
      LoginModel(
        token: token! ?? _token,
        profile: profile! ?? _profile,
      );

  String? get token => _token;

  Profile? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    return map;
  }
}

/// id : 22
/// country_id : null
/// city_id : null
/// university_id : null
/// university_faculty_id : null
/// university_department_id : null
/// name : null
/// surname : null
/// email : null
/// gender : null
/// phone_number : "5063671155"
/// phone_number_verified_at : null
/// verification_code : null
/// verification_code_valid_until : null
/// is_banned : 0

class Profile {
  Profile({
    num? id,
    dynamic countryId,
    dynamic cityId,
    dynamic universityId,
    dynamic universityFacultyId,
    dynamic universityDepartmentId,
    dynamic name,
    dynamic surname,
    dynamic email,
    dynamic gender,
    String? phoneNumber,
    dynamic phoneNumberVerifiedAt,
    dynamic verificationCode,
    dynamic verificationCodeValidUntil,
    num? isBanned,
  }) {
    _id = id;
    _countryId = countryId;
    _cityId = cityId;
    _universityId = universityId;
    _universityFacultyId = universityFacultyId;
    _universityDepartmentId = universityDepartmentId;
    _name = name;
    _surname = surname;
    _email = email;
    _gender = gender;
    _phoneNumber = phoneNumber;
    _phoneNumberVerifiedAt = phoneNumberVerifiedAt;
    _verificationCode = verificationCode;
    _verificationCodeValidUntil = verificationCodeValidUntil;
    _isBanned = isBanned;
  }

  Profile.fromJson(dynamic json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _cityId = json['city_id'];
    _universityId = json['university_id'];
    _universityFacultyId = json['university_faculty_id'];
    _universityDepartmentId = json['university_department_id'];
    _name = json['name'];
    _surname = json['surname'];
    _email = json['email'];
    _gender = json['gender'];
    _phoneNumber = json['phone_number'];
    _phoneNumberVerifiedAt = json['phone_number_verified_at'];
    _verificationCode = json['verification_code'];
    _verificationCodeValidUntil = json['verification_code_valid_until'];
    _isBanned = json['is_banned'];
  }

  num? _id;
  dynamic _countryId;
  dynamic _cityId;
  dynamic _universityId;
  dynamic _universityFacultyId;
  dynamic _universityDepartmentId;
  dynamic _name;
  dynamic _surname;
  dynamic _email;
  dynamic _gender;
  String? _phoneNumber;
  dynamic _phoneNumberVerifiedAt;
  dynamic _verificationCode;
  dynamic _verificationCodeValidUntil;
  num? _isBanned;

  Profile copyWith({
    num? id,
    dynamic countryId,
    dynamic cityId,
    dynamic universityId,
    dynamic universityFacultyId,
    dynamic universityDepartmentId,
    dynamic name,
    dynamic surname,
    dynamic email,
    dynamic gender,
    String? phoneNumber,
    dynamic phoneNumberVerifiedAt,
    dynamic verificationCode,
    dynamic verificationCodeValidUntil,
    num? isBanned,
  }) =>
      Profile(
        id: id ?? _id,
        countryId: countryId ?? _countryId,
        cityId: cityId ?? _cityId,
        universityId: universityId ?? _universityId,
        universityFacultyId: universityFacultyId ?? _universityFacultyId,
        universityDepartmentId:
            universityDepartmentId ?? _universityDepartmentId,
        name: name ?? _name,
        surname: surname ?? _surname,
        email: email ?? _email,
        gender: gender ?? _gender,
        phoneNumber: phoneNumber ?? _phoneNumber,
        phoneNumberVerifiedAt: phoneNumberVerifiedAt ?? _phoneNumberVerifiedAt,
        verificationCode: verificationCode ?? _verificationCode,
        verificationCodeValidUntil:
            verificationCodeValidUntil ?? _verificationCodeValidUntil,
        isBanned: isBanned ?? _isBanned,
      );

  num? get id => _id;

  dynamic get countryId => _countryId;

  dynamic get cityId => _cityId;

  dynamic get universityId => _universityId;

  dynamic get universityFacultyId => _universityFacultyId;

  dynamic get universityDepartmentId => _universityDepartmentId;

  dynamic get name => _name;

  dynamic get surname => _surname;

  dynamic get email => _email;

  dynamic get gender => _gender;

  String? get phoneNumber => _phoneNumber;

  dynamic get phoneNumberVerifiedAt => _phoneNumberVerifiedAt;

  dynamic get verificationCode => _verificationCode;

  dynamic get verificationCodeValidUntil => _verificationCodeValidUntil;

  num? get isBanned => _isBanned;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['country_id'] = _countryId;
    map['city_id'] = _cityId;
    map['university_id'] = _universityId;
    map['university_faculty_id'] = _universityFacultyId;
    map['university_department_id'] = _universityDepartmentId;
    map['name'] = _name;
    map['surname'] = _surname;
    map['email'] = _email;
    map['gender'] = _gender;
    map['phone_number'] = _phoneNumber;
    map['phone_number_verified_at'] = _phoneNumberVerifiedAt;
    map['verification_code'] = _verificationCode;
    map['verification_code_valid_until'] = _verificationCodeValidUntil;
    map['is_banned'] = _isBanned;
    return map;
  }
}
