import 'package:crypto/service/api_service.dart';
import 'package:crypto/service/nav_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

// Registering all services here
void setupAllService() {
  locator.registerLazySingleton<NavigationServices>(
    () => NavigationServices(),
  );
  locator.registerLazySingleton<ApiService>(
    () => ApiService(),
  );
  
}