import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  GetStorage box = GetStorage();
  ScrollController scrollController = ScrollController();
  final List<String> dropdownItems = [
    'English',
    'Turkish',
    'Deutsch',
  ];
  String? dropdownSelectedValue;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  void initState() {
    if (box.read("language") == null) {
      var deviceLanguage = Get.deviceLocale.toString();

      if (deviceLanguage == 'tr_TR') {
        dropdownSelectedValue = 'Turkish';
      } else if (deviceLanguage == 'en_US') {
        dropdownSelectedValue = 'English';
      } else {
        dropdownSelectedValue = 'English';
      }
    } else {
      box.read("language") == "tr_TR"
          ? dropdownSelectedValue = 'Turkish'
          : dropdownSelectedValue = 'English';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white2
          : AppTheme.black12,
      body: Padding(
        padding: EdgeInsets.fromLTRB(23, 0, 23, 0),
        child: Column(
          children: [
            Spacer(),
            Container(
              width: deviceWidth,
              // height: 480,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white1
                    : AppTheme.black3,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Color.fromRGBO(41, 67, 214, 0.05),
                      blurRadius: 26,
                      spreadRadius: 0),
                ],
              ),
              padding: EdgeInsets.all(28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Language Selection'.tr,
                          style: TextStyle(
                            fontFamily: AppTheme.appFontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Container(
                    // height: 274,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(19),
                    //   color:
                    //   Provider.of<ThemeProvider>(context).themeMode == "light"
                    //       ? AppTheme.white16
                    //       : AppTheme.black12,
                    // ),

                    // child: FutureBuilder(
                    //   future: GeneralService().getLanguageList(),
                    //   builder: (context, data) {
                    //     if (data.hasData) {
                    //       var items = data.data as List<LanguageDummyModel>;
                    //
                    //       return ListView.builder(
                    //           controller: scrollController,
                    //           shrinkWrap: true,
                    //           itemCount: items.length,
                    //           itemBuilder: ((context, index) {
                    //             return Padding(
                    //               padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //               child: Center(
                    //                 child: Text(
                    //                   items[index].language ?? '',
                    //                   style: TextStyle(
                    //                     fontSize: 18,
                    //                     fontFamily: AppTheme.appFontFamily,
                    //                     fontWeight: FontWeight.w600,
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           }));
                    //     } else {
                    //       return ListView.builder(
                    //         controller: scrollController,
                    //         shrinkWrap: true,
                    //         itemCount: 10,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           return Padding(
                    //             padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 SkeletonAnimation(
                    //                   borderRadius: BorderRadius.circular(10.0),
                    //                   shimmerDuration: 1000,
                    //                   shimmerColor: index % 2 != 0
                    //                       ? Colors.grey
                    //                       : Colors.white54,
                    //                   child: Container(
                    //                     height: 60,
                    //                     width: 60,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: BorderRadius.circular(5),
                    //                       color:
                    //                           Color.fromRGBO(225, 230, 250, 0.8),
                    //                       // color: Colors.grey[300]
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   width: 6,
                    //                 ),
                    //                 Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: <Widget>[
                    //                     SkeletonAnimation(
                    //                       borderRadius:
                    //                           BorderRadius.circular(10.0),
                    //                       shimmerDuration: 1000,
                    //                       shimmerColor: index % 2 != 0
                    //                           ? Colors.grey
                    //                           : Colors.white54,
                    //                       child: Container(
                    //                         width: deviceWidth * 0.5,
                    //                         height: 30,
                    //                         decoration: BoxDecoration(
                    //                           borderRadius:
                    //                               BorderRadius.circular(10.0),
                    //                           // color: Colors.grey[300]
                    //
                    //                           color: Color.fromRGBO(
                    //                               225, 230, 250, 0.8),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 6,
                    //                     ),
                    //                     SkeletonAnimation(
                    //                       borderRadius:
                    //                           BorderRadius.circular(10.0),
                    //                       shimmerColor: index % 2 != 0
                    //                           ? Colors.grey
                    //                           : Colors.white54,
                    //                       child: Container(
                    //                         width: deviceWidth * 0.2,
                    //                         height: 30,
                    //                         decoration: BoxDecoration(
                    //                           borderRadius:
                    //                               BorderRadius.circular(10.0),
                    //                           // color: Colors.grey[300]
                    //
                    //                           color: Color.fromRGBO(
                    //                               225, 230, 250, 0.8),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //       ); // SEKELATON ANIMATION
                    //     }
                    //   },
                    // ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        // alignment: AlignmentDirectional.center,
                        // isExpanded: true,
                        hint: Text(
                          dropdownSelectedValue.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black11
                                    : AppTheme.white14,
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
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black11
                                                : AppTheme.white14,
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

                            if (value == "English") {
                              box.write("language", "en_US");
                              var locale = Locale('en', 'US');
                              Get.updateLocale(locale);
                            } else if (value == "Turkish") {
                              box.write("language", "tr_TR");
                              var locale = Locale('tr', 'TR');
                              Get.updateLocale(locale);
                            } else if (value == "Deutsch") {
                              var locale = Locale('de', 'DE');
                              Get.updateLocale(locale);
                            }
                          });
                        },
                        icon: Center(
                          child: Image.asset(
                            'assets/icons/dropdown.png',
                            width: 10,
                            height: 6,
                          ),
                        ),
                        iconSize: 24,
                        // iconEnabledColor: Colors.yellow,
                        // iconDisabledColor: Colors.grey,
                        // icon: Container(),
                        buttonHeight: 57,
                        buttonWidth: deviceWidth,
                        buttonPadding: EdgeInsets.only(left: 25, right: 17),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border:
                          //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                          // color: Colors.transparent,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.white5
                                  : AppTheme.black7,
                        ),
                        // buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        // dropdownWidth: deviceWidth,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // color: Color(0xFFEFF0F7),
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.white5
                                  : AppTheme.black7,
                        ),
                        // dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 4,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(0, 0),
                      ),
                    ),

                    // child: FutureBuilder(
                    //   future: LanguageService().getLanguageList(),
                    //   builder: (context, data) {
                    //     if (data.hasData) {
                    //       var items = data.data as List<LanguageModel>;
                    //
                    //       return Center(
                    //         child: ListView.builder(
                    //             controller: scrollController,
                    //             shrinkWrap: true,
                    //             itemCount: items.length,
                    //             itemBuilder: ((context, index) {
                    //               return Padding(
                    //                 padding:
                    //                     const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    //                 child: Center(
                    //                   child: Text(
                    //                     items[index].languageName ?? '',
                    //                     style: TextStyle(
                    //                       fontSize: 18,
                    //                       fontFamily: AppTheme.appFontFamily,
                    //                       fontWeight: FontWeight.w600,
                    //                       color: Colors.white,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               );
                    //             })),
                    //       );
                    //     } else {
                    //       return Center(
                    //           child: CupertinoActivityIndicator(
                    //         color:
                    //             Provider.of<ThemeProvider>(context).themeMode ==
                    //                     "light"
                    //                 ? AppTheme.black1
                    //                 : AppTheme.white1,
                    //         radius: 12,
                    //       ));
                    //     }
                    //   },
                    // ),
                  ),
                  SizedBox(height: 21),
                  ButtonTheme(
                    minWidth: deviceWidth,
                    height: 64,
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          color: AppTheme.blue2,

                          // boxShadow: [
                          //   BoxShadow(
                          //       offset: Offset(0, -2),
                          //       color: Color(0xFFFFFFFF).withOpacity(0.25),
                          //       blurRadius: 2,
                          //       spreadRadius: 0),
                          //   BoxShadow(
                          //       offset: Offset(0, 1),
                          //       color: Color(0xFF000000).withOpacity(0.18),
                          //       blurRadius: 2,
                          //       spreadRadius: 0),
                          // ],

                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPage(email: "", password: ""),
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
