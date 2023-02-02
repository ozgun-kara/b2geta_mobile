import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'company_addresses_subpage.dart';
import 'company_orders_sub_pages.dart';

class CompanyProfileMenuSubPage extends StatefulWidget {
  const CompanyProfileMenuSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyProfileMenuSubPage> createState() =>
      _CompanyProfileMenuSubPageState();
}

class _CompanyProfileMenuSubPageState extends State<CompanyProfileMenuSubPage> {
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
      body: Column(
        children: [
          const SizedBox(height: 48),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Siparişlerim",
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
                      builder: (context) => const CompanyOrdersSubPage(),
                    ));
              }),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Anlaşmazlıklar",
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
                "Hesap Ayarları",
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
                "Adreslerim",
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
                      builder: (context) => const CompanyAddressesSubPage(),
                    ));
              }),
          const SizedBox(height: 8),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Takip Listesi",
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
                "Çıkış",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
