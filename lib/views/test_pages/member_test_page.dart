import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/test_services/member/addresses/member_addresses_services.dart';
import 'package:b2geta_mobile/services/test_services/member/interested/member_interested_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';

class MemberTestPage extends StatefulWidget {
  const MemberTestPage({Key? key}) : super(key: key);

  @override
  State<MemberTestPage> createState() => _MemberTestPageState();
}

class _MemberTestPageState extends State<MemberTestPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          backgroundColor: themeProvider.themeMode == "light"
              ? AppTheme.white2
              : AppTheme.black12,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 55),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  ButtonTheme(
                    minWidth: deviceWidth,
                    height: 52,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppTheme.green1,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'INTERESTED CATEGORIES',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            MemberInterestedServices()
                                .interestedCategoriesCall(language: 'tr')
                                .then((value) {
                              if (value == true) {
                                debugPrint(
                                    "INTERESTED CATEGORIES HAVE SUCCESSFULLY FETCHED");
                              } else {
                                debugPrint(
                                    "INTERESTED CATEGORIES HAVE NOT FETCHED");
                                showAlertDialog2(context);
                              }
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: 16),
                  ButtonTheme(
                    minWidth: deviceWidth,
                    height: 52,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppTheme.green1,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'INTERESTED CATEGORIES SAVE',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            MemberInterestedServices()
                                .interestedCategoriesSaveCall(
                                    language: 'tr', param1: '1', param2: '2')
                                .then((value) {
                              if (value == true) {
                                debugPrint(
                                    "INTERESTED CATEGORIES HAVE SUCCESSFULLY SAVED");
                              } else {
                                debugPrint(
                                    "INTERESTED CATEGORIES HAVE NOT SAVED");
                                showAlertDialog2(context);
                              }
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: deviceWidth,
                    height: 4,
                    color: AppTheme.white14,
                  ),
                  SizedBox(height: 16),
                  ButtonTheme(
                    minWidth: deviceWidth,
                    height: 52,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppTheme.green1,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'GET ALL',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            MemberAddressesServices().getAllCall(
                                queryParameters: {
                                  "offset": '2',
                                  "limit": '10'
                                }).then((value) {
                              if (value == true) {
                                debugPrint(
                                    "GET ALL OPERATION HAS SUCCESSFULLY DONE");
                              } else {
                                debugPrint("GET ALL OPERATION HAS NOT DONE");
                                showAlertDialog2(context);
                              }
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: 16),
                  ButtonTheme(
                    minWidth: deviceWidth,
                    height: 52,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppTheme.green1,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'GET',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            MemberAddressesServices()
                                .getCall(id: '38')
                                .then((value) {
                              if (value == true) {
                                debugPrint(
                                    "GET OPERATION HAS SUCCESSFULLY DONE");
                              } else {
                                debugPrint("GET OPERATION HAS NOT DONE");
                                showAlertDialog2(context);
                              }
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: 16),
                  ButtonTheme(
                    minWidth: deviceWidth,
                    height: 52,
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppTheme.green1,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'ADD AN ADDRESS',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            MemberAddressesServices()
                                .addAddressCall(
                              name: 'Ev Adresim',
                              country: 'TR',
                              city: '2170',
                              district: '108963',
                              address: 'Kuştepe Mah. Tan Sokak',
                              postalCode: '34000',
                            )
                                .then((value) {
                              if (value == true) {
                                debugPrint("ADDRESS HAS SUCCESSFULLY ADDED");
                              } else {
                                debugPrint("ADDRESS HAS NOT ADDED");
                                showAlertDialog2(context);
                              }
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showAlertDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              width: deviceWidth,
              height: 150,
              decoration: BoxDecoration(
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.white1
                          : AppTheme.black12,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
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
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.black16
                                  : AppTheme.white14,
                        ),
                      ),
                      SizedBox(width: 8),
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
                  SizedBox(height: 16),
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

                          borderRadius: BorderRadius.all(Radius.circular(16))),
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
          ),
        );
      },
    );
  }
}
