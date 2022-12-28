import 'package:b2geta_mobile/services/login_register/country_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CountryService>(() => CountryService());
}
