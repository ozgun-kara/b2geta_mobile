import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/services/login_register/login_service.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController1 = TextEditingController();
  final passwordController1 = TextEditingController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white1
          : AppTheme.black12,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, deviceTopPadding + 32, 30, 16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/b2geta_logo_white.png',
              width: 153,
              height: 20.65,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Member Login'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w600,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue2
                          : AppTheme.white1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email address';
                }
                // Check if the entered email has the right format
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                // Return null if the entered email is valid
                return null;
              },
              controller: emailController1,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.black11
                          : AppTheme.white1), // WHILE WRITING
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'E-mail'.tr,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.black11
                          : AppTheme.white14,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white10
                          : AppTheme.black14,
                      width: 1,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white10
                          : AppTheme.black14,
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.white1,
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 13),
            TextFormField(
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email address';
                }
                // Check if the entered email has the right format
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                // Return null if the entered email is valid
                return null;
              },
              controller: passwordController1,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.black11
                          : AppTheme.white1), // WHILE WRITING
              maxLines: 1,
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                filled: true,
                fillColor: Colors.transparent,
                hintText: 'Password'.tr,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.black11
                          : AppTheme.white14,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white10
                          : AppTheme.black14,
                      width: 1,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white10
                          : AppTheme.black14,
                      width: 1,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppTheme.white1,
                    width: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 7, right: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Remember me:'.tr,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.white14),
                      ),
                      SizedBox(width: 9),
                      FlutterSwitch(
                        width: 42,
                        height: 21,
                        toggleSize: 17,
                        padding: 2,
                        borderRadius: 100,
                        inactiveColor:
                            Provider.of<ThemeProvider>(context).themeMode ==
                                    "light"
                                ? AppTheme.white7
                                : AppTheme.black10,
                        activeColor: AppTheme.green1,
                        toggleColor:
                            Provider.of<ThemeProvider>(context).themeMode ==
                                    "light"
                                ? AppTheme.white1
                                : AppTheme.black4,
                        value: Provider.of<LoginRegisterPageProvider>(context)
                            .loginSwitch,
                        onToggle: (value) {
                          Provider.of<LoginRegisterPageProvider>(context,
                                  listen: false)
                              .updateloginSwitch(value);
                        },
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    child: Text(
                      'Forgot Password'.tr,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.white14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22),
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

                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'Login'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            debugPrint("email: " + emailController1.text);
                            debugPrint("password: " + passwordController1.text);

                            LoginService()
                                .loginCall(
                                    email: emailController1.text,
                                    password: passwordController1.text)
                                .then((value) {
                              if (value == true) {
                                return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavigationPage(),
                                    ));
                              }
                            });

                            // onPressed();
                          }),
                    ),
                  ),
                ),
                SizedBox(width: 29),
                Expanded(
                  child: ButtonTheme(
                    // minWidth: deviceWidth,
                    height: 52,
                    child: Container(
                      height: 52,
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

                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'Sign Up'.tr,
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
                                  builder: (context) => RegisterPage(),
                                ));
                          }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Text(
                    'About Us'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white15
                          : AppTheme.white14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Text(
                    'Privacy'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white15
                          : AppTheme.white14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Text(
                    'Terms and Conditions'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white15
                          : AppTheme.white14,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Text(
                    'Contact'.tr,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white15
                          : AppTheme.white14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Copyright'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.white8
                          : AppTheme.black13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
