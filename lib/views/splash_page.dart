import 'dart:async';
import 'package:b2geta_mobile/app_constants.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/language_selection_page.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

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
        const Duration(milliseconds: 2000),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              // return LoginPage();
              return LanguageSelectionPage();
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
      backgroundColor: Color(0xFF21233A),
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
            // SizedBox(height: 30),
            // FlutterSwitch(
            //   width: 41,
            //   height: 24,
            //   toggleSize: 18,
            //   padding: 3,
            //   borderRadius: 100,
            //   activeColor: Colors.green,
            //   inactiveColor: Color(0xFFD6D8E7),
            //   toggleColor: Colors.white,
            //   value: Provider.of<ThemeProvider>(context).themeSwitch,
            //   onToggle: (value) {
            //     Provider.of<ThemeProvider>(context, listen: false)
            //         .updateThemeSwitch(value);
            //
            //     // context
            //     //     .read<ThemeProvider>()
            //     //     .updateThemeSwitch(value);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
