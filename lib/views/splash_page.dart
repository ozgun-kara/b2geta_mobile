import 'dart:async';
import 'package:b2geta_mobile/app_dark_theme.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double? deviceWidth;
  double? deviceHeight;

  @override
  void initState() {
    super.initState();

    // THIS FUNCTION MAKES THE SPLASH SCREEN APPEAR FOR AT LEAST 2 SECONDS.
    Timer(
        const Duration(milliseconds: 2000000),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              return LoginPage();
            })));
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    // CONTROL OF APP ORIENTATION
    if (deviceHeight! < 450 || deviceWidth! < 450) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return Scaffold(
      backgroundColor: AppDarkTheme().pageBackgroundColor1,
      body: SizedBox(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/b2geta_logo_dark.png',
              width: 202.69,
              height: 27.35,
            ),
          ],
        ),
      ),
    );
  }
}
