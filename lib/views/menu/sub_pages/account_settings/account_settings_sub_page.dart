import 'dart:ui';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class AccountSettingsSubPage extends StatefulWidget {
  const AccountSettingsSubPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingsSubPage> createState() => _AccountSettingsSubPageState();
}

class _AccountSettingsSubPageState extends State<AccountSettingsSubPage> {
  ScrollController scrollController = ScrollController();
  final MemberServices _memberServices = MemberServices();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
      appBar: const CustomInnerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: 1,
              color: themeMode ? AppTheme.white21 : AppTheme.black28,
            ),
            const SizedBox(height: 27),
            Text(
              'Account Settings'.tr,
              style: TextStyle(
                fontFamily: AppTheme.appFontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            const SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 13.0,
              ),
              child: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.white1
                          : AppTheme.black3,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Color.fromRGBO(41, 67, 214, 0.05),
                        blurRadius: 26,
                        spreadRadius: 0),
                  ],
                ),
                child: ButtonTheme(
                  minWidth: 32,
                  child: MaterialButton(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    onPressed: () {
                      dialog(
                          titleText:
                              'Are you sure you want to delete your account?'
                                  .tr,
                          buttonText: 'Yes'.tr,
                          buttonColor: AppTheme.red2,
                          onPressed: () {
                            _memberServices.deleteAccountCall().then((value) {
                              if (value) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const LoginPage(
                                        email: '',
                                      ),
                                      transitionDuration:
                                          const Duration(milliseconds: 0),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 0),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ));
                              }
                            });
                          });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/tabler_trash.png",
                          width: 16,
                          color: AppTheme.red2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Delete My Account'.tr,
                          style: TextStyle(
                            fontFamily: AppTheme.appFontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dialog(
      {required String titleText,
      required String buttonText,
      required buttonColor,
      required VoidCallback onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(4),
            backgroundColor: Colors.transparent,
            content: Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                  color: themeMode ? AppTheme.white1 : AppTheme.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          titleText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                themeMode ? AppTheme.black25 : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        height: 32,
                        child: MaterialButton(
                            elevation: 0,
                            color:
                                themeMode ? AppTheme.black16 : AppTheme.black18,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              'Close'.tr,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ButtonTheme(
                        height: 32,
                        child: MaterialButton(
                            elevation: 0,
                            color: buttonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              buttonText,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
