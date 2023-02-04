import 'package:get/get.dart';
import 'package:whatshafiz/Controllers/AppTranslator.dart';
import 'package:whatshafiz/Controllers/LoginController.dart';
import 'package:whatshafiz/Helper/Enums.dart';
import 'package:whatshafiz/Models/AddUniversityResponseModel.dart';
import 'package:whatshafiz/Models/User.dart';

import '../Models/Cities.dart';
import '../Models/Countries.dart';
import '../Services/ParameterlessServices.dart';

class ProfileController extends GetxController {
  String? name, surname, email, nation, city, university, faculty, department;
  Gender _gender = Gender.none;
  int? selectedNationId,
      selectedCityId,
      selectedUniId,
      selectedFacultyId,
      selectedDepartmentId;

  String? cityText, uniText, facultyText, departmentText;
  int? error;

  bool initialized = false;

  final selection = Cities(id: -1, name: "Seçiniz");
  final firtCountry =
      Countries(id: -1, name: "Seçiniz", iso: "", phoneCode: "");
  List<Countries> countries = [];
  List<Cities>? cities = [];
  List<Cities>? universities = [];
  List<Cities>? faculties = [];
  List<Cities>? departments = [];
  final others = Cities(id: -2, name: "Diğer");

  //final countryOther = Countries(id: -2, name: "Diğer", iso: "", phoneCode: "");

  get token => LoginController.Shared.GetToken;

  var parameterlessClient = ParameterlessServices();

  emptyValidation(String? text) {
    if (text == null) return null;
    if (text.isEmpty) return TranslationKeys.veribosveyaeksik.tr;
    return null;
  }

  emailValidation(String? email) {
    if (email == null) return null;
    if (email.isEmpty) return TranslationKeys.veribosveyaeksik.tr;
    return null;
  }

  getNation() async {
    final response = await parameterlessClient.getCountryCodes();
    if (response != null) {
      countries.add(firtCountry);
      countries.addAll(response);
    }
  }

  setProfile() async {
    final userCountryId =
        LoginController.Shared.userModel.value.profile?.countryId;
    final userCityId = LoginController.Shared.userModel.value.profile?.cityId;
    final userUniId =
        LoginController.Shared.userModel.value.profile?.universityId;
    final userFacultyId =
        LoginController.Shared.userModel.value.profile?.universityFacultyId;
    final userDepartmentId =
        LoginController.Shared.userModel.value.profile?.universityDepartmentId;
    final userCountry = countries.where((p) => p.id == userCountryId)?.first;
    if (userCountry != null) {
      final selectedCountry = userCountry;
      countries.removeAt(0);
      selectedNationId = userCountryId;
      countries.insert(0, userCountry);
      await nationChanged(selectedCountry, false);

      if (cities != null) {
        if (cities!.isNotEmpty) {
          final selectedCity =
              cities?.where((element) => element.id == userCityId);
          if (selectedCity != null) {
            try {
              cities?.removeAt(0);
              cities?.insert(0, selectedCity!.first);
              selectedCityId = userCityId;
            } catch (e) {}
          }
        }
      }
    }

    if (universities != null) {
      if (universities!.isNotEmpty) {
        final selectedUni =
            universities?.where((element) => element.id == userUniId);
        if (selectedUni != null) {
          try {
            universities?.removeAt(0);
            universities?.insert(0, selectedUni!.first);
            selectedUniId = userUniId;
            await universityChanged(selectedUni!.first, false);
          } catch (e) {}

          if (faculties != null) {
            if (faculties!.isNotEmpty) {
              try {
                final selFaculty =
                    faculties?.where((p) => p.id == userFacultyId).first;
                if (selFaculty != null) {
                  faculties?.removeAt(0);
                  faculties?.insert(0, selFaculty!);
                  await facultyChanged(selFaculty, false);
                  print(
                      "===> userDep $userDepartmentId ${departments?.length} ${departments?.isNotEmpty}");

                  if (departments != null) {
                    if (departments!.isNotEmpty) {
                      final userDep =
                          departments?.where((p) => p.id == userDepartmentId);

                      if (userDep != null) {
                        try {
                          final first = userDep.first;
                          faculties?.removeAt(0);
                          faculties?.insert(0, first);
                        } catch (e) {
                          print("error occured $e");
                        }
                      }
                    }
                  }
                }
              } catch (e) {}
            }
          }
        }
      }
    }

    name = LoginController.Shared.userModel.value.profile?.name;
    surname = LoginController.Shared.userModel.value.profile?.surname;
    email = LoginController.Shared.userModel.value.profile?.email;
    final __gender = LoginController.Shared.userModel.value.profile?.gender;
    _gender = Gender.getGenderFromString(__gender);
    initialized = true;
    update();
  }

  departmentChanged(Cities? newCity) {
    if (newCity == null) return;
    selectedDepartmentId = newCity!.id;
    update();
  }

  nationChanged(Countries? newCountry, [bool isUpdate = true]) async {
    if (newCountry == null) return;
    final countryId = newCountry.id;
    selectedNationId = countryId;
    selectedCityId = null;
    cities?.clear();
    if (countryId != null) {
      final response =
          await parameterlessClient.getCityByCountry(countryId!, token);
      if (response != null) {
        cities?.add(selection);
        cities?.addAll(response);
        cities?.add(others);
        if (isUpdate) {
          update();
        }
      }
    }
  }

  saveChanges() async {
    print(name == null || surname == null || email == null);
    if (name == null || surname == null || email == null) return;
    if (selectedFacultyId == null ||
        selectedUniId == null ||
        selectedDepartmentId == null ||
        selectedNationId == null ||
        selectedCityId == null) {
      return;
    }
    if (selectedCityId == -2) {
      selectedCityId = await addCity();
      if (selectedCityId == -1) return;
    }

    if (selectedUniId == -2) {
      selectedUniId = await addUniversity();
      if (selectedUniId == -1) return;
    }
    if (selectedFacultyId == -2) {
      selectedFacultyId = await addFaculty();
    }

    if (selectedDepartmentId == -2) {
      selectedDepartmentId = await addDepartment();
    }

    if (error != null) return;

    if (_gender == Gender.none) return;
    Map<String, dynamic> demoMap = {
      "name": name,
      "surname": surname,
      "email": email,
      "gender": _gender.genderToString,
      "country_id": selectedNationId,
      "city_id": selectedCityId,
      "university_id": selectedUniId,
      "university_faculty_id": selectedFacultyId,
      "university_department_id": selectedDepartmentId,
    };
    print("to go $demoMap");
    final response = await parameterlessClient.updateProfile(token, demoMap);
    print("==> response $response");
    if (response != null) {
      final profile = User.fromJson(response);
      if (profile != null) {
        print("updated $profile");
        print(profile.phoneNumber);
      }
    }
  }

  getUniversity() async {
    final universitiesResponse =
        await parameterlessClient.getUniversities(token);
    universities?.clear();
    if (universitiesResponse != null) {
      universities?.add(selection);
      universities?.addAll(universitiesResponse);
      universities?.add(others);
    }
  }

  cityChanged(Cities? newCity) async {
    if (newCity == null) return;
    selectedCityId = newCity.id;
    update();
  }

  universityChanged(Cities? uni, [bool isUpdate = true]) async {
    if (uni == null) return;
    selectedUniId = uni.id;
    if (selectedUniId == -2) {
      selectedFacultyId = -2;
      selectedDepartmentId = -2;
      if (isUpdate) {
        update();
      }
      return;
    }

    final facultiesRes =
        await parameterlessClient.getFacultyById(selectedUniId!, token);
    faculties?.clear();
    if (facultiesRes != null) {
      faculties?.add(selection);
      faculties?.addAll(facultiesRes);
      faculties?.add(others);
      if (isUpdate) {
        update();
      }
    }
  }

  facultyChanged(Cities? cities, [bool isUpdate = true]) async {
    if (cities == null) return;
    selectedFacultyId = cities.id;
    if (selectedFacultyId == -2) {
      if (isUpdate) update();
      return;
    }
    final departmentRes = await parameterlessClient.getDepartmentById(
        selectedUniId!, selectedFacultyId!, token);
    if (departmentRes != null) {
      departments?.add(selection);
      departments?.addAll(departmentRes);
      departments?.add(others);
      if (isUpdate) {
        update();
      }
    }
  }

  set setGender(Gender val) {
    _gender = val;
    update();
  }

  get gender => _gender;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    await getNation();
    await getUniversity();
    await setProfile();
  }

  addCity() async {
    if (cityText != null) {
      if (cityText!.isNotEmpty) {
        final map = {"name": cityText!};
        final responseModel =
            await parameterlessClient.addCity(selectedNationId!, token, map);
        if (responseModel != null) {
          return responseModel.city?.id;
        } else {
          error = -1;
        }
      } else {
        error = -1;
      }
    } else {
      error = -1;
    }
    return error;
  }

  addUniversity() async {
    if (uniText != null) {
      if (uniText!.isNotEmpty) {
        final params = {"name": uniText};
        var response = await parameterlessClient.addUniversity(token, params);
        if (response != null) {
          return response.id;
        } else {
          error = -1;
        }
      } else {
        error = -1;
      }
    } else {
      error = -1;
    }
    return error;
  }

  addFaculty() async {
    if (facultyText != null && selectedUniId != null) {
      if (facultyText!.isNotEmpty) {
        final params = {"name": facultyText};
        var response =
            await parameterlessClient.addFaculty(selectedUniId!, token, params);
        if (response != null) {
          return response.id;
        } else {
          error = -1;
        }
      } else {
        error = -1;
      }
    } else {
      error = -1;
    }
    return error;
  }

  addDepartment() async {
    if (departmentText != null &&
        selectedUniId != null &&
        selectedFacultyId != null) {
      if (departmentText!.isNotEmpty) {
        final params = {"name": departmentText};
        var response = await parameterlessClient.addDepartment(
            selectedUniId!, selectedUniId!, token, params);
        if (response != null) {
          return response.id;
        } else {
          error = -1;
        }
      } else {
        error = -1;
      }
    } else {
      error = -1;
    }
    return error;
  }
}
