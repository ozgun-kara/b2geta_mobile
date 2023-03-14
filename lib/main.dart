import 'package:b2geta_mobile/app_languages.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/providers/basket_page_provider.dart';
import 'package:b2geta_mobile/providers/company_profile_page_provider.dart';
import 'package:b2geta_mobile/providers/personal_profile_page_provider.dart';
import 'package:b2geta_mobile/providers/home_page_provider.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/my_account_page_provider.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/login_register/language_page.dart';
import 'package:b2geta_mobile/views/menu/company/sub_pages/my_companies_sub_page.dart';
import 'package:b2geta_mobile/views/menu/menu_page.dart';
import 'package:b2geta_mobile/views/notification_page.dart';
import 'package:b2geta_mobile/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  setupLocator();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
    ),
    ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) => UserProvider(),
    ),
    ChangeNotifierProvider<LoginRegisterPageProvider>(
      create: (BuildContext context) => LoginRegisterPageProvider(),
    ),
    ChangeNotifierProvider<NavigationPageProvider>(
      create: (BuildContext context) => NavigationPageProvider(),
    ),
    ChangeNotifierProvider<MenuPageProvider>(
      create: (BuildContext context) => MenuPageProvider(),
    ),
    ChangeNotifierProvider<MarketPlacePageProvider>(
      create: (BuildContext context) => MarketPlacePageProvider(),
    ),
    ChangeNotifierProvider<BasketPageProvider>(
      create: (BuildContext context) => BasketPageProvider(),
    ),
    ChangeNotifierProvider<CompanyProfilePageProvider>(
      create: (BuildContext context) => CompanyProfilePageProvider(),
    ),
    ChangeNotifierProvider<PersonalProfilePageProvider>(
      create: (BuildContext context) => PersonalProfilePageProvider(),
    ),
    ChangeNotifierProvider<MyAccountPageProvider>(
      create: (BuildContext context) => MyAccountPageProvider(),
    ),
    ChangeNotifierProvider<HomePageProvider>(
      create: (BuildContext context) => HomePageProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GetStorage box = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppLanguages(),
      locale: box.read("language") == null
          ? Get.deviceLocale
          : box.read("language") == "tr_TR"
              ? const Locale("tr", "TR")
              : const Locale("en", "US"),
      // fallbackLocale: const Locale('en', 'US'), // DEFAULT LANGUAGE
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'B2GETA',
      home: const SplashPage(),
      // home: NavigationPage(),
      // home: RegisterPage(),
      // home: LanguagePage(),
      // home: NotificationPage()
      // home: MenuPage(),
      // home: MyCompaniesSubPage()
    );
  }
}
