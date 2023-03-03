import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/basket/basket_page.dart';
import 'package:b2geta_mobile/views/menu/menu_page.dart';
import 'package:b2geta_mobile/views/messages/messages_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  TextEditingController searchController = TextEditingController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    var themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<NavigationPageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true, // FIXED BOTTOM BAR'S BG COLOR

            appBar: provider.searchState
                ? searchAppBar(themeMode)
                : defaultAppBar(themeMode),
            body: provider.pages[provider.currentTabIndex],
            
            // body: IndexedStack(
            //   index: provider.currentTabIndex,
            //   children: provider.pages,
            // ),
            bottomNavigationBar: Container(
              width: deviceWidth,
              height: 60,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(16), topRight: Radius.circular(16)),
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
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
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
                                    color: provider.currentTabIndex == 0
                                        ? Provider.of<ThemeProvider>(context)
                                                    .themeMode ==
                                                "light"
                                            ? AppTheme.blue2
                                            : AppTheme.white1
                                        : AppTheme.white15),
                                const SizedBox(height: 4),
                                Text('Homepage'.tr,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: provider.currentTabIndex == 0
                                            ? Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15)),
                              ],
                            ),
                          ),
                          onPressed: () {
                            provider.updateCurrentTabIndex(0);
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
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
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
                                    color: provider.currentTabIndex == 1
                                        ? Provider.of<ThemeProvider>(context)
                                                    .themeMode ==
                                                "light"
                                            ? AppTheme.blue2
                                            : AppTheme.white1
                                        : AppTheme.white15),
                                const SizedBox(height: 4),
                                Text('Marketplace'.tr,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: provider.currentTabIndex == 1
                                            ? Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15)),
                              ],
                            ),
                          ),
                          onPressed: () {
                            provider.updateCurrentTabIndex(1);
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
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.white1
                                  : AppTheme.black5,
                          elevation: 0,
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icons/shopping_car.png',
                                    width: 21,
                                    height: 21,
                                    color: provider.currentTabIndex == 2
                                        ? Provider.of<ThemeProvider>(context)
                                                    .themeMode ==
                                                "light"
                                            ? AppTheme.blue2
                                            : AppTheme.white1
                                        : AppTheme.white15),
                                const SizedBox(height: 4),
                                Text('My Basket'.tr,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: provider.currentTabIndex == 2
                                            ? Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15)),
                              ],
                            ),
                          ),
                          onPressed: () {
                            provider.updateCurrentTabIndex(2);
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
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.white1
                                  : AppTheme.black5,
                          elevation: 0,
                          child: FittedBox(
                            fit: BoxFit.none,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/profile.png',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(height: 5),
                                Text('My Account'.tr,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w600,
                                        color: provider.currentTabIndex == 3
                                            ? Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15)),
                              ],
                            ),
                          ),
                          onPressed: () {
                            provider.updateCurrentTabIndex(3);
                          }),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  PreferredSizeWidget defaultAppBar(themeMode) {
    return AppBar(
        toolbarHeight: 68,
        backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/menu.png',
              width: 23,
              height: 17,
              color: AppTheme.white15,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const MenuPage(),
                  ));
            },
          ),
        ),
        title: SizedBox(
            width: 103.74,
            height: 14.0,
            child: themeMode
                ? Image.asset('assets/images/b2geta_logo_light.png')
                : Image.asset('assets/images/b2geta_logo_dark.png')),
        actions: [
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/search.png',
              width: 19,
              height: 19,
              color: AppTheme.white15,
            ),
            onPressed: () {
              Provider.of<NavigationPageProvider>(context, listen: false)
                  .updateSearchState();
            },
          ),
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/bell.png',
              width: 16.0,
              height: 18.0,
              color: AppTheme.white15,
            ),
            onPressed: () {},
          ),
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/message.png',
              width: 19.0,
              height: 16.0,
              color: AppTheme.white15,
            ),
            onPressed: navigateToMessagePage,
          ),
        ]);
  }

  PreferredSizeWidget searchAppBar(themeMode) {
    return AppBar(
      toolbarHeight: 68,
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          splashRadius: 24,
          icon: Image.asset(
            'assets/icons/close.png',
            width: 14,
            height: 12,
            color: AppTheme.white15,
          ),
          onPressed: () {
            Provider.of<NavigationPageProvider>(context, listen: false)
                .updateSearchState();
          },
        ),
      ),
      leadingWidth: 45,
      centerTitle: true,
      title: SizedBox(
        height: 39,
        child: TextFormField(
          controller: searchController,
          style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode
                  ? AppTheme.black11
                  : AppTheme.white1), // WHILE WRITING
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            filled: true,
            fillColor: themeMode ? AppTheme.white3 : AppTheme.black7,
            hintText: 'AppBar Search'.tr,
            hintStyle: TextStyle(
              fontSize: 11,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w600,
              color: AppTheme.white13,
            ),
            prefixIcon: IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: SizedBox(
                width: 19,
                height: 19,
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 19,
                  height: 19,
                  color: AppTheme.white15,
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(41),
                borderSide: BorderSide(
                  color: themeMode ? AppTheme.white10 : AppTheme.black14,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(41),
                borderSide: BorderSide(
                  color: themeMode ? AppTheme.white10 : AppTheme.black14,
                  width: 1,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(41),
              borderSide: BorderSide(
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void navigateToBasketPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const BasketPage()));
  }

  void navigateToMessagePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MessagesPage()));
  }
}
