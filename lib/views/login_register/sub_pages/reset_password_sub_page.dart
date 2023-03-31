import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';

class ResetPasswordSubPage extends StatefulWidget {
  const ResetPasswordSubPage({
    Key? key,
    required this.email,
    required this.verifyCode,
  }) : super(key: key);
  final String email;
  final String verifyCode;
  @override
  State<ResetPasswordSubPage> createState() => _ResetPasswordSubPageState();
}

class _ResetPasswordSubPageState extends State<ResetPasswordSubPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

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
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black12,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(116),
          child: Padding(
            padding: EdgeInsets.only(top: deviceTopPadding),
            child: AppBar(
              toolbarHeight: 30,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                splashRadius: 24,
                icon: Image.asset(
                  'assets/icons/back.png',
                  width: 27,
                  height: 13,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.blue3
                          : AppTheme.white14,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 65),
                // padding: EdgeInsets.only(top: 49),
                child: Text(
                  'Reset Password'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.appFontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.blue2
                            : AppTheme.white1,
                  ),
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 32, 30, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/b2geta_logo_white.png',
              width: 153,
              height: 20.65,
            ),
            Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password Validate-1'.tr;
                          }
                          if (value.trim().length < 8) {
                            return 'Password Validate-2'.tr;
                          }
                          return null;
                        },
                        controller: passwordController1,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: themeMode
                                ? AppTheme.black11
                                : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        obscureText:
                            !Provider.of<LoginRegisterPageProvider>(context)
                                .loginPasswordVisible,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 16, 25, 16),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Password'.tr,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                themeMode ? AppTheme.black11 : AppTheme.white14,
                          ),
                          suffixIcon: IconButton(
                            splashRadius: 24,
                            icon: Provider.of<LoginRegisterPageProvider>(
                                        context)
                                    .loginPasswordVisible
                                ? SizedBox(
                                    child: Image.asset(
                                        'assets/icons/eye-off-line.png',
                                        width: 20,
                                        height: 20,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white1),
                                  )
                                : SizedBox(
                                    child: Image.asset(
                                        'assets/icons/eye-line.png',
                                        width: 20,
                                        height: 20,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white1),
                                  ),
                            splashColor: Colors.transparent,
                            onPressed: () async {
                              Provider.of<LoginRegisterPageProvider>(context,
                                      listen: false)
                                  .updateLoginPasswordVisible();
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: themeMode
                                    ? AppTheme.white10
                                    : AppTheme.black14,
                                width: 1,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: themeMode
                                    ? AppTheme.white10
                                    : AppTheme.black14,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password Validate-1'.tr;
                          }
                          if (value.trim().length < 8) {
                            return 'Password Validate-2'.tr;
                          }
                          return null;
                        },
                        controller: passwordController2,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: themeMode
                                ? AppTheme.black11
                                : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        obscureText:
                            !Provider.of<LoginRegisterPageProvider>(context)
                                .loginPasswordVisible,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 16, 25, 16),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: 'Confirm Password'.tr,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                themeMode ? AppTheme.black11 : AppTheme.white14,
                          ),
                          suffixIcon: IconButton(
                            splashRadius: 24,
                            icon: Provider.of<LoginRegisterPageProvider>(
                                        context)
                                    .loginPasswordVisible
                                ? SizedBox(
                                    child: Image.asset(
                                        'assets/icons/eye-off-line.png',
                                        width: 20,
                                        height: 20,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white1),
                                  )
                                : SizedBox(
                                    child: Image.asset(
                                        'assets/icons/eye-line.png',
                                        width: 20,
                                        height: 20,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white1),
                                  ),
                            splashColor: Colors.transparent,
                            onPressed: () async {
                              Provider.of<LoginRegisterPageProvider>(context,
                                      listen: false)
                                  .updateLoginPasswordVisible();
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: themeMode
                                    ? AppTheme.white10
                                    : AppTheme.black14,
                                width: 1,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: themeMode
                                    ? AppTheme.white10
                                    : AppTheme.black14,
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ButtonTheme(
                              // minWidth: deviceWidth,
                              height: 52,
                              child: Container(
                                height: 52,
                                decoration: BoxDecoration(
                                    color: AppTheme.blue2,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16))),
                                child: MaterialButton(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Text(
                                      'Save'.tr,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w700,
                                          color: AppTheme.white1),
                                    ),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        if (passwordController1.text ==
                                            passwordController2.text) {
                                          locator<MemberServices>()
                                              .updatePasswordCall(
                                            email: widget.email,
                                            verifyCode: widget.verifyCode,
                                            password: passwordController1.text,
                                          )
                                              .then((value) {
                                            if (value) {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    pageBuilder: (_, __, ___) =>
                                                        LoginPage(
                                                      email: widget.email,
                                                    ),
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 0),
                                                    reverseTransitionDuration:
                                                        const Duration(
                                                            milliseconds: 0),
                                                    transitionsBuilder:
                                                        (_, a, __, c) =>
                                                            FadeTransition(
                                                                opacity: a,
                                                                child: c),
                                                  ));
                                            } else {
                                              showAlertDialog(context);
                                            }
                                          });
                                        } else {
                                          showAlertDialog(context);
                                        }
                                      }
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: deviceWidth,
            height: 150,
            decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black12,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login Error'.tr,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w500,
                    color: themeMode ? AppTheme.black16 : AppTheme.white14,
                  ),
                ),
                const SizedBox(height: 16),
                ButtonTheme(
                  // minWidth: deviceWidth,
                  height: 36,
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                        color: AppTheme.green1,
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurStyle: BlurStyle.outer,
                        //     offset: Offset(0, -4),
                        //     blurRadius: 16,
                        //     spreadRadius: 0,
                        //     color: Color(0xFF0E0E0F).withOpacity(0.17),
                        //   ),
                        //   BoxShadow(
                        //     blurStyle: BlurStyle.normal,
                        //     offset: Offset(0, -2),
                        //     blurRadius: 2,
                        //     spreadRadius: 0,
                        //     color: Color(0xFFFFFFFF).withOpacity(0.25),
                        //   ),
                        //   BoxShadow(
                        //     blurStyle: BlurStyle.normal,
                        //     offset: Offset(0, 1),
                        //     blurRadius: 2,
                        //     spreadRadius: 0,
                        //     color: Color(0xFF000000).withOpacity(0.18),
                        //   ),
                        // ],

                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: MaterialButton(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          'Close'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
