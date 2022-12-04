import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true, // FIXED BOTTOM BAR'S BG COLOR
      body: Provider.of<NavigationPageProvider>(context)
          .pages[Provider.of<NavigationPageProvider>(context).currentTabIndex],

      bottomNavigationBar: Container(
        width: deviceWidth,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.35),
              offset: Offset(0, 10),
              blurRadius: 48,
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ButtonTheme(
                height: 56,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/homepage.png',
                              width: 20,
                              height: 20,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          0
                                      ? AppTheme.green1
                                      : AppTheme.white9),
                          SizedBox(height: 4),
                          Text('Anasayfa',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight:
                                      Provider.of<NavigationPageProvider>(
                                                      context)
                                                  .currentTabIndex ==
                                              0
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          0
                                      ? AppTheme.green1
                                      : AppTheme.white9)),
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
                height: 56,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/market.png',
                              width: 20,
                              height: 20,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          1
                                      ? AppTheme.green1
                                      : AppTheme.white9),
                          SizedBox(height: 4),
                          Text('Arama Yap',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight:
                                      Provider.of<NavigationPageProvider>(
                                                      context)
                                                  .currentTabIndex ==
                                              1
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          1
                                      ? AppTheme.green1
                                      : AppTheme.white9)),
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
                height: 56,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/people.png',
                              width: 20,
                              height: 20,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          2
                                      ? AppTheme.green1
                                      : AppTheme.white9),
                          SizedBox(height: 4),
                          Text('Kütüphane',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight:
                                      Provider.of<NavigationPageProvider>(
                                                      context)
                                                  .currentTabIndex ==
                                              2
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          2
                                      ? AppTheme.green1
                                      : AppTheme.white9)),
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
                height: 56,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: FittedBox(
                      fit: BoxFit.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/panel.png',
                              width: 20,
                              height: 20,
                              color:
                                  Provider.of<NavigationPageProvider>(context)
                                              .currentTabIndex ==
                                          3
                                      ? AppTheme.green1
                                      : AppTheme.white9),
                          SizedBox(height: 4),
                          Text('Profil',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight:
                                      Provider.of<NavigationPageProvider>(
                                                      context)
                                                  .currentTabIndex ==
                                              3
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  color: Provider.of<NavigationPageProvider>(
                                                  context)
                                              .currentTabIndex ==
                                          3
                                      ? AppTheme.green1
                                      : AppTheme.white9)),
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
