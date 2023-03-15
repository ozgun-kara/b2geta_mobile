import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/menu_my_companies_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MenuCompanyAddedSubPage extends StatefulWidget {
  const MenuCompanyAddedSubPage({Key? key}) : super(key: key);

  @override
  State<MenuCompanyAddedSubPage> createState() =>
      _MenuCompanyAddedSubPageState();
}

class _MenuCompanyAddedSubPageState extends State<MenuCompanyAddedSubPage> {
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
        backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 178),
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
                      "Firmanız Eklendi.\nOnaylandıktan sonra firma profilinizi kullanabilirsiniz.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 42),
            MaterialButton(
                height: 47,
                color: AppTheme.blue2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 43),
                child: Text(
                  'My Companies'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuMyCompaniesSubPage(),
                      ));
                })
          ],
        ));
  }
}
