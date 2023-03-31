import 'dart:ui';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/login_register/sub_pages/forgot_password_sub_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/login_register/sub_pages/verify_sub_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final String email;

  const LoginPage({super.key, required this.email});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();
    getLocalData();
    emailController1.text = widget.email;
  }

  final MemberServices _memberServices = MemberServices();

  getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailController1.text = prefs.getString('Email') ?? '';
    passwordController1.text = prefs.getString('Password') ?? '';
    var lSwitch = prefs.getBool("Switch");
    Provider.of<LoginRegisterPageProvider>(context, listen: false)
        .updateLoginSwitch(lSwitch ?? false);
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black12,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: deviceHeight),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, deviceTopPadding + 32, 30, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Member Login'.tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'E-mail Validate-1'.tr;
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'E-mail Validate-2'.tr;
                              }
                              return null;
                            },

                            keyboardType: TextInputType.emailAddress,
                            controller: emailController1,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.black11
                                    : AppTheme.white1), // WHILE WRITING
                            maxLines: 1,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(25, 16, 25, 16),
                              filled: true,
                              fillColor: Colors.transparent,
                              hintText: 'E-mail'.tr,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: themeMode
                                    ? AppTheme.black11
                                    : AppTheme.white14,
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
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white1,
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
                                color: themeMode
                                    ? AppTheme.black11
                                    : AppTheme.white14,
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
                                            color: Provider.of<ThemeProvider>(
                                                            context)
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
                                            color: Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white1),
                                      ),
                                splashColor: Colors.transparent,
                                onPressed: () async {
                                  Provider.of<LoginRegisterPageProvider>(
                                          context,
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
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white1,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
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
                                    const SizedBox(width: 9),
                                    Consumer<LoginRegisterPageProvider>(
                                      builder: (context, provider, child) {
                                        return FlutterSwitch(
                                          width: 42,
                                          height: 21,
                                          toggleSize: 17,
                                          padding: 2,
                                          borderRadius: 100,
                                          inactiveColor: themeMode
                                              ? AppTheme.white7
                                              : AppTheme.black10,
                                          activeColor: AppTheme.green1,
                                          toggleColor: themeMode
                                              ? AppTheme.white1
                                              : AppTheme.black4,
                                          value: provider.loginSwitch,
                                          onToggle: (value) async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            if (emailController1
                                                    .text.isNotEmpty &&
                                                passwordController1
                                                    .text.isNotEmpty) {
                                              provider.updateLoginSwitch(value);

                                              if (value) {
                                                prefs.setString("Email",
                                                    emailController1.text);
                                                prefs.setString("Password",
                                                    passwordController1.text);

                                                prefs.setBool("Switch", true);
                                              } else if (!value) {
                                                prefs.setString("Email", '');
                                                prefs.setString("Password", '');

                                                prefs.setBool("Switch", false);
                                              }
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 32),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const ForgotPasswordSubPage(),
                                            transitionDuration:
                                                const Duration(milliseconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(milliseconds: 0),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ));
                                    },
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
                                    child: Text(
                                      'Forgot Password'.tr,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 22),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                        ),
                                        child: Text(
                                          'Login'.tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: AppTheme.white1),
                                        ),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            debugPrint(
                                                "email: ${emailController1.text}");
                                            debugPrint(
                                                "password: ${passwordController1.text}");

                                            locator<MemberServices>()
                                                .loginCall(
                                                    email: emailController1.text
                                                        .trim(),
                                                    password:
                                                        passwordController1.text
                                                            .trim())
                                                .then((value) async {
                                              if (value.isEmpty) {
                                                return Navigator
                                                    .pushAndRemoveUntil(
                                                        context,
                                                        PageRouteBuilder(
                                                          pageBuilder: (_, __,
                                                                  ___) =>
                                                              const NavigationPage(),
                                                          transitionDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      0),
                                                          reverseTransitionDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      0),
                                                          transitionsBuilder: (_,
                                                                  a, __, c) =>
                                                              FadeTransition(
                                                                  opacity: a,
                                                                  child: c),
                                                        ),
                                                        (route) => false);
                                              } else if (value ==
                                                  'UserAccessNotFound') {
                                                operationFailedDialog(context,
                                                    'Kullanıcı bulunamadı.');
                                              } else if (value ==
                                                  'UnVerifiedAccount') {
                                                SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                var rToken =
                                                    prefs.get("R-Token") ?? '';

                                                _memberServices
                                                    .reSendCall(
                                                        email: emailController1
                                                            .text,
                                                        rToken: rToken)
                                                    .then((value) {
                                                  Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder: (_, __,
                                                                ___) =>
                                                            VerifySubPage(
                                                                email:
                                                                    emailController1
                                                                        .text),
                                                        transitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    0),
                                                        reverseTransitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    0),
                                                        transitionsBuilder:
                                                            (_, a, __, c) =>
                                                                FadeTransition(
                                                                    opacity: a,
                                                                    child: c),
                                                      ));
                                                });
                                              } else {
                                                showAlertDialog(context);
                                              }
                                            });
                                          }
                                        }),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 29),
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

                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16))),
                                    child: MaterialButton(
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                        ),
                                        child: Text(
                                          'Sign Up'.tr,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: AppTheme.white1),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (_, __, ___) =>
                                                    const RegisterPage(),
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 0),
                                                reverseTransitionDuration:
                                                    const Duration(
                                                        milliseconds: 0),
                                                transitionsBuilder: (_, a, __,
                                                        c) =>
                                                    FadeTransition(
                                                        opacity: a, child: c),
                                              ));
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
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          child: Text(
                            'About Us'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: themeMode
                                  ? AppTheme.white15
                                  : AppTheme.white14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          child: Text(
                            'Privacy'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: themeMode
                                  ? AppTheme.white15
                                  : AppTheme.white14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          child: Text(
                            'Terms and Conditions'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: themeMode
                                  ? AppTheme.white15
                                  : AppTheme.white14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        InkWell(
                          onTap: () {},
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          child: Text(
                            'Contact'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: themeMode
                                  ? AppTheme.white15
                                  : AppTheme.white14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                              color: themeMode
                                  ? AppTheme.white8
                                  : AppTheme.black13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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

  void operationFailedDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(4),
              backgroundColor: Colors.transparent,
              content: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white1
                            : AppTheme.black12,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            message.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black25
                                  : AppTheme.white1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.error_outline_sharp,
                          size: 24,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.black16
                                  : AppTheme.white1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ButtonTheme(
                      height: 32,
                      child: MaterialButton(
                          elevation: 0,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.black16
                                  : AppTheme.black18,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
