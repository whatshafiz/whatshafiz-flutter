enum Gender {
  male,
  female,
  none;

  String get genderToString {
    switch (this) {
      case Gender.male:
        return "male";
      case Gender.female:
        return "female";
      case Gender.none:
        return "";
    }
  }

  static getGenderFromString(String str) {
    switch (str) {
      case "male":
        return Gender.male;
      case "female":
        return Gender.female;
      default:
        return Gender.none;
    }
  }
}
