import 'dart:async';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/language_selection_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // THIS FUNCTION MAKES THE SPLASH SCREEN APPEAR FOR AT LEAST 2 SECONDS.
    Timer(
        const Duration(milliseconds: 2000),
        () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
              // return LoginPage();
              // return LanguageSelectionPage();
              // return RegisterPage();
              return NavigationPage();
            })));
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
            // Column(
            //   children: [
            //     SizedBox(height: 30),
            //     Text(
            //       Provider.of<ThemeProvider>(context).themeMode == "light"
            //           ? "LIGHT TEMA AKTIF"
            //           : "DARK TEMA AKTIF",
            //       style: TextStyle(
            //           fontFamily: AppTheme.appFontFamily,
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.lightBlue),
            //     ),
            //     SizedBox(height: 30),
            //     MaterialButton(
            //       onPressed: () => {
            //         debugPrint('Set Light Theme'),
            //         Provider.of<ThemeProvider>(context, listen: false)
            //             .setLightMode()
            //       },
            //       child: Text('Set Light Theme'),
            //     ),
            //     MaterialButton(
            //       onPressed: () => {
            //         debugPrint('Set Dark theme'),
            //         Provider.of<ThemeProvider>(context, listen: false)
            //             .setDarkMode()
            //       },
            //       child: Text('Set Dark theme'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
