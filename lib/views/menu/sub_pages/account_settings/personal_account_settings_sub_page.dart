// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:b2geta_mobile/constants.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/profile/personal_profile_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';

class PersonalAccountSettingsSubPage extends StatefulWidget {
  const PersonalAccountSettingsSubPage({
    Key? key,
    required this.personalProfileModel,
  }) : super(key: key);
  final PersonalProfileModel personalProfileModel;

  @override
  State<PersonalAccountSettingsSubPage> createState() =>
      _PersonalAccountSettingsSubPageState();
}

class _PersonalAccountSettingsSubPageState
    extends State<PersonalAccountSettingsSubPage> {
  ScrollController scrollController = ScrollController();
  final MemberServices _memberServices = MemberServices();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _citizenshipNumberController =
      TextEditingController();
  final TextEditingController _taxOfficeController = TextEditingController();
  final TextEditingController _taxNumberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final ibanController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  var countryCode;
  var cityId;
  var districtId;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.personalProfileModel.name ?? '';
    _phoneNumberController.text = widget.personalProfileModel.phone != null
        ? '+${widget.personalProfileModel.phone!}'
        : '+';
    _emailController.text = widget.personalProfileModel.email ?? '';
    _citizenshipNumberController.text =
        widget.personalProfileModel.citizenshipNumber ?? '';
    _taxOfficeController.text = widget.personalProfileModel.taxOffice ?? '';
    _taxNumberController.text = widget.personalProfileModel.taxNumber ?? '';
    _genderController.text = widget.personalProfileModel.gender ?? '';
    _aboutController.text = widget.personalProfileModel.about ?? '';

    Provider.of<MenuPageProvider>(context, listen: false).selectedCountry =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedCity = null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedDistrict =
        null;

    Provider.of<MenuPageProvider>(context, listen: false).countryList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).cityList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).districtList.clear();

    Provider.of<MenuPageProvider>(context, listen: false).fetchCountryList();

    countryCode = widget.personalProfileModel.country!.code;
    Provider.of<MenuPageProvider>(context, listen: false).selectedCountry =
        widget.personalProfileModel.country!.name;

    cityId = widget.personalProfileModel.city!.id;
    Provider.of<MenuPageProvider>(context, listen: false).selectedCity =
        widget.personalProfileModel.city!.name;

    districtId = widget.personalProfileModel.district!.id;
    Provider.of<MenuPageProvider>(context, listen: false).selectedDistrict =
        widget.personalProfileModel.district!.name;

    Provider.of<MenuPageProvider>(context, listen: false)
        .fetchCityList(countryCode);
    Provider.of<MenuPageProvider>(context, listen: false)
        .fetchDistrictList(cityId);
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
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
      appBar: const CustomInnerAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white21 : AppTheme.black28,
              ),
              const SizedBox(height: 27),
              Text(
                'Account Settings'.tr,
                style: TextStyle(
                  fontFamily: AppTheme.appFontFamily,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              const SizedBox(height: 27),
              Stack(
                children: [
                  ClipOval(
                    child: (widget.personalProfileModel.photo != null &&
                            widget.personalProfileModel.photo!.isNotEmpty)
                        ? CachedNetworkImage(
                            imageUrl: '${widget.personalProfileModel.photo}',
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                            errorWidget: (context, error, stackTrace) {
                              return ClipOval(
                                child: Image.asset(
                                  width: 150,
                                  height: 150,
                                  'assets/images/dummy_images/user_profile.png',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          )
                        : ClipOval(
                            child: Image.asset(
                              width: 150,
                              height: 150,
                              'assets/images/dummy_images/user_profile.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.8),
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(1, 1),
                              blurRadius: 6,
                            ),
                            // to make the coloured border
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit_sharp),
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 27),
              CustomTextFormField(
                titleText: 'Name'.tr,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name Validate'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                titleText: 'E-mail'.tr,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'E-mail Validate-1'.tr;
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'E-mail Validate-2'.tr;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                titleText: 'Phone'.tr,
                controller: _phoneNumberController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Phone Number Validate'.tr;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                titleText: 'CitizenshipNumber'.tr,
                controller: _citizenshipNumberController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'CitizenshipNumber-1'.tr;
                  }
                  if (value.length < 11) {
                    return 'CitizenshipNumber-2'.tr;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 13),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Country'.tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      // hint: Text(
                      //   'Country'.tr,
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontFamily: AppTheme.appFontFamily,
                      //     fontWeight: FontWeight.w400,
                      //     color: Provider.of<ThemeProvider>(context)
                      //                 .themeMode ==
                      //             "light"
                      //         ? AppTheme.blue3
                      //         : AppTheme.white14,
                      //   ),
                      // ),
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
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
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

                          Provider.of<MenuPageProvider>(context, listen: false)
                              .selectedCity = null;
                          cityId = null;
                          districtId = null;

                          Provider.of<MenuPageProvider>(context, listen: false)
                              .fetchCityList(countryCode);
                        }
                      },

                      icon: Center(
                        child: Image.asset(
                          'assets/icons/dropdown.png',
                          width: 10,
                          height: 6,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white15,
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

                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
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
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ), // WHILE WRITING
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'Search...'.tr,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
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
                                    ? AppTheme.blue3
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
                ],
              ),
              const SizedBox(height: 13),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'City'.tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      // hint: Text(
                      //   'City'.tr,
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontFamily: AppTheme.appFontFamily,
                      //     fontWeight: FontWeight.w400,
                      //     color: Provider.of<ThemeProvider>(context)
                      //                 .themeMode ==
                      //             "light"
                      //         ? AppTheme.blue3
                      //         : AppTheme.white14,
                      //   ),
                      // ),
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
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
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

                          Provider.of<MenuPageProvider>(context, listen: false)
                              .selectedDistrict = null;
                          districtId = null;

                          Provider.of<MenuPageProvider>(context, listen: false)
                              .fetchDistrictList(cityId);
                        }
                      },

                      icon: Center(
                        child: Image.asset(
                          'assets/icons/dropdown.png',
                          width: 10,
                          height: 6,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white15,
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
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
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ), // WHILE WRITING
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'Search...'.tr,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
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
                                    ? AppTheme.blue3
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
                ],
              ),
              const SizedBox(height: 13),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'District'.tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white14,
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      // alignment: AlignmentDirectional.center,
                      isExpanded: true,
                      // hint: Text(
                      //   'District'.tr,
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontFamily: AppTheme.appFontFamily,
                      //     fontWeight: FontWeight.w400,
                      //     color: Provider.of<ThemeProvider>(context)
                      //                 .themeMode ==
                      //             "light"
                      //         ? AppTheme.blue3
                      //         : AppTheme.white14,
                      //   ),
                      // ),
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
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
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
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white15,
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white39
                            : AppTheme.black18,
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
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ), // WHILE WRITING
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'Search...'.tr,
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
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
                                    ? AppTheme.blue3
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
                ],
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                titleText: 'Tax Office'.tr,
                controller: _taxOfficeController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tax Office Validate'.tr;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                titleText: 'Tax Number'.tr,
                controller: _taxNumberController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Tax Number Validate'.tr;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'IBAN Validate'.tr;
                  }
                  return null;
                },
                controller: ibanController,
                titleText: 'IBAN'.tr,
                hintText:
                    '${Constants.language!.toUpperCase()} 0006 0000 0000 0000 0000',
                maxLines: 1,
              ),
              const SizedBox(height: 13),
              CustomTextFormField(
                titleText: 'About'.tr,
                controller: _aboutController,
                minLines: 3,
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'About Validate'.tr;
                  }

                  return null;
                },
              ),
              const SizedBox(height: 13),
              const SizedBox(height: 27),
              MaterialButton(
                  minWidth: deviceWidth,
                  height: 52,
                  elevation: 0,
                  color: AppTheme.green1,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    'Edit'.tr,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white1),
                  ),
                  onPressed: () {}),
              const SizedBox(height: 27),
              Container(
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
                child: ButtonTheme(
                  minWidth: 32,
                  child: MaterialButton(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    onPressed: () {
                      dialog(
                          titleText:
                              'Are you sure you want to delete your account?'
                                  .tr,
                          buttonText: 'Yes'.tr,
                          buttonColor: AppTheme.red2,
                          onPressed: () {
                            _memberServices.deleteAccountCall().then((value) {
                              if (value) {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const LoginPage(
                                        email: '',
                                      ),
                                      transitionDuration:
                                          const Duration(milliseconds: 0),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 0),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ));
                              }
                            });
                          });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/tabler_trash.png",
                          width: 16,
                          color: AppTheme.red2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Delete My Account'.tr,
                          style: TextStyle(
                            fontFamily: AppTheme.appFontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 27),
            ],
          ),
        ),
      ),
    );
  }

  void dialog(
      {required String titleText,
      required String buttonText,
      required buttonColor,
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
              width: deviceWidth,
              decoration: BoxDecoration(
                  color: themeMode ? AppTheme.white1 : AppTheme.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          titleText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                themeMode ? AppTheme.black25 : AppTheme.white1,
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
                            color:
                                themeMode ? AppTheme.black16 : AppTheme.black18,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              'No'.tr,
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
                            color: buttonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              buttonText,
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
}
