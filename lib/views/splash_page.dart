// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/login_register/language_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //  THIS FUNCTION MAKES THE SPLASH SCREEN APPEAR FOR AT LEAST 1.5 SECONDS.
    Timer(const Duration(milliseconds: 1500), () => checkToken());

    super.initState();
  }

  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("Token");

    if (token == null) {
      debugPrint("TOKEN NOT AVAILABLE");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const LanguagePage();
      }));
    } else if (token.isEmpty) {
      debugPrint("TOKEN NOT AVAILABLE");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const LanguagePage();
      }));
    } else {
      debugPrint("TOKEN AVAILABLE");
      Constants.userToken = token;
      debugPrint("TOKEN:${Constants.userToken}");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const NavigationPage();
      }));
    }
  }

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    // CONTROL OF APP ORIENTATION
    if (deviceHeight < 450 || deviceWidth < 450) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white1
          : AppTheme.black12,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Provider.of<ThemeProvider>(context).themeMode == "light"
                  ? Image.asset(
                      'assets/images/b2geta_logo_light.png',
                      width: 202.69,
                      height: 27.35,
                    )
                  : Image.asset(
                      'assets/images/b2geta_logo_dark.png',
                      width: 202.69,
                      height: 27.35,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
