import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductAddedSubPage extends StatefulWidget {
  const ProductAddedSubPage({Key? key}) : super(key: key);

  @override
  State<ProductAddedSubPage> createState() => _ProductAddedSubPageState();
}

class _ProductAddedSubPageState extends State<ProductAddedSubPage> {
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

    return WillPopScope(
        onWillPop: () async {
          int count = 0;
          Navigator.of(context).popUntil((_) => count++ >= 2);
          return true;
        },
        child: Scaffold(
            backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
            appBar: AppBar(
              toolbarHeight: 68,
              backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  splashRadius: 24,
                  icon: Image.asset(
                    'assets/icons/back-2.png',
                    width: 23,
                    height: 17,
                    color: AppTheme.white15,
                  ),
                  onPressed: () {
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  },
                ),
              ),
              title: SizedBox(
                  width: 103.74,
                  height: 14.0,
                  child: themeMode
                      ? Image.asset('assets/images/b2geta_logo_light.png')
                      : Image.asset('assets/images/b2geta_logo_dark.png')),
            ),
            body: Column(
              children: [
                const SizedBox(height: 237),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/check-2.png",
                        width: 75.83,
                        height: 75.83,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: 252,
                        child: Text(
                          'Product Added Message'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w600,
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 74),
                MaterialButton(
                    height: 47,
                    color: AppTheme.blue2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: Text(
                      'Product List'.tr,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.white1),
                    ),
                    onPressed: () {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                    }),
              ],
            )));
  }
}
