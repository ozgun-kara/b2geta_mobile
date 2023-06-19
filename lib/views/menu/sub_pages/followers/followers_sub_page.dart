import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/follow_services/my_follower_model.dart';
import 'package:b2geta_mobile/models/follow_services/my_following_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/follow_services/follow_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class FollowersSubPage extends StatefulWidget {
  const FollowersSubPage({Key? key}) : super(key: key);

  @override
  State<FollowersSubPage> createState() => _FollowersSubPageState();
}

class _FollowersSubPageState extends State<FollowersSubPage> {
  ScrollController scrollController = ScrollController();

  final List<String> dropdownItems = [
    'My Followers'.tr,
    'Following'.tr,
  ];
  String? dropdownSelectedValue = 'My Followers'.tr;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

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
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : Colors.transparent),
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // alignment: AlignmentDirectional.center,
                  isExpanded: true,
                  hint: Text(
                    dropdownSelectedValue.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  items: dropdownItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ))
                      .toList(),
                  value: dropdownSelectedValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownSelectedValue = value as String;
                    });
                  },
                  icon: Center(
                    child: Image.asset('assets/icons/dropdown.png',
                        width: 10, height: 6, color: AppTheme.white1),
                  ),
                  iconSize: 24,
                  // iconEnabledColor: Colors.yellow,
                  // iconDisabledColor: Colors.grey,
                  // icon: Container(),
                  buttonHeight: 52,
                  buttonWidth: deviceWidth,
                  buttonPadding: const EdgeInsets.only(left: 28, right: 18),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // border:
                      //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                      color: AppTheme.blue2),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  // dropdownWidth: deviceWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // color: Color(0xFFEFF0F7),
                      color: AppTheme.blue2),
                  // dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 4,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(0, 0),
                ),
              ),
            ),
            const SizedBox(height: 17),
            Visibility(
              visible: dropdownSelectedValue == 'My Followers'.tr,
              child: FutureBuilder<List<MyFollowingModel>>(
                future:
                    locator<FollowServices>().myFollowersCall(queryParameters: {
                  // 'offset': '0',
                  // 'limit': '5'
                }),
                builder: (context, data) {
                  if (data.hasData) {
                    var myFollowersList = data.data;

                    return ListView.separated(
                      controller: scrollController,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: myFollowersList!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: ((context, index) {
                        var items = data.data;

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                              width: 1,
                              color: themeMode
                                  ? AppTheme.white21
                                  : AppTheme.black28,
                            ),
                            color:
                                themeMode ? AppTheme.white1 : AppTheme.black12,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.normal,
                                offset: const Offset(0, -4),
                                blurRadius: 26,
                                spreadRadius: 0,
                                color:
                                    const Color(0xFF2B3361).withOpacity(0.10),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(12, 23, 27, 20),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: themeMode
                                              ? AppTheme.white21
                                              : AppTheme.black20),
                                      image: DecorationImage(
                                        image: NetworkImage(items![index]
                                                .userPhoto ??
                                            'https://api.businessucces.com/uploads/profile/2023/01/15012023203949-1673811589.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '9,2',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Image.asset('assets/icons/star.png',
                                          width: 15, height: 15),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            items[index].followingType ==
                                                    'personal'
                                                ? '${items[index].userFirstname.toString().toUpperCase()} ${items[index].userLastname.toString().toUpperCase()}'
                                                : items[index]
                                                    .userCompanyName
                                                    .toString()
                                                    .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.black19
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: true,
                                          child: Image.asset(
                                              'assets/icons/check.png',
                                              width: 23,
                                              height: 23),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'İstanbul, Türkiye',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.white15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    // Visibility(
                                    //   visible: false,
                                    //   child: SizedBox(
                                    //     height: 22,
                                    //     child: ButtonTheme(
                                    //       minWidth: double.minPositive,
                                    //       height: 22,
                                    //       child: MaterialButton(
                                    //           elevation: 0,
                                    //           color: AppTheme.blue2,
                                    //           shape:
                                    //               const RoundedRectangleBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(36)),
                                    //           ),
                                    //           padding:
                                    //               const EdgeInsets.fromLTRB(
                                    //                   12, 2, 12, 0),
                                    //           child: Text(
                                    //             "Follow".tr,
                                    //             style: TextStyle(
                                    //               fontSize: 11,
                                    //               fontFamily:
                                    //                   AppTheme.appFontFamily,
                                    //               fontWeight: FontWeight.w700,
                                    //               color: AppTheme.white1,
                                    //             ),
                                    //           ),
                                    //           onPressed: () async {}),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 22,
                                      child: ButtonTheme(
                                        minWidth: double.minPositive,
                                        height: 22,
                                        child: MaterialButton(
                                            elevation: 0,
                                            color: AppTheme.red6,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(36)),
                                            ),
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 2, 12, 0),
                                            child: Text(
                                              "Unfollow".tr,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.white1,
                                              ),
                                            ),
                                            onPressed: () async {
                                              locator<FollowServices>()
                                                  .unfollowCall(
                                                      userId: items[index]
                                                          .followingId
                                                          .toString())
                                                  .then((value) {
                                                if (value == true) {
                                                  setState(() {});
                                                  debugPrint(
                                                      "SUCCESSFULLY UNFOLLOWED");
                                                } else {
                                                  debugPrint(
                                                      "COULD NOT UNFOLLOWED");
                                                }
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  } else {
                    return SizedBox(
                      height: deviceWidth + 115,
                      child: Center(
                          child: CupertinoActivityIndicator(
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black1
                            : AppTheme.white1,
                        radius: 12,
                      )),
                    );
                  }
                },
              ),
            ), // MY FOLLOWERS
            Visibility(
              visible: dropdownSelectedValue == 'Following'.tr,
              child: FutureBuilder<List<MyFollowerModel>>(
                future:
                    locator<FollowServices>().myFollowingCall(queryParameters: {
                  // 'offset': '0',
                  // 'limit': '5'
                }),
                builder: (context, data) {
                  if (data.hasData) {
                    var myFollowersList = data.data;

                    return ListView.separated(
                      controller: scrollController,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: myFollowersList!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: ((context, index) {
                        var items = data.data;

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(22)),
                            border: Border.all(
                              width: 1,
                              color: themeMode
                                  ? AppTheme.white21
                                  : AppTheme.black28,
                            ),
                            color:
                                themeMode ? AppTheme.white1 : AppTheme.black12,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.normal,
                                offset: const Offset(0, -4),
                                blurRadius: 26,
                                spreadRadius: 0,
                                color:
                                    const Color(0xFF2B3361).withOpacity(0.10),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.fromLTRB(12, 23, 27, 20),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1,
                                          color: themeMode
                                              ? AppTheme.white21
                                              : AppTheme.black20),
                                      image: DecorationImage(
                                        image: NetworkImage(items![index]
                                                .followingAvatar ??
                                            'https://api.businessucces.com/uploads/profile/2023/01/15012023203949-1673811589.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '9,2',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Image.asset('assets/icons/star.png',
                                          width: 15, height: 15),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            items[index].followingType ==
                                                    'personal'
                                                ? '${items[index].followingFirstname.toString().toUpperCase()} ${items[index].followingLastname.toString().toUpperCase()}'
                                                : items[index]
                                                    .followingCompanyName
                                                    .toString()
                                                    .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.black19
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: true,
                                          child: Image.asset(
                                              'assets/icons/check.png',
                                              width: 23,
                                              height: 23),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'İstanbul, Türkiye',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.white15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    // Visibility(
                                    //   visible: false,
                                    //   child: SizedBox(
                                    //     height: 22,
                                    //     child: ButtonTheme(
                                    //       minWidth: double.minPositive,
                                    //       height: 22,
                                    //       child: MaterialButton(
                                    //           elevation: 0,
                                    //           color: AppTheme.blue2,
                                    //           shape:
                                    //               const RoundedRectangleBorder(
                                    //             borderRadius: BorderRadius.all(
                                    //                 Radius.circular(36)),
                                    //           ),
                                    //           padding:
                                    //               const EdgeInsets.fromLTRB(
                                    //                   12, 2, 12, 0),
                                    //           child: Text(
                                    //             "Follow".tr,
                                    //             style: TextStyle(
                                    //               fontSize: 11,
                                    //               fontFamily:
                                    //                   AppTheme.appFontFamily,
                                    //               fontWeight: FontWeight.w700,
                                    //               color: AppTheme.white1,
                                    //             ),
                                    //           ),
                                    //           onPressed: () async {}),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 22,
                                      child: ButtonTheme(
                                        minWidth: double.minPositive,
                                        height: 22,
                                        child: MaterialButton(
                                            elevation: 0,
                                            color: AppTheme.red6,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(36)),
                                            ),
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 2, 12, 0),
                                            child: Text(
                                              "Unfollow".tr,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.white1,
                                              ),
                                            ),
                                            onPressed: () async {
                                              locator<FollowServices>()
                                                  .unfollowCall(
                                                      userId: items[index]
                                                          .followingId
                                                          .toString())
                                                  .then((value) {
                                                if (value == true) {
                                                  setState(() {});
                                                  debugPrint(
                                                      "SUCCESSFULLY UNFOLLOWED");
                                                } else {
                                                  debugPrint(
                                                      "COULD NOT UNFOLLOWED");
                                                }
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  } else {
                    return SizedBox(
                      height: deviceWidth + 115,
                      child: Center(
                          child: CupertinoActivityIndicator(
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black1
                            : AppTheme.white1,
                        radius: 12,
                      )),
                    );
                  }
                },
              ),
            ), // MY FOLLOWING
            const SizedBox(height: 73),
          ],
        ),
      ),
    );
  }
}
