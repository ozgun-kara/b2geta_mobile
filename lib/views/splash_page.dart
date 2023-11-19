// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io' show Platform, exit;
import 'dart:ui';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/login_register/language_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version/version.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //  THIS FUNCTION MAKES THE SPLASH SCREEN APPEAR FOR AT LEAST 1.5 SECONDS.
    WidgetsFlutterBinding.ensureInitialized();
    init();

    super.initState();
  }

  init() async {
    await checkVersion();
    if (isUpdate == false) {
      Timer(const Duration(milliseconds: 1500), () {});
      checkToken();
    }
  }

  final MemberServices _memberServices = MemberServices();
  bool isUpdate = false;

  checkToken() async {
    GetStorage box = GetStorage();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("Token");

    if (token == null) {
      debugPrint("TOKEN NOT AVAILABLE");

      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const LanguagePage(),
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: const Duration(milliseconds: 0),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ));
    } else if (token.isEmpty) {
      debugPrint("TOKEN NOT AVAILABLE");

      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const LanguagePage(),
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: const Duration(milliseconds: 0),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ));
    } else {
      debugPrint("TOKEN AVAILABLE");
      Constants.userToken = token;
      debugPrint("TOKEN:${Constants.userToken}");
      Constants.userId = prefs.getString("UserId");
      debugPrint("USER ID:${Constants.userId}");
      Constants.language = box.read("language") == "tr_TR" ? 'tr' : 'en';
      debugPrint("LANGUAGE:${Constants.language}");

      await _memberServices.getProfileCall().then((value) {
        if (value != null) {
          if (value.type == 'company') {
            _memberServices
                .getCompanyProfileCall(userId: value.id!)
                .then((value2) {
              if (value2 != null) {
                Provider.of<UserProvider>(context, listen: false)
                    .updateUserModel(value.copyWith(companyName: value2.name));
              }
            });
          } else {
            Provider.of<UserProvider>(context, listen: false)
                .updateUserModel(value);
          }
        }
      });

      Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const NavigationPage(),
            transitionDuration: const Duration(milliseconds: 0),
            reverseTransitionDuration: const Duration(milliseconds: 0),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ));
    }
  }

  Future<void> checkVersion() async {
    var versionModel = await GeneralService().getVersion();

    if (versionModel != null) {
      var packageInfo = await PackageInfo.fromPlatform();

      var appVersion = Version.parse(packageInfo.version);
      var appBuildNumber = Version.parse(packageInfo.buildNumber);
      var latestAndroidVersion = Version.parse(versionModel.android!.version!);
      var latestIosVersion = Version.parse(versionModel.ios!.version!);
      //  Constants.apiUrl =versionModel.endpoint ?? 'https://api.businessucces.com/api';

      if (Platform.isAndroid) {
        // Android-specific code
        if (appBuildNumber < latestAndroidVersion && mounted) {
          updateVersionAppDialog(context, versionModel.android!.url!);
          setState(() {
            isUpdate = true;
          });
        }
      } else if (Platform.isIOS) {
        // iOS-specific code
        if (appVersion < latestIosVersion && mounted) {
          updateVersionAppDialog(context, versionModel.ios!.url!);
          setState(() {
            isUpdate = true;
          });
        }
      }
    }
  }

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

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

  void updateVersionAppDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(4),
              backgroundColor: Colors.transparent,
              content: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: themeMode ? AppTheme.white1 : AppTheme.black12,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'New version available'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w800,
                        color: themeMode ? AppTheme.black25 : AppTheme.white1,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'There are new features available, please update your app'
                          .tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: themeMode ? AppTheme.black25 : AppTheme.white1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                        width: deviceWidth,
                        height: 1,
                        color:
                            themeMode ? AppTheme.white32 : Colors.transparent),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonTheme(
                            height: 32,
                            child: MaterialButton(
                                elevation: 0,
                                color: themeMode
                                    ? AppTheme.black16
                                    : AppTheme.black18,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Text(
                                  'Close'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.white1),
                                ),
                                onPressed: () {
                                  exit(0);
                                }),
                          ),
                          ButtonTheme(
                            height: 32,
                            child: MaterialButton(
                                elevation: 0,
                                color: AppTheme.green1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Text(
                                  'Update'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.white1),
                                ),
                                onPressed: () {
                                  launch(url);
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }
}
