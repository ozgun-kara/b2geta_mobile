import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/login_register/language_selection_page.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:b2geta_mobile/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
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
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      // translations: AppLanguages(),
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      debugShowCheckedModeBanner: false,
      title: 'B2GETA',
      // home: SplashPage(),
      // home: NavigationPage(),
      home: LoginPage(),
      // home: RegisterPage(),
      // home: LanguageSelectionPage(),
    );
  }
}
