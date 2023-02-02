// ignore_for_file: equal_keys_in_map

import 'package:b2geta_mobile/services/categories/categories_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class CategoriesTestPage extends StatefulWidget {
  const CategoriesTestPage({Key? key}) : super(key: key);

  @override
  State<CategoriesTestPage> createState() => _CategoriesTestPageState();
}

class _CategoriesTestPageState extends State<CategoriesTestPage> {
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
          ? AppTheme.white2
          : AppTheme.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              ButtonTheme(
                minWidth: deviceWidth,
                height: 52,
                child: Container(
                  height: 52,
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
                        'CATEGORIES',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        CategoriesServices().categoriesCall(
                            queryParameters: {"parent_id": '764'},
                            language: 'tr').then((value) {
                          if (value == true) {
                            debugPrint("CATEGORIES HAS SUCCESSFULLY FETCHED");
                          } else {
                            debugPrint("CATEGORIES HAS NOT FETCHED");
                            showAlertDialog2(context);
                          }
                        });
                      }),
                ),
              ),
              const SizedBox(height: 16),
              ButtonTheme(
                minWidth: deviceWidth,
                height: 52,
                child: Container(
                  height: 52,
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
                        'CATEGORIES NESTED',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        CategoriesServices()
                            .categoriesNestedCall(language: 'tr')
                            .then((value) {
                          if (value == true) {
                            debugPrint(
                                "CATEGORIES NESTED HAS SUCCESSFULLY FETCHED");
                          } else {
                            debugPrint("CATEGORIES NESTED HAS NOT FETCHED");
                            showAlertDialog2(context);
                          }
                        });
                      }),
                ),
              ),
              const SizedBox(height: 16),
              ButtonTheme(
                minWidth: deviceWidth,
                height: 52,
                child: Container(
                  height: 52,
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
                        'CATEGORY FEATURES',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        CategoriesServices().categoryFeaturesCall(
                            queryParameters: {
                              "category_id[]": '780',
                              "category_id[]": '781'
                            }).then((value) {
                          if (value == true) {
                            debugPrint(
                                "CATEGORY FEATURES HAVE SUCCESSFULLY FETCHED");
                          } else {
                            debugPrint("CATEGORY FEATURES HAVE NOT FETCHED");
                            showAlertDialog2(context);
                          }
                        });
                      }),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            width: deviceWidth,
            height: 150,
            decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white1
                    : AppTheme.black12,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'THE OPERATION FAILED',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black16
                            : AppTheme.white14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.error_outline_sharp,
                      size: 24,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.black16
                          : AppTheme.white14,
                    ),
                  ],
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
