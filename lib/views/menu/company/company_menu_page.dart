import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/menu_addresses_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/menu_orders_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/menu_settings_sub_page.dart';
import 'package:b2geta_mobile/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CompanyMenuPage extends StatefulWidget {
  const CompanyMenuPage({Key? key}) : super(key: key);

  @override
  State<CompanyMenuPage> createState() => _CompanyMenuPageState();
}

class _CompanyMenuPageState extends State<CompanyMenuPage> {
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
              'assets/icons/back-2.png',
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
      ),
      body: Column(
        children: [
          const SizedBox(height: 48),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'My Companies'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {}),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'My Products'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {}),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'My Orders'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuOrdersSubPage(),
                    ));
              }),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Disagreements'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {}),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Account Settings'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {}),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'My Addresses'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuAddressesSubPage(),
                    ));
              }),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Follow List'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {}),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Settings'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuSettingsSubPage(),
                    ));
              }),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Log Out'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {
                MemberServices().logoutCall().then((value) {
                  if (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashPage(),
                        ));
                  }
                });
              }),
        ],
      ),
    );
  }
}
