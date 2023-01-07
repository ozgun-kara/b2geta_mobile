import 'package:b2geta_mobile/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme.dart';
import '../../providers/theme_provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    var themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/menu.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {},
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
                  showSnackbar(
                      context: context, message: 'Dark Theme Activated');
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode();
                  showSnackbar(
                      context: context, message: 'Light Theme Activated');
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
            child: Column(
              children: [
                const SizedBox(height: 1),
                Container(
                  width: deviceWidth,
                  height: 32,
                  color: themeMode ? AppTheme.white1 : AppTheme.black5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      children: [
                        Text(
                          "Ana Sayfa - Sepetim",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: deviceWidth,
                  height: 83.0,
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  decoration: BoxDecoration(
                    color: AppTheme.blue2,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 23.0,
                        height: 21.0,
                        child: Image.asset(
                          'assets/icons/shopping_car.png',
                          color: AppTheme.white1,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Sepetim',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1,
                            ),
                          ),
                          TextSpan(
                            text: ' (3)',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.white1,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: deviceWidth,
                      height: 47.0,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: themeMode ? AppTheme.white22 : AppTheme.black18,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Özturanlar Mobilya",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w800,
                            color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: deviceWidth,
                      height: 200,
                      padding: const EdgeInsets.all(9.0),
                      decoration: BoxDecoration(
                          color: themeMode ? AppTheme.white1 : AppTheme.black7,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 82.0,
                            height: 82.0,
                            decoration: BoxDecoration(
                                color: themeMode
                                    ? AppTheme.white21
                                    : AppTheme.black20,
                                border: Border.all(
                                  color: themeMode
                                      ? AppTheme.white21
                                      : AppTheme.black20,
                                      
                                ),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Image.asset('assets/images/bag_image.png'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
