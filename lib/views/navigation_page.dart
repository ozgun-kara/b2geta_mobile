import 'package:b2geta_mobile/models/personal_profile_model.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/basket_page_provider.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/basket/basket_page.dart';
import 'package:b2geta_mobile/views/menu/menu_page.dart';
import 'package:b2geta_mobile/views/messages/messages_page.dart';

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

  final MemberServices _memberServices = MemberServices();
  PersonalProfileModel? personalProfileModel;

  @override
  void initState() {
    Provider.of<BasketPageProvider>(context, listen: false).getAllBasket();
    getPersonalProfile(Provider.of<UserProvider>(context, listen: false)
        .getUser
        .id
        .toString());
    super.initState();
  }

  getPersonalProfile(String userId) async {
    await _memberServices.getPersonalProfileCall(userId: userId).then((value) {
      if (value != null) {
        personalProfileModel = value;
        setState(() {});
      }
    });
  }

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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white1
                            : AppTheme.black5,
                        elevation: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: (context
                                              .watch<UserProvider>()
                                              .getUser
                                              .avatar !=
                                          null &&
                                      context
                                          .watch<UserProvider>()
                                          .getUser
                                          .avatar!
                                          .isNotEmpty)
                                  ? Image.network(
                                      'https://api.businessucces.com/${context.watch<UserProvider>().getUser.avatar}',
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return ClipOval(
                                          child: Image.asset(
                                            width: 24,
                                            height: 24,
                                            'assets/images/dummy_images/user_profile.png',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    )
                                  : ClipOval(
                                      child: Image.asset(
                                        width: 24,
                                        height: 24,
                                        'assets/images/dummy_images/user_profile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 5),
                            Text('My Account'.tr,
                                style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: provider.currentTabIndex == 3
                                        ? Provider.of<ThemeProvider>(context)
                                                    .themeMode ==
                                                "light"
                                            ? AppTheme.blue2
                                            : AppTheme.white1
                                        : AppTheme.white15)),
                          ],
                        ),
                        onPressed: () {
                          provider.updateCurrentTabIndex(3);
                        },
                        onLongPress: () {
                          if (personalProfileModel != null &&
                              personalProfileModel!.companies!.isNotEmpty) {
                            _companyListModalBottomSheet(
                                context, personalProfileModel!);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void _companyListModalBottomSheet(
      BuildContext context, PersonalProfileModel personalProfileModel) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15.0),
          ),
        ),
        builder: (BuildContext bc) {
          return GestureDetector(
            onTapDown: (tapDetails) {
              if (tapDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width * 0.5) {
                Navigator.pop(context);
              }
            },
            child: Container(
                height: deviceHeight * .5,
                padding: EdgeInsets.only(left: deviceWidth * 0.5),
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: personalProfileModel.companies!.length,
                    itemBuilder: (context, index) {
                      var company = personalProfileModel.companies![index];
                      return GestureDetector(
                        onTap: () async {
                          /*   await CompanyServices()
                              .changeProfileAnotherCompanyCall(
                                  userId: company.id.toString())
                              .then((value) async {
                            if (value) {
                              await _memberServices
                                  .getProfileCall()
                                  .then((value) {
                                if (value != null) {
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .updateUserModel(value);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NavigationPage()),
                                  );
                                }
                              });
                            }
                          }); */
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompanyProfilePage(
                                      userId: company.id.toString(),
                                    )),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                company!.logo!.isNotEmpty
                                    ? Image.network(
                                        width: 20,
                                        height: 20,
                                        company.logo.toString(),
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            "assets/images/dummy_images/user_profile.png",
                                            width: 20,
                                            height: 20,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        width: 20,
                                        height: 20,
                                        'assets/images/dummy_images/user_profile.png'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    company.name.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white1),
                                  ),
                                ),
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                  ),
                )),
          );
        });
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
