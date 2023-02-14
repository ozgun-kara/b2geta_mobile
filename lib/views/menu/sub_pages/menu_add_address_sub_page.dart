import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/member/address_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/member/member_addresses_services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MenuAddAddressSubPage extends StatefulWidget {
  const MenuAddAddressSubPage({Key? key}) : super(key: key);

  @override
  State<MenuAddAddressSubPage> createState() => _MenuAddAddressSubPageState();
}

class _MenuAddAddressSubPageState extends State<MenuAddAddressSubPage> {
  ScrollController scrollController = ScrollController();
  final addressNameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();

  var countryCode;
  var cityId;
  var districtId;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    Provider.of<MenuPageProvider>(context, listen: false).fetchCountryList();
    Provider.of<MenuPageProvider>(context, listen: false).fetchCityList();
    Provider.of<MenuPageProvider>(context, listen: false).fetchDistrictList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    var countryList =
        Provider.of<MenuPageProvider>(context, listen: false).countryList;
    var cityList =
        Provider.of<MenuPageProvider>(context, listen: false).cityList;
    var districtList =
        Provider.of<MenuPageProvider>(context, listen: false).districtList;

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white36 : AppTheme.black12,
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/back.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: SizedBox(
              width: 103.74,
              height: 14.0,
              child: themeMode
                  ? Image.asset('assets/images/b2geta_logo_light.png')
                  : Image.asset('assets/images/b2geta_logo_dark.png')),
          actions: [
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/search.png',
                width: 19,
                height: 19,
                color: AppTheme.white15,
              ),
              onPressed: () {
                if (themeMode) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setDarkMode();
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode();
                }
              },
            ),
            const SizedBox(width: 4),
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/bell.png',
                width: 16.0,
                height: 18.0,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
            IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/message.png',
                width: 19.0,
                height: 16.0,
                color: AppTheme.white15,
              ),
              onPressed: () {},
            ),
          ]),
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
                        'Add an Address Page Route'.tr,
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
            Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 37),
              child: Column(
                children: [
                  TextFormField(
                    controller: addressNameController,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white1), // WHILE WRITING
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                      filled: true,
                      fillColor:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  "light"
                              ? AppTheme.white5
                              : AppTheme.black7,
                      hintText: 'Adres Adı',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white14,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  // DropdownButtonHideUnderline(
                  //   child: DropdownButton2(
                  //     // alignment: AlignmentDirectional.center,
                  //     // isExpanded: true,
                  //     hint: Text(
                  //       'Country'.tr,
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         fontFamily: AppTheme.appFontFamily,
                  //         fontWeight: FontWeight.w400,
                  //         color:
                  //             Provider.of<ThemeProvider>(context).themeMode ==
                  //                     "light"
                  //                 ? AppTheme.black11
                  //                 : AppTheme.white14,
                  //       ),
                  //       overflow: TextOverflow.visible,
                  //     ),
                  //     items: Provider.of<MenuPageProvider>(context)
                  //         .dropdownItems1
                  //         .map((item) => DropdownMenuItem<String>(
                  //               value: item.code,
                  //               child: Center(
                  //                 child: Text(
                  //                   item.name ?? '',
                  //                   style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontFamily: AppTheme.appFontFamily,
                  //                     fontWeight: FontWeight.w400,
                  //                     color: Provider.of<ThemeProvider>(context)
                  //                                 .themeMode ==
                  //                             "light"
                  //                         ? AppTheme.black11
                  //                         : AppTheme.white14,
                  //                   ),
                  //                   overflow: TextOverflow.visible,
                  //                 ),
                  //               ),
                  //             ))
                  //         .toList(),
                  //     value: Provider.of<MenuPageProvider>(context)
                  //         .dropdownSelectedValue1,
                  //
                  //     onChanged: (value) {
                  //       Provider.of<MenuPageProvider>(context, listen: false)
                  //           .updateDropdownSelectedValue1(value as String);
                  //     },
                  //     icon: Center(
                  //       child: Image.asset(
                  //         'assets/icons/dropdown.png',
                  //         width: 10,
                  //         height: 6,
                  //       ),
                  //     ),
                  //     iconSize: 24,
                  //     // iconEnabledColor: Colors.yellow,
                  //     // iconDisabledColor: Colors.grey,
                  //     // icon: Container(),
                  //     buttonHeight: 57,
                  //     buttonWidth: deviceWidth,
                  //     buttonPadding: EdgeInsets.only(left: 25, right: 17),
                  //     buttonDecoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       // border:
                  //       //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                  //       // color: Colors.transparent,
                  //       color: Provider.of<ThemeProvider>(context).themeMode ==
                  //               "light"
                  //           ? AppTheme.white5
                  //           : AppTheme.black7,
                  //     ),
                  //     // buttonElevation: 2,
                  //     itemHeight: 40,
                  //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  //     dropdownMaxHeight: 200,
                  //     // dropdownWidth: deviceWidth,
                  //     dropdownPadding: null,
                  //     dropdownDecoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(14),
                  //       // color: Color(0xFFEFF0F7),
                  //       color: Provider.of<ThemeProvider>(context).themeMode ==
                  //               "light"
                  //           ? AppTheme.white5
                  //           : AppTheme.black7,
                  //     ),
                  //     // dropdownElevation: 8,
                  //     scrollbarRadius: const Radius.circular(40),
                  //     scrollbarThickness: 4,
                  //     scrollbarAlwaysShow: true,
                  //     offset: const Offset(0, 0),
                  //   ),
                  // ),
                  // SizedBox(height: 13),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      hint: Text(
                        'Country'.tr,
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
                      ),
                      items: countryList
                          .map((item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(
                                  item.name ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.black11
                                        : AppTheme.white14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: Provider.of<MenuPageProvider>(context)
                          .selectedCountry,

                      onChanged: (value) {
                        Provider.of<MenuPageProvider>(context, listen: false)
                            .updateSelectedCountry(value as String);

                        var countryIndex = countryList
                            .indexWhere(((element) => element.name == value));
                        if (countryIndex != -1) {
                          debugPrint('COUNTRY INDEX: $countryIndex');
                          debugPrint(
                              'COUNTRY CODE: ${countryList[countryIndex].code}');

                          countryCode = countryList[countryIndex].code;
                        }
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
                      buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border:
                        //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                        // color: Colors.transparent,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                      ),
                      // buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                      // dropdownMaxHeight: deviceHeight * 0.4,
                      dropdownMaxHeight: 350,
                      // dropdownWidth: deviceWidth,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        // color: Color(0xFFEFF0F7),
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                      ),
                      // dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 4,
                      scrollbarAlwaysShow: true,
                      // offset: const Offset(0, 180),

                      searchController: countryController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                        child: TextFormField(
                          controller: countryController,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black11
                                  : AppTheme.white1), // WHILE WRITING
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'Country Dropdown'.tr,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black11
                                  : AppTheme.white14,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppTheme.white15,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppTheme.white15,
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white10
                                    : AppTheme.white1,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        debugPrint("ITEM:${item.value}");

                        return (item.value
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          countryController.clear();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 13),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      hint: Text(
                        'City',
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
                      ),
                      items: cityList
                          .map((item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(
                                  item.name ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.black11
                                        : AppTheme.white14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value:
                          Provider.of<MenuPageProvider>(context).selectedCity,

                      onChanged: (value) {
                        Provider.of<MenuPageProvider>(context, listen: false)
                            .updateSelectedCity(value as String);

                        var cityIndex = cityList
                            .indexWhere(((element) => element.name == value));
                        if (cityIndex != -1) {
                          debugPrint('CITY INDEX: $cityIndex');
                          debugPrint('CITY ID: ${cityList[cityIndex].id}');

                          cityId = cityList[cityIndex].id;
                        }
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
                      buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border:
                        //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                        // color: Colors.transparent,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                      ),
                      // buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                      // dropdownMaxHeight: deviceHeight * 0.4,
                      dropdownMaxHeight: 350,
                      // dropdownWidth: deviceWidth,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        // color: Color(0xFFEFF0F7),
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                      ),
                      // dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 4,
                      scrollbarAlwaysShow: true,
                      // offset: const Offset(0, 180),

                      searchController: cityController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                        child: TextFormField(
                          controller: cityController,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black11
                                  : AppTheme.white1), // WHILE WRITING
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'City Dropdown',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black11
                                  : AppTheme.white14,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppTheme.white15,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppTheme.white15,
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white10
                                    : AppTheme.white1,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        debugPrint("ITEM:${item.value}");

                        return (item.value
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          cityController.clear();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 13),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      hint: Text(
                        'District',
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
                      ),
                      items: districtList
                          .map((item) => DropdownMenuItem<String>(
                                value: item.name,
                                child: Text(
                                  item.name ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.black11
                                        : AppTheme.white14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: Provider.of<MenuPageProvider>(context)
                          .selectedDistrict,

                      onChanged: (value) {
                        Provider.of<MenuPageProvider>(context, listen: false)
                            .updateSelectedDistrict(value as String);

                        var districtIndex = districtList
                            .indexWhere(((element) => element.name == value));
                        if (districtIndex != -1) {
                          debugPrint('DISTRICT INDEX: $districtIndex');
                          debugPrint(
                              'DISTRICT ID: ${districtList[districtIndex].id}');

                          districtId = districtList[districtIndex].id;
                        }
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
                      buttonPadding: const EdgeInsets.only(left: 25, right: 17),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border:
                        //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                        // color: Colors.transparent,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                      ),
                      // buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                      // dropdownMaxHeight: deviceHeight * 0.4,
                      dropdownMaxHeight: 350,
                      // dropdownWidth: deviceWidth,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        // color: Color(0xFFEFF0F7),
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                      ),
                      // dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 4,
                      scrollbarAlwaysShow: true,
                      // offset: const Offset(0, 180),

                      searchController: districtController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                        child: TextFormField(
                          controller: districtController,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black11
                                  : AppTheme.white1), // WHILE WRITING
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'District Dropdown',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black11
                                  : AppTheme.white14,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppTheme.white15,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppTheme.white15,
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white10
                                    : AppTheme.white1,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        debugPrint("ITEM:${item.value}");

                        return (item.value
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()));
                      },
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          districtController.clear();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 13),
                  TextFormField(
                    controller: addressController,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white1), // WHILE WRITING
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                      filled: true,
                      fillColor:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  "light"
                              ? AppTheme.white5
                              : AppTheme.black7,
                      hintText: 'Adres',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white14,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  TextFormField(
                    controller: postalCodeController,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white1), // WHILE WRITING
                    maxLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                      filled: true,
                      fillColor:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  "light"
                              ? AppTheme.white5
                              : AppTheme.black7,
                      hintText: 'Posta Kodu',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white14,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  MaterialButton(
                      minWidth: deviceWidth,
                      height: 52,
                      elevation: 0,
                      color: AppTheme.green1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Adres Ekle',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {}),
                  SizedBox(height: 18),
                  MaterialButton(
                      minWidth: deviceWidth,
                      height: 52,
                      elevation: 0,
                      color: AppTheme.white38,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Geri Git',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
