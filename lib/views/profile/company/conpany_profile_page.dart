import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyProfilPage extends StatefulWidget {
  const CompanyProfilPage({Key? key}) : super(key: key);

  @override
  State<CompanyProfilPage> createState() => _CompanyProfilPageState();
}

class _CompanyProfilPageState extends State<CompanyProfilPage> {
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
          Container(
            width: deviceWidth,
            color: themeMode ? AppTheme.white1 : AppTheme.black5,
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: [
                Container(
                    width: deviceWidth,
                    height: 1,
                    color: themeMode ? AppTheme.white31 : AppTheme.black2),
                SizedBox(height: 25),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: AppTheme.white21),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://s3.gifyu.com/images/dummy-logo-22408bfa4a3ddec34.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Text(
                  "İteme İnşaat ve Tesisat",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w700,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "İstanbul, Türkiye",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 22,
                  child: ButtonTheme(
                    minWidth: double.minPositive,
                    height: 22,
                    child: MaterialButton(
                        elevation: 0,
                        color: AppTheme.blue2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(36)),
                        ),
                        padding: EdgeInsets.fromLTRB(13, 2, 13, 0),
                        child: Text(
                          "Takip Et",
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1,
                          ),
                        ),
                        onPressed: () async {}),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                    width: deviceWidth,
                    height: 1,
                    color: themeMode ? AppTheme.white31 : AppTheme.black2),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: ButtonTheme(
                //         height: 49,
                //         child: MaterialButton(
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.only(
                //                 bottomLeft: Radius.circular(16),
                //                 bottomRight: Radius.circular(16),
                //               ),
                //             ),
                //             // color:
                //             //     Provider.of<ThemeProvider>(context).themeMode ==
                //             //             "light"
                //             //         ? AppTheme.white1
                //             //         : AppTheme.black5,
                //             elevation: 0,
                //             child: FittedBox(
                //               fit: BoxFit.none,
                //               child: Image.asset('assets/icons/homepage.png',
                //                   width: 23,
                //                   height: 22,
                //                   color: provider.currentTabIndex == 0
                //                       ? Provider.of<ThemeProvider>(context)
                //                                   .themeMode ==
                //                               "light"
                //                           ? AppTheme.blue2
                //                           : AppTheme.blue1
                //                       : AppTheme.white15),
                //             ),
                //             onPressed: () {
                //               provider.updateCurrentTabIndex(0);
                //             }),
                //       ),
                //     ),
                //     Expanded(
                //       child: ButtonTheme(
                //         height: 60,
                //         child: MaterialButton(
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(16),
                //                 topRight: Radius.circular(16),
                //               ),
                //             ),
                //             color:
                //                 Provider.of<ThemeProvider>(context).themeMode ==
                //                         "light"
                //                     ? AppTheme.white1
                //                     : AppTheme.black5,
                //             elevation: 0,
                //             child: FittedBox(
                //               fit: BoxFit.none,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Image.asset('assets/icons/market.png',
                //                       width: 22,
                //                       height: 21,
                //                       color: provider.currentTabIndex == 1
                //                           ? Provider.of<ThemeProvider>(context)
                //                                       .themeMode ==
                //                                   "light"
                //                               ? AppTheme.blue2
                //                               : AppTheme.blue1
                //                           : AppTheme.white15),
                //                   SizedBox(height: 4),
                //                   Text('Marketplace'.tr,
                //                       style: TextStyle(
                //                           fontSize: 9,
                //                           fontFamily: AppTheme.appFontFamily,
                //                           fontWeight: FontWeight.w600,
                //                           color: provider.currentTabIndex == 1
                //                               ? Provider.of<ThemeProvider>(
                //                                               context)
                //                                           .themeMode ==
                //                                       "light"
                //                                   ? AppTheme.blue2
                //                                   : AppTheme.blue1
                //                               : AppTheme.white15)),
                //                 ],
                //               ),
                //             ),
                //             onPressed: () {
                //               provider.updateCurrentTabIndex(1);
                //             }),
                //       ),
                //     ),
                //     Expanded(
                //       child: ButtonTheme(
                //         height: 60,
                //         child: MaterialButton(
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(16),
                //                 topRight: Radius.circular(16),
                //               ),
                //             ),
                //             color:
                //                 Provider.of<ThemeProvider>(context).themeMode ==
                //                         "light"
                //                     ? AppTheme.white1
                //                     : AppTheme.black5,
                //             elevation: 0,
                //             child: FittedBox(
                //               fit: BoxFit.none,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Image.asset('assets/icons/shopping_car.png',
                //                       width: 21,
                //                       height: 21,
                //                       color: provider.currentTabIndex == 2
                //                           ? Provider.of<ThemeProvider>(context)
                //                                       .themeMode ==
                //                                   "light"
                //                               ? AppTheme.blue2
                //                               : AppTheme.blue1
                //                           : AppTheme.white15),
                //                   SizedBox(height: 4),
                //                   Text('My Basket'.tr,
                //                       style: TextStyle(
                //                           fontSize: 9,
                //                           fontFamily: AppTheme.appFontFamily,
                //                           fontWeight: FontWeight.w600,
                //                           color: provider.currentTabIndex == 2
                //                               ? Provider.of<ThemeProvider>(
                //                                               context)
                //                                           .themeMode ==
                //                                       "light"
                //                                   ? AppTheme.blue2
                //                                   : AppTheme.blue1
                //                               : AppTheme.white15)),
                //                 ],
                //               ),
                //             ),
                //             onPressed: () {
                //               provider.updateCurrentTabIndex(2);
                //             }),
                //       ),
                //     ),
                //     Expanded(
                //       child: ButtonTheme(
                //         height: 60,
                //         child: MaterialButton(
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(16),
                //                 topRight: Radius.circular(16),
                //               ),
                //             ),
                //             color:
                //                 Provider.of<ThemeProvider>(context).themeMode ==
                //                         "light"
                //                     ? AppTheme.white1
                //                     : AppTheme.black5,
                //             elevation: 0,
                //             child: FittedBox(
                //               fit: BoxFit.none,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Image.asset('assets/icons/panel.png',
                //                       width: 19,
                //                       height: 19,
                //                       color: provider.currentTabIndex == 3
                //                           ? Provider.of<ThemeProvider>(context)
                //                                       .themeMode ==
                //                                   "light"
                //                               ? AppTheme.blue2
                //                               : AppTheme.blue1
                //                           : AppTheme.white15),
                //                   SizedBox(height: 5),
                //                   Text('My Panel'.tr,
                //                       style: TextStyle(
                //                           fontSize: 9,
                //                           fontFamily: AppTheme.appFontFamily,
                //                           fontWeight: FontWeight.w600,
                //                           color: provider.currentTabIndex == 3
                //                               ? Provider.of<ThemeProvider>(
                //                                               context)
                //                                           .themeMode ==
                //                                       "light"
                //                                   ? AppTheme.blue2
                //                                   : AppTheme.blue1
                //                               : AppTheme.white15)),
                //                 ],
                //               ),
                //             ),
                //             onPressed: () {
                //               provider.updateCurrentTabIndex(3);
                //             }),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
