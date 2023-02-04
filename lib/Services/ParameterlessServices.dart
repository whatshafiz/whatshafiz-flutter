import 'package:whatshafiz/Models/AddCityResponseModel.dart';
import 'package:whatshafiz/Models/AddDepartmentResultModel.dart';
import 'package:whatshafiz/Models/AddFacultyResponseModel.dart';
import 'package:whatshafiz/Models/AddUniversityResponseModel.dart';
import 'package:whatshafiz/Models/Cities.dart';
import 'package:whatshafiz/Models/CityModel.dart';
import 'package:whatshafiz/Models/Countries.dart';
import 'package:whatshafiz/Models/Department.dart';
import 'package:whatshafiz/Models/Departments.dart';
import 'package:whatshafiz/Models/Faculties.dart';
import 'package:whatshafiz/Models/Faculty.dart';
import 'package:whatshafiz/Models/Universities.dart';

import '../Constants/Constants.dart';
import '../Constants/Util.dart';
import '../Models/Country.dart';
import '../Models/University.dart';
import 'ClientService.dart';

class ParameterlessServices {
  var client = ClientService();

  getCountryCodes() async {
    List<Countries> countries = [];
    var result = await client.GetMe(COUNTRYCODEURL, EmptyMap);
    print("result == $result");
    var countryWithCodes = Country.fromJson(result);

    if (countryWithCodes.countries != null) {
      countries.addAll(countryWithCodes.countries!);
    }
    return countries;
  }

  Future<AddCityResponseModel?> addCity(
      int code, String token, Map<String, dynamic> map) async {
    var result = await client.PostTokenWithEncoded(CITYURL(code), token, map);
    if (result != null) {
      final responseModel = AddCityResponseModel.fromJson(result);
      return responseModel;
    }
    return null;
  }

  Future<University?> addUniversity(
      String token, Map<String, dynamic> map) async {
    var result = await client.PostTokenWithEncoded(UNIVERSITIESURL, token, map);
    if (result != null) {
      final responseUniversityModel =
          AddUniversityResponseModel.fromJson(result);
      return responseUniversityModel.university;
    }
    return null;
  }

  Future<Faculty?> addFaculty(
      int code, String token, Map<String, dynamic> map) async {
    var result = await client.PostMeApplicationJSonWithAccentAndToken(
        FACULTYURL(code), token, map);
    if (result != null) {
      final responseUniversityModel = AddFacultyResponseModel.fromJson(result);
      return responseUniversityModel.faculty;
    }
    return null;
  }

  Future<Department?> addDepartment(
      int uniid, int facultyid, String token, Map<String, dynamic> map) async {
    var result = await client.PostMeApplicationJSonWithAccentAndToken(
        DEPARTMENTURL(uniid, facultyid), token, map);
    if (result != null) {
      final responseUniversityModel = AddDepartmentResultModel.fromJson(result);
      return responseUniversityModel.department;
    }
    return null;
  }

  getCityByCountry(int code, String token) async {
    var result = await client.GetWithToken(CITYURL(code), token, EmptyMap);
    if (result != null) {
      var city = CityModel.fromJson(result);
      return city.cities;
    }
    return null;
  }

  updateProfile(String token, Map<String, dynamic> map) async {
    var result = await client.PutWithToken(PROFILEURL, token, map);
    return result;
  }

  getUniversities(String token) async {
    var result = await client.GetWithToken(UNIVERSITIESURL, token, EmptyMap);
    if (result != null) {
      var university = Universities.fromJson(result);
      return university.universities;
    }
    return null;
  }

  getFacultyById(int code, String token) async {
    var result = await client.GetWithToken(FACULTYURL(code), token, EmptyMap);
    if (result != null) {
      var faculty = Faculties.fromJson(result);
      return faculty.faculties;
    }
    return null;
  }

  getDepartmentById(int unicode, int facultycode, String token) async {
    var result = await client.GetWithToken(
        DEPARTMENTURL(unicode, facultycode), token, EmptyMap);
    if (result != null) {
      var department = Departments.fromJson(result);
      return department.departments;
    }
    return null;
  }
}
