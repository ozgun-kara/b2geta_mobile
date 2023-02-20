import 'dart:math';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/member/address_model.dart';
// import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/member/member_addresses_services.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/menu_add_address_sub_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:ui';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class SettingsSubPage extends StatefulWidget {
  const SettingsSubPage({Key? key}) : super(key: key);

  @override
  State<SettingsSubPage> createState() => _SettingsSubPageState();
}

class _SettingsSubPageState extends State<SettingsSubPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  int value = 0;
  bool positive = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white36 : AppTheme.black12,
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/back.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: SizedBox(
              width: 103.74,
              height: 14.0,
              child: themeMode
                  ? Image.asset('assets/images/b2geta_logo_light.png')
                  : Image.asset('assets/images/b2geta_logo_dark.png')),
          actions: [
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/search.png',
                width: 19,
                height: 19,
                color: AppTheme.white15,
              ),
              onPressed: () {
                if (themeMode) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setDarkMode();
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode();
                }
              },
            ),
            const SizedBox(width: 4),
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/bell.png',
                width: 16.0,
                height: 18.0,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/message.png',
                width: 19.0,
                height: 16.0,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),
            Container(
              width: deviceWidth,
              height: 32,
              decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black5,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 26,
                    color: Color.fromRGBO(41, 67, 214, 0.05),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Settings Page Route'.tr,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.white15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              width: 74,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white40
                    : AppTheme.black26,
              ),
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<MenuPageProvider>(context, listen: false)
                          .updateThemeSwitch(false);
                      Provider.of<ThemeProvider>(context, listen: false)
                          .setDarkMode();
                    },
                    child: themeMode ==
                            false
                        ? Container(
                            width: 34,
                            height: 29,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                                color: AppTheme.black2),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/dark-mode.png',
                                width: 18,
                                height: 18,
                              ),
                            ),
                          )
                        : Container(
                            width: 34,
                            height: 29,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<MenuPageProvider>(context, listen: false)
                          .updateThemeSwitch(true);
                      Provider.of<ThemeProvider>(context, listen: false)
                          .setLightMode();
                    },
                    child: themeMode ==
                            true
                        ? Container(
                            width: 34,
                            height: 29,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(6)),
                                color: AppTheme.white1),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/ri_sun-line.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          )
                        : Container(
                            width: 34,
                            height: 29,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
