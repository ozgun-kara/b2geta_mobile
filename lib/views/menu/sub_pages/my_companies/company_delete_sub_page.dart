import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/company_deleted_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CompanyDeleteSubPage extends StatefulWidget {
  const CompanyDeleteSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyDeleteSubPage> createState() =>
      _CompanyDeleteSubPageState();
}

class _CompanyDeleteSubPageState extends State<CompanyDeleteSubPage> {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 143),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/icons/mdi_warning-circle-outline.png",
                      width: 97,
                      height: 97,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 252,
                      child: Text(
                        'Company Delete Message'.tr,
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
              const SizedBox(height: 50),
              MaterialButton(
                  minWidth: deviceWidth - 60,
                  height: 52,
                  elevation: 0,
                  color: AppTheme.green1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    'Yes I Accept'.tr,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white1),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CompanyDeletedSubPage(),
                        ));
                  }),
              const SizedBox(height: 20),
              MaterialButton(
                  minWidth: deviceWidth - 60,
                  height: 52,
                  elevation: 0,
                  color: AppTheme.red4,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    'No I don\'t Approve'.tr,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white1),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 202),
            ],
          ),
        ));
  }
}
