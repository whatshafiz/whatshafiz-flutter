import 'package:dio/dio.dart';
import '../Models/WhatsArapModel.dart';
import '../constants/Constants.dart';

class ClientService {
  ClientService();

  Future<WhatsArapModel> getWhatsArapModel() async {
    var dio = Dio();

    final response = await dio
        .get('https://api.whatshafiz.com/api/v1/regulations/whatsarapp');
    return WhatsArapModel.fromJson(response.data);
  }

  Future<dynamic> PostTokenWithEncoded(
      String url, String bearer, Map<String, dynamic> map) async {
    try {
      var dio = Dio();
      dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.headers["Authorization"] = "Bearer $bearer";
      Response? response;
      if (map != null && map.length > 0) {
        response = await dio.post("$ENDPOINT$url", data: FormData.fromMap(map));
      } else {
        response = await dio.post("$ENDPOINT$url", data: FormData.fromMap(map));
      }
      print("response ${response.data}");
      if (response != null) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
      return null;
    }
  }

  Future<dynamic> PostWithToken(
      String url, String bearer, Map<String, dynamic> map) async {
    try {
      var dio = Dio();
      //dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer $bearer";
      Response? response;
      if (map != null && map.length > 0) {
        response = await dio.post("$ENDPOINT$url");
      } else {
        response = await dio.post("$ENDPOINT$url");
      }
      if (response.statusCode == 400) {
        return null;
      }
      if (response != null) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
      return null;
    }
  }

  Future<dynamic> getWithToken(
      String url, String bearer, Map<String, dynamic> map) async {
    try {
      var dio = Dio();
      Response? response;
      if (map != null && map.length > 0) {
        response = await dio.get("$ENDPOINT$url",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $bearer",
            }));
      } else {
        response = await dio.get("$ENDPOINT$url",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $bearer",
            }));
      }

      if (response != null) {
        return response.data;
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response != null) return e.response!.data;
      return null;
    }
  }

  Future<dynamic> PostMeWith(Map<String, dynamic> map) async {
    var dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    var formData = FormData.fromMap(map);
    try {
      final response = await dio.post('https://api.whatshafiz.com/api/v1/login',
          data: formData);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response!.data;
      }
      return null;
    }
  }

  Future<dynamic> GetMe(String url, Map<String, dynamic> map) async {
    var dio = Dio();
    var response;
    if (map.isNotEmpty) {
      response = await dio.get('$ENDPOINT${url}', queryParameters: map);
    } else {
      response = await dio.get('$ENDPOINT${url}');
    }

    return response.data;
  }

  Future<dynamic> PostMeApplicationJSon(
      String url, Map<String, dynamic> map) async {
    var dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    var formData = FormData.fromMap(map);
    try {
      final response = await dio.post('$ENDPOINT$url', data: formData);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) return e.response!.data;
      return null;
    }
  }

  Future<dynamic> PostMeApplicationJSonWithAccept(
      String url, Map<String, dynamic> map) async {
    var dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    dio.options.headers.addAll(
        {"Accept": "application/json", "Content-Type": "application/json"});
    var formData = FormData.fromMap(map);
    try {
      final response = await dio.post('$ENDPOINT$url', data: formData);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) return e.response!.data;
      return null;
    }
  }
}
