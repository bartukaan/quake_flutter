
import 'package:get_it/get_it.dart';
import 'package:quake_flutter/repositories/quake_repository.dart';
import 'package:quake_flutter/services/quake_service.dart';
GetIt getIt = GetIt.instance;

void setupLocator() {

  getIt.registerLazySingleton(() => QuakeService());
  getIt.registerLazySingleton(() => QuakeRepository());


}