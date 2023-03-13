import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/menu/company/company_add_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MyCompaniesSubPage extends StatefulWidget {
  const MyCompaniesSubPage({Key? key}) : super(key: key);

  @override
  State<MyCompaniesSubPage> createState() => _MyCompaniesSubPageState();
}

class _MyCompaniesSubPageState extends State<MyCompaniesSubPage> {
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
          const SizedBox(height: 27),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  'My Companies'.tr,
                  style: TextStyle(
                    fontFamily: AppTheme.appFontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
                SizedBox(height: 21),
                MaterialButton(
                    minWidth: deviceWidth,
                    height: 52,
                    elevation: 0,
                    color: AppTheme.blue2,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Text(
                      'Firma Ekle'.tr,
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
                                CompanyAddPage(operation: 'Add'),
                          ));
                    }),
              ],
            ),
          ),
          const SizedBox(height: 17),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white21 : AppTheme.black28,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 28, 0, 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontFamily: AppTheme.appFontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.white15,
                            ),
                          ),
                          Text(
                            'Test Firma',
                            style: TextStyle(
                              fontFamily: AppTheme.appFontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white1,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Role:',
                                    style: TextStyle(
                                        fontFamily: AppTheme.appFontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.white15),
                                  ),
                                  Text(
                                    'Admin',
                                    style: TextStyle(
                                      fontFamily: AppTheme.appFontFamily,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 48),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Durum:',
                                    style: TextStyle(
                                        fontFamily: AppTheme.appFontFamily,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.white15),
                                  ),
                                  Text(
                                    'Onaylandı',
                                    style: TextStyle(
                                      fontFamily: AppTheme.appFontFamily,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                                minWidth: deviceWidth,
                                height: 47,
                                elevation: 0,
                                color: AppTheme.blue2,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                ),
                                child: Text(
                                  'Düzenle'.tr,
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
                                        builder: (context) =>
                                            CompanyAddPage(operation: 'Edit'),
                                      ));
                                }),
                          ),
                          SizedBox(width: 9),
                          Expanded(
                            child: MaterialButton(
                                minWidth: deviceWidth,
                                height: 47,
                                elevation: 0,
                                // color: AppTheme.green1,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1, color: AppTheme.green1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                ),
                                child: Text(
                                  'Seç'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.green1),
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white21 : AppTheme.black28,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
