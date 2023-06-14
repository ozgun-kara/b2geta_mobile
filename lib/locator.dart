import 'package:b2geta_mobile/services/agreement/agreement_services.dart';
import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:b2geta_mobile/services/categories/categories_services.dart';
import 'package:b2geta_mobile/services/company/company_services.dart';
import 'package:b2geta_mobile/services/follow_services/follow_services.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:b2geta_mobile/services/marketplace/marketplace_services.dart';
import 'package:b2geta_mobile/services/member/member_addresses_services.dart';
import 'package:b2geta_mobile/services/member/member_interested_services.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/services/messages/messages_services.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<GeneralService>(() => GeneralService());
  locator.registerLazySingleton<MemberServices>(() => MemberServices());
  locator.registerLazySingleton<MemberAddressesServices>(
      () => MemberAddressesServices());
  locator.registerLazySingleton<MemberInterestedServices>(
      () => MemberInterestedServices());
  locator.registerLazySingleton<ProductsServices>(() => ProductsServices());
  locator.registerLazySingleton<BasketServices>(() => BasketServices());
  locator.registerLazySingleton<CompanyServices>(() => CompanyServices());
  locator.registerLazySingleton<FollowServices>(() => FollowServices());
  locator.registerLazySingleton<MessagesServices>(() => MessagesServices());
  locator.registerLazySingleton<CategoriesServices>(() => CategoriesServices());
  locator.registerLazySingleton<OrderService>(() => OrderService());
  locator.registerLazySingleton<SocialServices>(() => SocialServices());
  locator.registerLazySingleton<AgreementServices>(() => AgreementServices());
  locator.registerLazySingleton<MarketplaceServices>(() => MarketplaceServices());
}
