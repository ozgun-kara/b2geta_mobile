import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsSubPage extends StatefulWidget {
  const SettingsSubPage({Key? key}) : super(key: key);

  @override
  State<SettingsSubPage> createState() => _SettingsSubPageState();
}

class _SettingsSubPageState extends State<SettingsSubPage> {
  ScrollController scrollController = ScrollController();
  GetStorage box = GetStorage();
  final List<String> dropdownItems = [
    'English',
    'Turkish',
    // 'Deutsche',
  ];
  String? dropdownSelectedValue;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

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
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white36 : AppTheme.black12,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 1),
            Container(
              width: deviceWidth,
              height: 32,
              decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black5,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 26,
                    color: Color.fromRGBO(41, 67, 214, 0.05),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Settings Page Route'.tr,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.white15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme'.tr,
                      style: TextStyle(
                        fontFamily: AppTheme.appFontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 74,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: themeMode ? AppTheme.white40 : AppTheme.black26,
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .setDarkMode();
                            },
                            child: themeMode == false
                                ? Container(
                                    width: 34,
                                    height: 29,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6)),
                                        color: AppTheme.black2),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/dark-mode.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 34,
                                    height: 29,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .setLightMode();
                            },
                            child: themeMode == true
                                ? Container(
                                    width: 34,
                                    height: 29,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6)),
                                        color: AppTheme.white1),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/ri_sun-line.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 34,
                                    height: 29,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                padding: const EdgeInsets.all(28),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Language Selection'.tr,
                            style: TextStyle(
                              fontFamily: AppTheme.appFontFamily,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonHideUnderline(
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
                              var locale = const Locale('en', 'US');
                              Get.updateLocale(locale);
                            } else if (value == "Turkish") {
                              box.write("language", "tr_TR");
                              var locale = const Locale('tr', 'TR');
                              Get.updateLocale(locale);
                            }
                            // else if (value == "Deutsche") {
                            //   var locale = const Locale('de', 'DE');
                            //   Get.updateLocale(locale);
                            // }
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
                        buttonPadding:
                            const EdgeInsets.only(left: 25, right: 17),
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
