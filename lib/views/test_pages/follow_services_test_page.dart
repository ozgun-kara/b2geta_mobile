import 'package:b2geta_mobile/services/follow_services/follow_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class FollowServicesTestPage extends StatefulWidget {
  const FollowServicesTestPage({Key? key}) : super(key: key);

  @override
  State<FollowServicesTestPage> createState() => _FollowServicesTestPageState();
}

class _FollowServicesTestPageState extends State<FollowServicesTestPage> {
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
                        'FOLLOW',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        FollowServices()
                            .followCall(userId: '100')
                            .then((value) {
                          if (value == true) {
                            debugPrint("SUCCESSFULLY FOLLOWED");
                          } else {
                            debugPrint("FOLLOW OPERATION FAILED");
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
                        'UNFOLLOW',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        FollowServices()
                            .unfollowCall(userId: '100')
                            .then((value) {
                          if (value == true) {
                            debugPrint("SUCCESSFULLY UNFOLLOWED");
                          } else {
                            debugPrint("UNFOLLOW OPERATION FAILED");
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
                      color: AppTheme.black18,
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: MaterialButton(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'MY FOLLOWERS',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        FollowServices().myFollowersCall(
                            userId: '100',
                            queryParameters: {
                              "offset": '5',
                              "limit": '5'
                            }).then((value) {
                          if (value == true) {
                            debugPrint(
                                "MY FOLLOWERS HAVE SUCCESSFULLY FETCHED");
                          } else {
                            debugPrint("MY FOLLOWERS HAVE NOT FETCHED");
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
                        'FOLLOWED ME',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        FollowServices().followedMeCall(
                            userId: '100',
                            queryParameters: {
                              "offset": '5',
                              "limit": '5'
                            }).then((value) {
                          if (value == true) {
                            debugPrint(
                                "FOLLOWED ME OPERATION HAS SUCCESSFULLY DONE");
                          } else {
                            debugPrint("FOLLOWED ME OPERATION FAILED");
                            showAlertDialog2(context);
                          }
                        });
                      }),
                ),
              ),
              SizedBox(height: 60),
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
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
        );
      },
    );
  }
}
