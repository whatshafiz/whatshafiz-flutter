import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:whatshafiz/core/constans/app/app_constants.dart';

import '../dio/dio_factory.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(DioFactory(ApplicationConstants.rBaseUrl).create());
}
