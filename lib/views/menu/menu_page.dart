import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/profile/company_profile_model.dart';
import 'package:b2geta_mobile/models/profile/personal_profile_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/account_settings/personal_account_settings_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/disagreements/disagreements_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/followers/followers_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_addresses/addresses_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/add_company_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_orders/company_orders_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_products/my_products_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/settings/settings_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/my_companies_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_orders/profile_orders_sub_page.dart';
import 'package:b2geta_mobile/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;
  final MemberServices _memberServices = MemberServices();
  PersonalProfileModel _personalProfileModel = PersonalProfileModel();
  CompanyProfileModel _companyProfileModel = CompanyProfileModel();

  @override
  void initState() {
    super.initState();
    getPersonalProfile(
        Provider.of<UserProvider>(context, listen: false).getUser.id!);
    if (Provider.of<UserProvider>(context, listen: false).getUser.type ==
        'company') {
      getCompanyProfile(
          Provider.of<UserProvider>(context, listen: false).getUser.id!);
    }
  }

  getPersonalProfile(String userId) async {
    await _memberServices.getPersonalProfileCall(userId: userId).then((value) {
      if (value != null) {
        _personalProfileModel = value;
        setState(() {});
      }
    });
  }

  getCompanyProfile(String userId) async {
    await _memberServices.getCompanyProfileCall(userId: userId).then((value) {
      if (value != null) {
        _companyProfileModel = value;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: const CustomInnerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            Visibility(
              visible:
                  Provider.of<UserProvider>(context).getUser.type != 'company',
              child: Column(
                children: [
                  MaterialButton(
                      minWidth: deviceWidth,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'My Companies'.tr,
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
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const MyCompaniesSubPage(),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      }),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            Visibility(
              // visible: Provider.of<UserProvider>(context).getUser.type == 'company',

              visible:
                  Provider.of<UserProvider>(context).getUser.type != 'personal',
              child: Column(
                children: [
                  MaterialButton(
                      minWidth: deviceWidth,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'My Products'.tr,
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
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  const MyProductsSubPage(),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      }),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'My Orders'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
                onPressed: () {
                  if (Provider.of<UserProvider>(context, listen: false)
                          .getUser
                          .type !=
                      'company') {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              const ProfileOrdersSubPage(),
                          transitionDuration: const Duration(milliseconds: 0),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 0),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              const CompanyOrdersSubPage(),
                          transitionDuration: const Duration(milliseconds: 0),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 0),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ));
                  }
                }),
            const SizedBox(height: 8),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Disagreements'.tr,
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
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            const DisagreementsSubPage(),
                        transitionDuration: const Duration(milliseconds: 0),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 0),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ));
                }),
            const SizedBox(height: 8),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Follow List'.tr,
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
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const FollowersSubPage(),
                        transitionDuration: const Duration(milliseconds: 0),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 0),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ));
                }),
            const SizedBox(height: 8),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'My Addresses'.tr,
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
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const AddressesSubPage(),
                        transitionDuration: const Duration(milliseconds: 0),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 0),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ));
                }),
            const SizedBox(height: 8),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Account Settings'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                              .getUser
                              .type ==
                          'company'
                      ? Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => AddCompanySubPage(
                              passedObject: _companyProfileModel,
                              operation: 'Account',
                            ),
                            transitionDuration: const Duration(milliseconds: 0),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ))
                      : Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                PersonalAccountSettingsSubPage(
                              personalProfileModel: _personalProfileModel,
                            ),
                            transitionDuration: const Duration(milliseconds: 0),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ));
                }),
            const SizedBox(height: 8),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Settings'.tr,
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
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const SettingsSubPage(),
                        transitionDuration: const Duration(milliseconds: 0),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 0),
                        transitionsBuilder: (_, a, __, c) =>
                            FadeTransition(opacity: a, child: c),
                      ));
                }),
            const SizedBox(height: 8),
            MaterialButton(
                minWidth: deviceWidth,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Log Out'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                  ),
                ),
                onPressed: () {
                  MemberServices().logoutCall().then((value) {
                    if (value) {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const SplashPage(),
                            transitionDuration: const Duration(milliseconds: 0),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ));
                    }
                  });
                }),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
