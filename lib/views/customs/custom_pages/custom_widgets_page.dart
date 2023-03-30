// ignore_for_file: unrelated_type_equality_checks

import 'dart:ui';

import 'package:b2geta_mobile/views/customs/custom_widgets/custom_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_button.dart';

class CustomWidgetsPage extends StatefulWidget {
  const CustomWidgetsPage({Key? key}) : super(key: key);

  @override
  State<CustomWidgetsPage> createState() => _CustomWidgetsPageState();
}

class _CustomWidgetsPageState extends State<CustomWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CUSTOM BUTTON WIDGET
            Column(
              children: [
                CustomButton(
                  backgroundColor: AppTheme.red4,
                  width: 153,
                  height: 30,
                  radius: 8.0,
                  text: 'Custom Button',
                  textSize: 12.0,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  backgroundColor: AppTheme.blue2,
                  width: 150,
                  height: 52,
                  text: 'Custom Button',
                  textSize: 16,
                  radius: 16,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  backgroundColor: AppTheme.green1,
                  height: 52,
                  text: 'Custom Button',
                  textSize: 16.0,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              backgroundColor: Colors.amber,
              height: 52,
              text: 'Uyarı İletişim Kutusu \n(alertDialog)',
              onPressed: () {
                alertDialog(
                    message: 'Çıkmak istediğinizden emin misiniz?',
                    confirmButtonColor: Colors.green,
                    confirmButtonText: 'Evet',
                    cancelButtonColor: Colors.red,
                    cancelButtonText: 'Hayır',
                    onPressed: () {});
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              backgroundColor: Colors.black,
              height: 52,
              text:
                  'İşlem Başarısız İletişim Kutusu \n(operation Failed Dialog)',
              onPressed: () {
                operationFailedDialog(context, 'Hata Mesajı');
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomAvatar(
              size: 50,
              imageUrl:
                  'https://api.businessucces.com/${context.watch<UserProvider>().getUser.avatar}',
            ),
          ],
        ),
      ),
    );
  }

  alertDialog(
      {required String message,
      required String confirmButtonText,
      required confirmButtonColor,
      required String cancelButtonText,
      required cancelButtonColor,
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
              width: double.infinity,
              decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.white1
                          : AppTheme.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Alert'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black25
                                    : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 40),
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black25
                                    : AppTheme.white1,
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
                            color: cancelButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              cancelButtonText,
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
                            color: confirmButtonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              confirmButtonText,
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

  operationFailedDialog(BuildContext context, String message) {
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
                width: double.infinity,
                decoration: BoxDecoration(
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white1
                            : AppTheme.black12,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline_sharp,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            'Error'.tr,
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
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black25
                            : AppTheme.white1,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ButtonTheme(
                      height: 32,
                      child: MaterialButton(
                          elevation: 0,
                          color: Colors.black,
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

