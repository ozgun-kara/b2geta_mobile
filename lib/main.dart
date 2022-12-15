import 'package:b2geta_mobile/app_languages.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/login_register/language_page.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:b2geta_mobile/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
    ),
    ChangeNotifierProvider<LoginRegisterPageProvider>(
      create: (BuildContext context) => LoginRegisterPageProvider(),
    ),
    ChangeNotifierProvider<NavigationPageProvider>(
      create: (BuildContext context) => NavigationPageProvider(),
    ),
    ChangeNotifierProvider<MarketPlacePageProvider>(
      create: (BuildContext context) => MarketPlacePageProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
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
      // home: const SplashPage(),
      // home: NavigationPage(),
      // home: LoginPage(),
      home: RegisterPage(),
      // home: LanguagePage(),
    );
  }
}
