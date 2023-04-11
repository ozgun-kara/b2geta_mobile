import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/company/company_detail_model.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/company/company_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/company_added_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_companies/company_delete_sub_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'dart:ui';

class AddCompanySubPage extends StatefulWidget {
  const AddCompanySubPage(
      {Key? key, this.passedObject, required this.operation})
      : super(key: key);

  final CompanyDetailModel? passedObject;
  final String operation;

  @override
  State<AddCompanySubPage> createState() => _AddCompanySubPageState();
}

class _AddCompanySubPageState extends State<AddCompanySubPage> {
  ScrollController scrollController = ScrollController();
  GlobalKey<FormState> companyGlobalKey = GlobalKey<FormState>();

  final companyNameController = TextEditingController();
  final taxOfficeController = TextEditingController();
  final taxNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final aboutController = TextEditingController();

  var countryCode;
  var cityId;
  var districtId;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    Provider.of<MenuPageProvider>(context, listen: false).selectedCountry =
        null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedCity = null;
    Provider.of<MenuPageProvider>(context, listen: false).selectedDistrict =
        null;

    Provider.of<MenuPageProvider>(context, listen: false).countryList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).cityList.clear();
    Provider.of<MenuPageProvider>(context, listen: false).districtList.clear();

    Provider.of<MenuPageProvider>(context, listen: false).fetchCountryList();

    if (widget.operation == 'Edit') {
      companyNameController.text = widget.passedObject!.name.toString();
      taxOfficeController.text = widget.passedObject!.taxOffice.toString();
      taxNumberController.text = widget.passedObject!.taxNumber.toString();
      phoneNumberController.text = widget.passedObject!.phone.toString();
      emailController.text = widget.passedObject!.email.toString();

      countryCode = widget.passedObject!.country!.code;
      Provider.of<MenuPageProvider>(context, listen: false).selectedCountry =
          widget.passedObject!.country!.name;

      cityId = widget.passedObject!.city!.id;
      Provider.of<MenuPageProvider>(context, listen: false).selectedCity =
          widget.passedObject!.city!.name;

      districtId = widget.passedObject!.district!.id;
      Provider.of<MenuPageProvider>(context, listen: false).selectedDistrict =
          widget.passedObject!.district!.name;

      addressController.text = widget.passedObject!.address.toString();
      postalCodeController.text = widget.passedObject!.postalCode.toString();
      aboutController.text = widget.passedObject!.about.toString();

      Provider.of<MenuPageProvider>(context, listen: false)
          .fetchCityList(countryCode);
      Provider.of<MenuPageProvider>(context, listen: false)
          .fetchDistrictList(cityId);
    }

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
        backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 27.5),
              Text(
                widget.operation == 'Add'
                    ? 'Add Company'.tr
                    : 'Edit Company'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 37),
                child: Form(
                  key: companyGlobalKey,
                  child: Column(
                    children: [
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Company Name Validate-2'.tr;
                          }
                          return null;
                        },
                        controller: companyNameController,
                        hintText: 'Company Name'.tr,
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Tax Office Validate'.tr;
                          }
                          return null;
                        },
                        controller: taxOfficeController,
                        hintText: 'Tax Office'.tr,
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Address Name Validate'.tr;
                          }
                          return null;
                        },
                        controller: taxNumberController,
                        hintText: 'Tax Number'.tr,
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Phone Number Validate'.tr;
                          }
                          return null;
                        },
                        controller: phoneNumberController,
                        hintText: 'Phone Number'.tr,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'E-mail Validate-4'.tr;
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'E-mail Validate-5'.tr;
                          }
                          return null;
                        },
                        controller: emailController,
                        hintText: 'E-mail'.tr,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 13),
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
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
                                        color:
                                            Provider.of<ThemeProvider>(context)
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
                            Provider.of<MenuPageProvider>(context,
                                    listen: false)
                                .updateSelectedCountry(value as String);

                            var countryIndex = countryList.indexWhere(
                                ((element) => element.name == value));
                            if (countryIndex != -1) {
                              debugPrint('COUNTRY INDEX: $countryIndex');
                              debugPrint(
                                  'COUNTRY CODE: ${countryList[countryIndex].code}');

                              countryCode = countryList[countryIndex].code;

                              Provider.of<MenuPageProvider>(context,
                                      listen: false)
                                  .selectedCity = null;
                              cityId = null;
                              districtId = null;

                              Provider.of<MenuPageProvider>(context,
                                      listen: false)
                                  .fetchCityList(countryCode);
                            }
                          },

                          icon: Center(
                            child: Image.asset(
                              'assets/icons/dropdown.png',
                              width: 10,
                              height: 6,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
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
                          buttonPadding:
                              const EdgeInsets.only(left: 25, right: 17),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border:
                            //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),

                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white39
                                    : AppTheme.black18,
                          ),
                          // buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 32),
                          // dropdownMaxHeight: deviceHeight * 0.4,
                          dropdownMaxHeight: 350,
                          // dropdownWidth: deviceWidth,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
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
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
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
                      const SizedBox(height: 13),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // alignment: AlignmentDirectional.center,
                          isExpanded: true,
                          hint: Text(
                            'City'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
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
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white1,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: Provider.of<MenuPageProvider>(context)
                              .selectedCity,

                          onChanged: (value) {
                            Provider.of<MenuPageProvider>(context,
                                    listen: false)
                                .updateSelectedCity(value as String);

                            var cityIndex = cityList.indexWhere(
                                ((element) => element.name == value));
                            if (cityIndex != -1) {
                              debugPrint('CITY INDEX: $cityIndex');
                              debugPrint('CITY ID: ${cityList[cityIndex].id}');

                              cityId = cityList[cityIndex].id;

                              Provider.of<MenuPageProvider>(context,
                                      listen: false)
                                  .selectedDistrict = null;
                              districtId = null;

                              Provider.of<MenuPageProvider>(context,
                                      listen: false)
                                  .fetchDistrictList(cityId);
                            }
                          },

                          icon: Center(
                            child: Image.asset(
                              'assets/icons/dropdown.png',
                              width: 10,
                              height: 6,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
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
                          buttonPadding:
                              const EdgeInsets.only(left: 25, right: 17),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border:
                            //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white39
                                    : AppTheme.black18,
                          ),
                          // buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 32),
                          // dropdownMaxHeight: deviceHeight * 0.4,
                          dropdownMaxHeight: 350,
                          // dropdownWidth: deviceWidth,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
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
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
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
                      const SizedBox(height: 13),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          // alignment: AlignmentDirectional.center,
                          isExpanded: true,
                          hint: Text(
                            'District'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
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
                                        color:
                                            Provider.of<ThemeProvider>(context)
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
                            Provider.of<MenuPageProvider>(context,
                                    listen: false)
                                .updateSelectedDistrict(value as String);

                            var districtIndex = districtList.indexWhere(
                                ((element) => element.name == value));
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
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
                          buttonPadding:
                              const EdgeInsets.only(left: 25, right: 17),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border:
                            //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white39
                                    : AppTheme.black18,
                          ),
                          // buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 32),
                          // dropdownMaxHeight: deviceHeight * 0.4,
                          dropdownMaxHeight: 350,
                          // dropdownWidth: deviceWidth,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
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
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
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
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Address Validate-1'.tr;
                          }
                          return null;
                        },
                        controller: addressController,
                        hintText: 'Address'.tr,
                      ),
                      const SizedBox(height: 13),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Postal Code Validate'.tr;
                          }
                          return null;
                        },
                        controller: postalCodeController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                        ],
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: themeMode
                                ? AppTheme.blue3
                                : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 16, 25, 16),
                          filled: true,
                          fillColor:
                              themeMode ? AppTheme.white39 : AppTheme.black18,
                          hintText: 'Postal Code'.tr,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                themeMode ? AppTheme.blue3 : AppTheme.white14,
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
                                  themeMode ? AppTheme.blue2 : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      textFormField(
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'About Validate'.tr;
                          }
                          return null;
                        },
                        controller: aboutController,
                        hintText: 'About'.tr,
                        maxLines: 5,
                      ),
                      const SizedBox(height: 28),
                      MaterialButton(
                          minWidth: deviceWidth,
                          height: 52,
                          elevation: 0,
                          color: AppTheme.green1,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            widget.operation == 'Add' ? 'Add'.tr : 'Edit'.tr,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            if (companyGlobalKey.currentState!.validate()) {
                              if (countryCode.toString() != 'null' &&
                                  cityId.toString() != 'null' &&
                                  districtId.toString() != 'null') {
                                debugPrint(
                                    "Company Name: ${companyNameController.text}");
                                debugPrint(
                                    "Tax Office: ${taxOfficeController.text}");
                                debugPrint(
                                    "Tax Number: ${taxNumberController.text}");
                                debugPrint(
                                    "Phone Number: ${phoneNumberController.text}");
                                debugPrint("E-mail: ${emailController.text}");
                                debugPrint("Country Code: $countryCode");
                                debugPrint("City Id: $cityId");
                                debugPrint("District Id: $districtId");
                                debugPrint(
                                    "Address: ${addressController.text}");
                                debugPrint(
                                    "Postal Code: ${postalCodeController.text}");
                                debugPrint("About: ${aboutController.text}");

                                if (widget.operation == 'Add') {
                                  locator<CompanyServices>()
                                      .addCompanyCall(
                                    companyName: companyNameController.text,
                                    taxOffice: taxOfficeController.text,
                                    taxNumber: taxNumberController.text,
                                    phoneNumber: phoneNumberController.text,
                                    email: emailController.text,
                                    wantEmail: '1',
                                    country: countryCode,
                                    city: cityId,
                                    district: districtId,
                                    address: addressController.text,
                                    postalCode: postalCodeController.text,
                                    about: aboutController.text,
                                    languageCode: 'tr',
                                    countryCode: countryCode,
                                    timezone: '3',
                                  )
                                      .then((value) {
                                    if (value == true) {
                                      debugPrint(
                                          "COMPANY HAS SUCCESSFULLY ADDED");

                                      var count = 0;

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const CompanyAddedSubPage(
                                                    operation: 'Add'),
                                            transitionDuration:
                                                const Duration(milliseconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(milliseconds: 0),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ), (route) {
                                        return count++ == 2;
                                      });
                                    } else {
                                      debugPrint("COMPANY HAS NOT ADDED");
                                      operationFailedDialog(context);
                                    }
                                  });
                                } else {
                                  locator<CompanyServices>()
                                      .updateCompanyCall(
                                          id: widget.passedObject!.id
                                              .toString(),
                                          companyName:
                                              companyNameController.text,
                                          taxOffice: taxOfficeController.text,
                                          taxNumber: taxNumberController.text,
                                          phoneNumber:
                                              phoneNumberController.text,
                                          email: emailController.text,
                                          wantEmail: '1',
                                          country: countryCode,
                                          city: cityId,
                                          district: districtId,
                                          address: addressController.text,
                                          postalCode: postalCodeController.text,
                                          about: aboutController.text,
                                          languageCode: 'tr',
                                          countryCode: countryCode,
                                          timezone: '3')
                                      .then((value) {
                                    if (value == true) {
                                      debugPrint(
                                          "COMPANY HAS SUCCESSFULLY UPDATED");

                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const CompanyAddedSubPage(
                                                    operation: 'Edit'),
                                            transitionDuration:
                                                const Duration(milliseconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(milliseconds: 0),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ),
                                          (route) => route.isFirst);
                                    } else {
                                      debugPrint("COMPANY HAS NOT UPDATED");
                                      operationFailedDialog(context);
                                    }
                                  });
                                }
                              } else {
                                validationErrorDialog(context);
                              }
                            }
                          }),
                      Visibility(
                        // visible: widget.operation == 'Edit' ? true : false,
                        visible: false,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            MaterialButton(
                                minWidth: deviceWidth,
                                height: 52,
                                elevation: 0,
                                color: AppTheme.red4,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Text(
                                  'Delete Company'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.white1),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const CompanyDeleteSubPage(),
                                        transitionDuration:
                                            const Duration(milliseconds: 0),
                                        reverseTransitionDuration:
                                            const Duration(milliseconds: 0),
                                        transitionsBuilder: (_, a, __, c) =>
                                            FadeTransition(
                                                opacity: a, child: c),
                                      ));
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void validationErrorDialog(BuildContext context) {
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
                    color: themeMode ? AppTheme.white1 : AppTheme.black12,
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
                            'Validation Error Dialog'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: themeMode
                                  ? AppTheme.black25
                                  : AppTheme.white1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.error_outline_sharp,
                          size: 24,
                          color: themeMode ? AppTheme.black16 : AppTheme.white1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ButtonTheme(
                      height: 32,
                      child: MaterialButton(
                          elevation: 0,
                          color:
                              themeMode ? AppTheme.black16 : AppTheme.black18,
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

  void operationFailedDialog(BuildContext context) {
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
                    color: themeMode ? AppTheme.white1 : AppTheme.black12,
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
                            'Operation Failed Dialog'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: themeMode
                                  ? AppTheme.black25
                                  : AppTheme.white1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.error_outline_sharp,
                          size: 24,
                          color: themeMode ? AppTheme.black16 : AppTheme.white1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ButtonTheme(
                      height: 32,
                      child: MaterialButton(
                          elevation: 0,
                          color:
                              themeMode ? AppTheme.black16 : AppTheme.black18,
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

  TextFormField textFormField(
      {String? Function(String?)? validator,
      required TextEditingController controller,
      required String hintText,
      TextInputType? keyboardType,
      int? maxLines}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines ?? 1,
      style: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.appFontFamily,
          fontWeight: FontWeight.w500,
          color: themeMode ? AppTheme.blue3 : AppTheme.white1), // WHILE WRITING
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
        filled: true,
        fillColor: themeMode ? AppTheme.white39 : AppTheme.black18,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontFamily: AppTheme.appFontFamily,
          fontWeight: FontWeight.w400,
          color: themeMode ? AppTheme.blue3 : AppTheme.white14,
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
            color: themeMode ? AppTheme.blue2 : AppTheme.white1,
            width: 1,
          ),
        ),
      ),
    );
  }
}
