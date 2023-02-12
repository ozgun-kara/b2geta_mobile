import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<GeneralService>(() => GeneralService());
  locator.registerLazySingleton<MemberServices>(() => MemberServices());
  locator.registerLazySingleton<BasketServices>(() => BasketServices());
}
