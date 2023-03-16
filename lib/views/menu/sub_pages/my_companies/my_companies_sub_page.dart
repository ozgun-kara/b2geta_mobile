import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/add_company_sub_page.dart';
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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: 1,
              color: themeMode ? AppTheme.white21 : AppTheme.black28,
            ),
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
                        'Add Company'.tr,
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
                                  AddCompanySubPage(operation: 'Add'),
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
                              'Name'.tr,
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
                                color: themeMode
                                    ? AppTheme.blue2
                                    : AppTheme.white1,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Role:'.tr,
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15),
                                    ),
                                    Text(
                                      'Admin'.tr,
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
                                      'Status:'.tr,
                                      style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15),
                                    ),
                                    Text(
                                      'Approved'.tr,
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
                                    'Edit'.tr,
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
                                              AddCompanySubPage(operation: 'Edit'),
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
                                    'Choose'.tr,
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
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
