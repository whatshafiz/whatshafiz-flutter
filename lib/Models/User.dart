class User {
  User({
      this.id, 
      this.countryId, 
      this.cityId, 
      this.universityId, 
      this.universityFacultyId, 
      this.universityDepartmentId, 
      this.name, 
      this.surname, 
      this.email, 
      this.gender, 
      this.phoneNumber, 
      this.phoneNumberVerifiedAt, 
      this.verificationCode, 
      this.verificationCodeValidUntil, 
      this.isBanned, 
      this.country, 
      this.city, 
      this.university, 
      this.universityFaculty, 
      this.universityDepartment,});

  User.fromJson(dynamic json) {
    id = json['id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    universityId = json['university_id'];
    universityFacultyId = json['university_faculty_id'];
    universityDepartmentId = json['university_department_id'];
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    phoneNumberVerifiedAt = json['phone_number_verified_at'];
    verificationCode = json['verification_code'];
    verificationCodeValidUntil = json['verification_code_valid_until'];
    isBanned = json['is_banned'];
    country = json['country'];
    city = json['city'];
    university = json['university'];
    universityFaculty = json['university_faculty'];
    universityDepartment = json['university_department'];
  }
  int? id;
  dynamic countryId;
  dynamic cityId;
  dynamic universityId;
  dynamic universityFacultyId;
  dynamic universityDepartmentId;
  dynamic name;
  dynamic surname;
  dynamic email;
  dynamic gender;
  String? phoneNumber;
  dynamic phoneNumberVerifiedAt;
  dynamic verificationCode;
  dynamic verificationCodeValidUntil;
  int? isBanned;
  dynamic country;
  dynamic city;
  dynamic university;
  dynamic universityFaculty;
  dynamic universityDepartment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_id'] = countryId;
    map['city_id'] = cityId;
    map['university_id'] = universityId;
    map['university_faculty_id'] = universityFacultyId;
    map['university_department_id'] = universityDepartmentId;
    map['name'] = name;
    map['surname'] = surname;
    map['email'] = email;
    map['gender'] = gender;
    map['phone_number'] = phoneNumber;
    map['phone_number_verified_at'] = phoneNumberVerifiedAt;
    map['verification_code'] = verificationCode;
    map['verification_code_valid_until'] = verificationCodeValidUntil;
    map['is_banned'] = isBanned;
    map['country'] = country;
    map['city'] = city;
    map['university'] = university;
    map['university_faculty'] = universityFaculty;
    map['university_department'] = universityDepartment;
    return map;
  }

}