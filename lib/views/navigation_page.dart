import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true, // FIXED BOTTOM BAR'S BG COLOR
      body: Provider.of<NavigationPageProvider>(context)
          .pages[Provider.of<NavigationPageProvider>(context).currentTabIndex],

      bottomNavigationBar: Container(
        width: deviceWidth,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black54.withOpacity(0.35),
          //     offset: Offset(0, 10),
          //     blurRadius: 48,
          //   ),
          // ],
          color: Provider.of<ThemeProvider>(context).themeMode == "light"
              ? AppTheme.white1
              : AppTheme.black5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ButtonTheme(
                height: 60,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white1
                            : AppTheme.black5,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/homepage.png',
                              width: 23,
                              height: 22,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          0
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15),
                          SizedBox(height: 4),
                          Text('Anasayfa',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          0
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15)),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      Provider.of<NavigationPageProvider>(context,
                              listen: false)
                          .updateCurrentTabIndex(0);
                    }),
              ),
            ),
            Expanded(
              child: ButtonTheme(
                height: 60,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white1
                            : AppTheme.black5,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/market.png',
                              width: 22,
                              height: 21,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          1
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15),
                          SizedBox(height: 4),
                          Text('Pazaryeri',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          1
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15)),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      Provider.of<NavigationPageProvider>(context,
                              listen: false)
                          .updateCurrentTabIndex(1);
                    }),
              ),
            ),
            Expanded(
              child: ButtonTheme(
                height: 60,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white1
                            : AppTheme.black5,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/people.png',
                              width: 21,
                              height: 21,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          2
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15),
                          SizedBox(height: 4),
                          Text('Firmalar',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          2
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15)),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      Provider.of<NavigationPageProvider>(context,
                              listen: false)
                          .updateCurrentTabIndex(2);
                    }),
              ),
            ),
            Expanded(
              child: ButtonTheme(
                height: 60,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white1
                            : AppTheme.black5,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/panel.png',
                              width: 19,
                              height: 19,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          3
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15),
                          SizedBox(height: 5),
                          Text('Panelim',
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          3
                                      ? Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.blue1
                                      : AppTheme.white15)),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      Provider.of<NavigationPageProvider>(context,
                              listen: false)
                          .updateCurrentTabIndex(3);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
