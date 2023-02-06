// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/providers/login_register_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  final emailController1 = TextEditingController();
  final emailController2 = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final companyNameController = TextEditingController();
  final officialPersonController = TextEditingController();
  final officialPhoneController = TextEditingController();
  var countryCode;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // Provider.of<LoginRegisterProvider>(context, listen: false)
    //     .fetchDropdownList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    // var countryList = Provider.of<LoginRegisterProvider>(context, listen: false)
    //     .dropdownItems;

    // return Scaffold(
    //   backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
    //       ? AppTheme.white1
    //       : AppTheme.black12,
    //   appBar: PreferredSize(
    //       preferredSize: const Size.fromHeight(116),
    //       child: Padding(
    //         padding: EdgeInsets.only(top: deviceTopPadding),
    //         child: AppBar(
    //           toolbarHeight: 30,
    //           backgroundColor: Colors.transparent,
    //           elevation: 0,
    //           centerTitle: true,
    //           leading: IconButton(
    //             splashRadius: 24,
    //             icon: Image.asset(
    //               'assets/icons/back.png',
    //               width: 27,
    //               height: 13,
    //               color:
    //                   Provider.of<ThemeProvider>(context).themeMode == "light"
    //                       ? AppTheme.blue3
    //                       : AppTheme.white14,
    //             ),
    //             onPressed: () {
    //               Navigator.pop(context);
    //             },
    //           ),
    //           flexibleSpace: Padding(
    //             padding: const EdgeInsets.only(top: 65),
    //             // padding: EdgeInsets.only(top: 49),
    //             child: Text(
    //               'Create Account'.tr,
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontFamily: AppTheme.appFontFamily,
    //                 fontSize: 22,
    //                 fontWeight: FontWeight.w600,
    //                 color:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //               ),
    //             ),
    //           ),
    //         ),
    //       )),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(30, 0, 30, 55),
    //       child: Form(
    //         key: formKey2,
    //         child: Column(
    //           children: [
    //             TextFormField(
    //               validator: (value) {
    //                 if (value == null || value.trim().isEmpty) {
    //                   return 'E-mail Validate-1'.tr;
    //                 }
    //                 if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    //                   return 'E-mail Validate-2'.tr;
    //                 }
    //                 return null;
    //               },
    //
    //               controller: emailController1,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'E-mail'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             TextFormField(
    //               validator: (value) {
    //                 if (value == null || value.trim().isEmpty) {
    //                   return 'E-mail Validate-1'.tr;
    //                 }
    //                 if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
    //                   return 'E-mail Validate-2'.tr;
    //                 }
    //
    //                 if (value != emailController1.text) {
    //                   return 'E-mail Validate-3'.tr;
    //                 }
    //                 return null;
    //               },
    //
    //               controller: emailController2,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'E-mail (confirm)'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             TextFormField(
    //               validator: (value) {
    //                 if (value == null || value.trim().isEmpty) {
    //                   return 'Password Validate-1'.tr;
    //                 }
    //                 if (value.trim().length < 8) {
    //                   return 'Password Validate-2'.tr;
    //                 }
    //                 return null;
    //               },
    //               controller: passwordController1,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               obscureText: true,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'Password'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             TextFormField(
    //               validator: (value) {
    //                 if (value == null || value.trim().isEmpty) {
    //                   return 'Password Validate-1'.tr;
    //                 }
    //                 if (value.trim().length < 8) {
    //                   return 'Password Validate-2'.tr;
    //                 }
    //                 if (value != passwordController1.text) {
    //                   return 'Password Validate-3'.tr;
    //                 }
    //                 return null;
    //               },
    //               controller: passwordController2,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               obscureText: true,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'Password (confirm)'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             TextFormField(
    //               validator: (value) {
    //                 if (value == null || value.trim().isEmpty) {
    //                   return 'Company Name Validate'.tr;
    //                 }
    //                 return null;
    //               },
    //               controller: companyNameController,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'Company Name'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             TextFormField(
    //               controller: officialPersonController,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'Official Person'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             TextFormField(
    //               controller: officialPhoneController,
    //               style: TextStyle(
    //                   fontSize: 16,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w500,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white1), // WHILE WRITING
    //               maxLines: 1,
    //               keyboardType: TextInputType.number,
    //               decoration: InputDecoration(
    //                 contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
    //                 filled: true,
    //                 fillColor:
    //                     Provider.of<ThemeProvider>(context).themeMode == "light"
    //                         ? AppTheme.white5
    //                         : AppTheme.black7,
    //                 hintText: 'Official Phone'.tr,
    //                 hintStyle: TextStyle(
    //                   fontSize: 14,
    //                   fontFamily: AppTheme.appFontFamily,
    //                   fontWeight: FontWeight.w400,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.black11
    //                       : AppTheme.white14,
    //                 ),
    //                 border: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10),
    //                     borderSide: const BorderSide(
    //                       color: Colors.transparent,
    //                       width: 1,
    //                     )),
    //                 focusedBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                   borderSide: BorderSide(
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.blue2
    //                         : AppTheme.white1,
    //                     width: 1,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(height: 13),
    //             // DropdownButtonHideUnderline(
    //             //   child: DropdownButton2(
    //             //     // alignment: AlignmentDirectional.center,
    //             //     // isExpanded: true,
    //             //     hint: Text(
    //             //       'Country'.tr,
    //             //       style: TextStyle(
    //             //         fontSize: 14,
    //             //         fontFamily: AppTheme.appFontFamily,
    //             //         fontWeight: FontWeight.w400,
    //             //         color: Provider.of<ThemeProvider>(context).themeMode ==
    //             //                 "light"
    //             //             ? AppTheme.black11
    //             //             : AppTheme.white14,
    //             //       ),
    //             //       overflow: TextOverflow.visible,
    //             //     ),
    //             //     items: Provider.of<LoginRegisterProvider>(context)
    //             //         .dropdownItems
    //             //         .map((item) => DropdownMenuItem<String>(
    //             //               value: item.code,
    //             //               child: Center(
    //             //                 child: Text(
    //             //                   item.name ?? '',
    //             //                   style: TextStyle(
    //             //                     fontSize: 14,
    //             //                     fontFamily: AppTheme.appFontFamily,
    //             //                     fontWeight: FontWeight.w400,
    //             //                     color: Provider.of<ThemeProvider>(context)
    //             //                                 .themeMode ==
    //             //                             "light"
    //             //                         ? AppTheme.black11
    //             //                         : AppTheme.white14,
    //             //                   ),
    //             //                   overflow: TextOverflow.visible,
    //             //                 ),
    //             //               ),
    //             //             ))
    //             //         .toList(),
    //             //     value: Provider.of<LoginRegisterProvider>(context)
    //             //         .dropdownSelectedValue,
    //             //
    //             //     onChanged: (value) {
    //             //       Provider.of<LoginRegisterProvider>(context, listen: false)
    //             //           .updateDropdownSelectedValue(value as String);
    //             //     },
    //             //     icon: Center(
    //             //       child: Image.asset(
    //             //         'assets/icons/dropdown.png',
    //             //         width: 10,
    //             //         height: 6,
    //             //       ),
    //             //     ),
    //             //     iconSize: 24,
    //             //     // iconEnabledColor: Colors.yellow,
    //             //     // iconDisabledColor: Colors.grey,
    //             //     // icon: Container(),
    //             //     buttonHeight: 57,
    //             //     buttonWidth: deviceWidth,
    //             //     buttonPadding: EdgeInsets.only(left: 25, right: 17),
    //             //     buttonDecoration: BoxDecoration(
    //             //       borderRadius: BorderRadius.circular(10),
    //             //       // border:
    //             //       //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
    //             //       // color: Colors.transparent,
    //             //       color: Provider.of<ThemeProvider>(context).themeMode ==
    //             //               "light"
    //             //           ? AppTheme.white5
    //             //           : AppTheme.black7,
    //             //     ),
    //             //     // buttonElevation: 2,
    //             //     itemHeight: 40,
    //             //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //             //     dropdownMaxHeight: 200,
    //             //     // dropdownWidth: deviceWidth,
    //             //     dropdownPadding: null,
    //             //     dropdownDecoration: BoxDecoration(
    //             //       borderRadius: BorderRadius.circular(14),
    //             //       // color: Color(0xFFEFF0F7),
    //             //       color: Provider.of<ThemeProvider>(context).themeMode ==
    //             //               "light"
    //             //           ? AppTheme.white5
    //             //           : AppTheme.black7,
    //             //     ),
    //             //     // dropdownElevation: 8,
    //             //     scrollbarRadius: const Radius.circular(40),
    //             //     scrollbarThickness: 4,
    //             //     scrollbarAlwaysShow: true,
    //             //     offset: const Offset(0, 0),
    //             //   ),
    //             // ),
    //             DropdownButtonHideUnderline(
    //               child: DropdownButton2(
    //                 // alignment: AlignmentDirectional.center,
    //                 isExpanded: true,
    //                 hint: Text(
    //                   'Country'.tr,
    //                   style: TextStyle(
    //                     fontSize: 14,
    //                     fontFamily: AppTheme.appFontFamily,
    //                     fontWeight: FontWeight.w400,
    //                     color: Provider.of<ThemeProvider>(context).themeMode ==
    //                             "light"
    //                         ? AppTheme.black11
    //                         : AppTheme.white14,
    //                   ),
    //                 ),
    //                 items: Provider.of<LoginRegisterProvider>(context)
    //                     .dropdownItems
    //                     .map((item) => DropdownMenuItem<String>(
    //                           value: item.name,
    //                           child: Text(
    //                             item.name ?? '',
    //                             style: TextStyle(
    //                               fontSize: 14,
    //                               fontFamily: AppTheme.appFontFamily,
    //                               fontWeight: FontWeight.w400,
    //                               color: Provider.of<ThemeProvider>(context)
    //                                           .themeMode ==
    //                                       "light"
    //                                   ? AppTheme.black11
    //                                   : AppTheme.white14,
    //                             ),
    //                           ),
    //                         ))
    //                     .toList(),
    //                 value: Provider.of<LoginRegisterProvider>(context)
    //                     .dropdownSelectedValue,
    //
    //                 onChanged: (value) {
    //                   Provider.of<LoginRegisterProvider>(context, listen: false)
    //                       .updateDropdownSelectedValue(value as String);
    //
    //                   var countryIndex = countryList
    //                       .indexWhere(((element) => element.name == value));
    //                   if (countryIndex != -1) {
    //                     debugPrint('COUNTRY INDEX: $countryIndex');
    //                     debugPrint(
    //                         'COUNTRY CODE: ${countryList[countryIndex].code}');
    //
    //                     countryCode = countryList[countryIndex].code;
    //                   }
    //                 },
    //
    //                 icon: Center(
    //                   child: Image.asset(
    //                     'assets/icons/dropdown.png',
    //                     width: 10,
    //                     height: 6,
    //                   ),
    //                 ),
    //                 iconSize: 24,
    //                 // iconEnabledColor: Colors.yellow,
    //                 // iconDisabledColor: Colors.grey,
    //                 // icon: Container(),
    //                 buttonHeight: 57,
    //                 buttonWidth: deviceWidth,
    //                 buttonPadding: const EdgeInsets.only(left: 25, right: 17),
    //                 buttonDecoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   // border:
    //                   //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
    //                   // color: Colors.transparent,
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.white5
    //                       : AppTheme.black7,
    //                 ),
    //                 // buttonElevation: 2,
    //                 itemHeight: 40,
    //                 itemPadding: const EdgeInsets.symmetric(horizontal: 32),
    //                 // dropdownMaxHeight: deviceHeight * 0.4,
    //                 dropdownMaxHeight: 350,
    //                 // dropdownWidth: deviceWidth,
    //                 dropdownPadding: null,
    //                 dropdownDecoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(14),
    //                   // color: Color(0xFFEFF0F7),
    //                   color: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? AppTheme.white5
    //                       : AppTheme.black7,
    //                 ),
    //                 // dropdownElevation: 8,
    //                 scrollbarRadius: const Radius.circular(40),
    //                 scrollbarThickness: 4,
    //                 scrollbarAlwaysShow: true,
    //                 offset: const Offset(0, 180),
    //
    //                 searchController: textEditingController,
    //                 searchInnerWidget: Padding(
    //                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
    //                   child: TextFormField(
    //                     controller: textEditingController,
    //                     style: TextStyle(
    //                         fontSize: 14,
    //                         fontFamily: AppTheme.appFontFamily,
    //                         fontWeight: FontWeight.w500,
    //                         color:
    //                             Provider.of<ThemeProvider>(context).themeMode ==
    //                                     "light"
    //                                 ? AppTheme.black11
    //                                 : AppTheme.white1), // WHILE WRITING
    //                     decoration: InputDecoration(
    //                       isDense: true,
    //                       contentPadding: const EdgeInsets.symmetric(
    //                         horizontal: 16,
    //                         vertical: 12,
    //                       ),
    //                       hintText: 'Country Dropdown'.tr,
    //                       hintStyle: TextStyle(
    //                         fontSize: 14,
    //                         fontFamily: AppTheme.appFontFamily,
    //                         fontWeight: FontWeight.w400,
    //                         color:
    //                             Provider.of<ThemeProvider>(context).themeMode ==
    //                                     "light"
    //                                 ? AppTheme.black11
    //                                 : AppTheme.white14,
    //                       ),
    //                       border: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10),
    //                           borderSide: BorderSide(
    //                             color: AppTheme.white15,
    //                             width: 1,
    //                           )),
    //                       enabledBorder: OutlineInputBorder(
    //                           borderRadius: BorderRadius.circular(10),
    //                           borderSide: BorderSide(
    //                             color: AppTheme.white15,
    //                             width: 1,
    //                           )),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(
    //                           color: Provider.of<ThemeProvider>(context)
    //                                       .themeMode ==
    //                                   "light"
    //                               ? AppTheme.white10
    //                               : AppTheme.white1,
    //                           width: 1,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 searchMatchFn: (item, searchValue) {
    //                   debugPrint("ITEM:${item.value}");
    //
    //                   return (item.value
    //                       .toLowerCase()
    //                       .contains(searchValue.toLowerCase()));
    //                 },
    //                 //This to clear the search value when you close the menu
    //                 onMenuStateChange: (isOpen) {
    //                   if (!isOpen) {
    //                     textEditingController.clear();
    //                   }
    //                 },
    //               ),
    //             ),
    //             const SizedBox(height: 23),
    //             Row(
    //               children: [
    //                 FlutterSwitch(
    //                   width: 42,
    //                   height: 21,
    //                   toggleSize: 17,
    //                   padding: 2,
    //                   borderRadius: 100,
    //                   inactiveColor:
    //                       Provider.of<ThemeProvider>(context).themeMode ==
    //                               "light"
    //                           ? AppTheme.white7
    //                           : AppTheme.black10,
    //                   activeColor: AppTheme.green1,
    //                   toggleColor:
    //                       Provider.of<ThemeProvider>(context).themeMode ==
    //                               "light"
    //                           ? AppTheme.white1
    //                           : AppTheme.black4,
    //
    //                   // value: Provider.of<LoginRegisterPageProvider>(context)
    //                   //     .registerSwitch,
    //
    //                   value: Provider.of<ThemeProvider>(context).themeMode ==
    //                           "light"
    //                       ? false
    //                       : true,
    //
    //                   onToggle: (value) {
    //                     if (value == false) {
    //                       Provider.of<ThemeProvider>(context, listen: false)
    //                           .setLightMode();
    //                       debugPrint('Light Theme Activated');
    //                     } else {
    //                       Provider.of<ThemeProvider>(context, listen: false)
    //                           .setDarkMode();
    //                       debugPrint('Dark Theme Activated');
    //                     }
    //
    //
    //                   },
    //                 ),
    //                 const SizedBox(width: 13),
    //                 Expanded(
    //                   child: Text(
    //                     'User Agreement'.tr,
    //                     style: TextStyle(
    //                         fontSize: 12,
    //                         fontFamily: AppTheme.appFontFamily,
    //                         fontWeight: FontWeight.w400,
    //                         color: AppTheme.white14),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 30),
    //             ButtonTheme(
    //               minWidth: deviceWidth,
    //               height: 52,
    //               child: Container(
    //                 height: 52,
    //                 decoration: BoxDecoration(
    //                     color: AppTheme.green1,
    //                     // boxShadow: [
    //                     //   BoxShadow(
    //                     //     blurStyle: BlurStyle.outer,
    //                     //     offset: Offset(0, -4),
    //                     //     blurRadius: 16,
    //                     //     spreadRadius: 0,
    //                     //     color: Color(0xFF0E0E0F).withOpacity(0.17),
    //                     //   ),
    //                     //   BoxShadow(
    //                     //     blurStyle: BlurStyle.normal,
    //                     //     offset: Offset(0, -2),
    //                     //     blurRadius: 2,
    //                     //     spreadRadius: 0,
    //                     //     color: Color(0xFFFFFFFF).withOpacity(0.25),
    //                     //   ),
    //                     //   BoxShadow(
    //                     //     blurStyle: BlurStyle.normal,
    //                     //     offset: Offset(0, 1),
    //                     //     blurRadius: 2,
    //                     //     spreadRadius: 0,
    //                     //     color: Color(0xFF000000).withOpacity(0.18),
    //                     //   ),
    //                     // ],
    //
    //                     borderRadius:
    //                         const BorderRadius.all(Radius.circular(16))),
    //                 child: MaterialButton(
    //                     elevation: 0,
    //                     shape: const RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(16)),
    //                     ),
    //                     child: Text(
    //                       'Sign Up'.tr,
    //                       style: TextStyle(
    //                           fontSize: 16,
    //                           fontFamily: AppTheme.appFontFamily,
    //                           fontWeight: FontWeight.w700,
    //                           color: AppTheme.white1),
    //                     ),
    //                     onPressed: () {
    //                       if (formKey2.currentState!.validate()) {
    //                         debugPrint("email: ${emailController1.text}");
    //                         debugPrint("password: ${passwordController1.text}");
    //                         debugPrint(
    //                             "companyName: ${companyNameController.text}");
    //                         debugPrint(
    //                             "officialPerson: ${officialPersonController.text}");
    //                         debugPrint(
    //                             "officialPhone: ${officialPhoneController.text}");
    //                         debugPrint("country: $countryCode");
    //
    //                         locator<MemberServices>()
    //                             .registerCall(
    //                           email: emailController1.text,
    //                           password: passwordController1.text,
    //                           companyName: companyNameController.text,
    //                           officialPerson: officialPersonController.text,
    //                           officialPhone: officialPhoneController.text,
    //                           country: countryCode.toString(),
    //                         )
    //                             .then((value) {
    //                           if (value != "error") {
    //                             debugPrint("REGISTRATION SUCCESSFUL");
    //
    //                             locator<MemberServices>()
    //                                 .verifyCall(
    //                                     email: emailController1.text,
    //                                     verifyCode: value)
    //                                 .then((value2) {
    //                               if (value2 == true) {
    //                                 debugPrint("VERIFICATION SUCCESSFUL");
    //
    //                                 showAlertDialog(context);
    //
    //                                 Timer(
    //                                     const Duration(milliseconds: 1500),
    //                                     () => Navigator.push(
    //                                         context,
    //                                         MaterialPageRoute(
    //                                           builder: (context) => LoginPage(
    //                                               email: emailController1.text,
    //                                               password:
    //                                                   passwordController1.text),
    //                                         )));
    //                               } else {
    //                                 debugPrint("VERIFICATION FAILED");
    //                                 showAlertDialog2(context);
    //                               }
    //                             });
    //                           } else {
    //                             debugPrint("REGISTRATION FAILED");
    //                             showAlertDialog2(context);
    //                           }
    //                         });
    //                       }
    //                     }),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white1
          : AppTheme.black12,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(116),
          child: Padding(
            padding: EdgeInsets.only(top: deviceTopPadding),
            child: AppBar(
              toolbarHeight: 30,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                splashRadius: 24,
                icon: Image.asset(
                  'assets/icons/back.png',
                  width: 27,
                  height: 13,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.blue3
                          : AppTheme.white14,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 65),
                // padding: EdgeInsets.only(top: 49),
                child: Text(
                  'Create Account'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.appFontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.blue2
                            : AppTheme.white1,
                  ),
                ),
              ),
            ),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            key: formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'E-mail Validate-1'.tr;
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'E-mail Validate-2'.tr;
                    }
                    return null;
                  },

                  controller: emailController1,
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
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                    hintText: 'E-mail'.tr,
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue2
                            : AppTheme.white1,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.trim().isEmpty) {
                //       return 'E-mail Validate-1'.tr;
                //     }
                //     if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                //       return 'E-mail Validate-2'.tr;
                //     }
                //
                //     if (value != emailController1.text) {
                //       return 'E-mail Validate-3'.tr;
                //     }
                //     return null;
                //   },
                //
                //   controller: emailController2,
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w500,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white1), // WHILE WRITING
                //   maxLines: 1,
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                //     filled: true,
                //     fillColor:
                //         Provider.of<ThemeProvider>(context).themeMode == "light"
                //             ? AppTheme.white5
                //             : AppTheme.black7,
                //     hintText: 'E-mail (confirm)'.tr,
                //     hintStyle: TextStyle(
                //       fontSize: 14,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w400,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white14,
                //     ),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.blue2
                //             : AppTheme.white1,
                //         width: 1,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 13),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password Validate-1'.tr;
                    }
                    if (value.trim().length < 8) {
                      return 'Password Validate-2'.tr;
                    }
                    return null;
                  },
                  controller: passwordController1,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.black11
                          : AppTheme.white1), // WHILE WRITING
                  maxLines: 1,
                  obscureText: !Provider.of<LoginRegisterProvider>(context)
                      .registerPasswordVisible,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                    filled: true,
                    fillColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white5
                            : AppTheme.black7,
                    hintText: 'Password'.tr,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.black11
                          : AppTheme.white14,
                    ),
                    suffixIcon: IconButton(
                      splashRadius: 24,
                      icon: Provider.of<LoginRegisterProvider>(context)
                              .registerPasswordVisible
                          ? SizedBox(
                              child: Image.asset(
                                  'assets/icons/eye-off-line.png',
                                  width: 20,
                                  height: 20,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.black11
                                      : AppTheme.white1),
                            )
                          : SizedBox(
                              child: Image.asset('assets/icons/eye-line.png',
                                  width: 20,
                                  height: 20,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.black11
                                      : AppTheme.white1),
                            ),
                      splashColor: Colors.transparent,
                      onPressed: () async {
                        Provider.of<LoginRegisterProvider>(context,
                                listen: false)
                            .updateRegisterPasswordVisible();
                      },
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue2
                            : AppTheme.white1,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 13),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.trim().isEmpty) {
                //       return 'Password Validate-1'.tr;
                //     }
                //     if (value.trim().length < 8) {
                //       return 'Password Validate-2'.tr;
                //     }
                //     if (value != passwordController1.text) {
                //       return 'Password Validate-3'.tr;
                //     }
                //     return null;
                //   },
                //   controller: passwordController2,
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w500,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white1), // WHILE WRITING
                //   maxLines: 1,
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                //     filled: true,
                //     fillColor:
                //         Provider.of<ThemeProvider>(context).themeMode == "light"
                //             ? AppTheme.white5
                //             : AppTheme.black7,
                //     hintText: 'Password (confirm)'.tr,
                //     hintStyle: TextStyle(
                //       fontSize: 14,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w400,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white14,
                //     ),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.blue2
                //             : AppTheme.white1,
                //         width: 1,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 13),
                // TextFormField(
                //   validator: (value) {
                //     if (value == null || value.trim().isEmpty) {
                //       return 'Company Name Validate'.tr;
                //     }
                //     return null;
                //   },
                //   controller: companyNameController,
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w500,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white1), // WHILE WRITING
                //   maxLines: 1,
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                //     filled: true,
                //     fillColor:
                //         Provider.of<ThemeProvider>(context).themeMode == "light"
                //             ? AppTheme.white5
                //             : AppTheme.black7,
                //     hintText: 'Company Name'.tr,
                //     hintStyle: TextStyle(
                //       fontSize: 14,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w400,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white14,
                //     ),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.blue2
                //             : AppTheme.white1,
                //         width: 1,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 13),
                // TextFormField(
                //   controller: officialPersonController,
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w500,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white1), // WHILE WRITING
                //   maxLines: 1,
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                //     filled: true,
                //     fillColor:
                //         Provider.of<ThemeProvider>(context).themeMode == "light"
                //             ? AppTheme.white5
                //             : AppTheme.black7,
                //     hintText: 'Official Person'.tr,
                //     hintStyle: TextStyle(
                //       fontSize: 14,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w400,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white14,
                //     ),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.blue2
                //             : AppTheme.white1,
                //         width: 1,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 13),
                // TextFormField(
                //   controller: officialPhoneController,
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w500,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white1), // WHILE WRITING
                //   maxLines: 1,
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                //     filled: true,
                //     fillColor:
                //         Provider.of<ThemeProvider>(context).themeMode == "light"
                //             ? AppTheme.white5
                //             : AppTheme.black7,
                //     hintText: 'Official Phone'.tr,
                //     hintStyle: TextStyle(
                //       fontSize: 14,
                //       fontFamily: AppTheme.appFontFamily,
                //       fontWeight: FontWeight.w400,
                //       color: Provider.of<ThemeProvider>(context).themeMode ==
                //               "light"
                //           ? AppTheme.black11
                //           : AppTheme.white14,
                //     ),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: const BorderSide(
                //           color: Colors.transparent,
                //           width: 1,
                //         )),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       borderSide: BorderSide(
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.blue2
                //             : AppTheme.white1,
                //         width: 1,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 13),
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
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.black11
                //             : AppTheme.white14,
                //       ),
                //       overflow: TextOverflow.visible,
                //     ),
                //     items: Provider.of<LoginRegisterProvider>(context)
                //         .dropdownItems
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
                //     value: Provider.of<LoginRegisterProvider>(context)
                //         .dropdownSelectedValue,
                //
                //     onChanged: (value) {
                //       Provider.of<LoginRegisterProvider>(context, listen: false)
                //           .updateDropdownSelectedValue(value as String);
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
                // DropdownButtonHideUnderline(
                //   child: DropdownButton2(
                //     // alignment: AlignmentDirectional.center,
                //     isExpanded: true,
                //     hint: Text(
                //       'Country'.tr,
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontFamily: AppTheme.appFontFamily,
                //         fontWeight: FontWeight.w400,
                //         color: Provider.of<ThemeProvider>(context).themeMode ==
                //                 "light"
                //             ? AppTheme.black11
                //             : AppTheme.white14,
                //       ),
                //     ),
                //     items: Provider.of<LoginRegisterProvider>(context)
                //         .dropdownItems
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item.name,
                //               child: Text(
                //                 item.name ?? '',
                //                 style: TextStyle(
                //                   fontSize: 14,
                //                   fontFamily: AppTheme.appFontFamily,
                //                   fontWeight: FontWeight.w400,
                //                   color: Provider.of<ThemeProvider>(context)
                //                               .themeMode ==
                //                           "light"
                //                       ? AppTheme.black11
                //                       : AppTheme.white14,
                //                 ),
                //               ),
                //             ))
                //         .toList(),
                //     value: Provider.of<LoginRegisterProvider>(context)
                //         .dropdownSelectedValue,
                //
                //     onChanged: (value) {
                //       Provider.of<LoginRegisterProvider>(context, listen: false)
                //           .updateDropdownSelectedValue(value as String);
                //
                //       var countryIndex = countryList
                //           .indexWhere(((element) => element.name == value));
                //       if (countryIndex != -1) {
                //         debugPrint('COUNTRY INDEX: $countryIndex');
                //         debugPrint(
                //             'COUNTRY CODE: ${countryList[countryIndex].code}');
                //
                //         countryCode = countryList[countryIndex].code;
                //       }
                //     },
                //
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
                //     buttonPadding: const EdgeInsets.only(left: 25, right: 17),
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
                //     itemPadding: const EdgeInsets.symmetric(horizontal: 32),
                //     // dropdownMaxHeight: deviceHeight * 0.4,
                //     dropdownMaxHeight: 350,
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
                //     offset: const Offset(0, 180),
                //
                //     searchController: textEditingController,
                //     searchInnerWidget: Padding(
                //       padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                //       child: TextFormField(
                //         controller: textEditingController,
                //         style: TextStyle(
                //             fontSize: 14,
                //             fontFamily: AppTheme.appFontFamily,
                //             fontWeight: FontWeight.w500,
                //             color:
                //                 Provider.of<ThemeProvider>(context).themeMode ==
                //                         "light"
                //                     ? AppTheme.black11
                //                     : AppTheme.white1), // WHILE WRITING
                //         decoration: InputDecoration(
                //           isDense: true,
                //           contentPadding: const EdgeInsets.symmetric(
                //             horizontal: 16,
                //             vertical: 12,
                //           ),
                //           hintText: 'Country Dropdown'.tr,
                //           hintStyle: TextStyle(
                //             fontSize: 14,
                //             fontFamily: AppTheme.appFontFamily,
                //             fontWeight: FontWeight.w400,
                //             color:
                //                 Provider.of<ThemeProvider>(context).themeMode ==
                //                         "light"
                //                     ? AppTheme.black11
                //                     : AppTheme.white14,
                //           ),
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide(
                //                 color: AppTheme.white15,
                //                 width: 1,
                //               )),
                //           enabledBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide(
                //                 color: AppTheme.white15,
                //                 width: 1,
                //               )),
                //           focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10),
                //             borderSide: BorderSide(
                //               color: Provider.of<ThemeProvider>(context)
                //                           .themeMode ==
                //                       "light"
                //                   ? AppTheme.white10
                //                   : AppTheme.white1,
                //               width: 1,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     searchMatchFn: (item, searchValue) {
                //       debugPrint("ITEM:${item.value}");
                //
                //       return (item.value
                //           .toLowerCase()
                //           .contains(searchValue.toLowerCase()));
                //     },
                //     //This to clear the search value when you close the menu
                //     onMenuStateChange: (isOpen) {
                //       if (!isOpen) {
                //         textEditingController.clear();
                //       }
                //     },
                //   ),
                // ),
                const SizedBox(height: 23),
                Row(
                  children: [
                    FlutterSwitch(
                      width: 42,
                      height: 21,
                      toggleSize: 17,
                      padding: 2,
                      borderRadius: 100,
                      inactiveColor:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  "light"
                              ? AppTheme.white7
                              : AppTheme.black10,
                      activeColor: AppTheme.green1,
                      toggleColor:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  "light"
                              ? AppTheme.white1
                              : AppTheme.black4,

                      // value: Provider.of<LoginRegisterPageProvider>(context)
                      //     .registerSwitch,

                      value: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? false
                          : true,

                      onToggle: (value) {
                        if (value == false) {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .setLightMode();
                          debugPrint('Light Theme Activated');
                        } else {
                          Provider.of<ThemeProvider>(context, listen: false)
                              .setDarkMode();
                          debugPrint('Dark Theme Activated');
                        }
                      },
                    ),
                    const SizedBox(width: 13),
                    Expanded(
                      child: Text(
                        'User Agreement'.tr,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.white14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ButtonTheme(
                  minWidth: deviceWidth,
                  height: 52,
                  child: Container(
                    height: 52,
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
                          'Sign Up'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1),
                        ),
                        onPressed: () {
                          if (formKey2.currentState!.validate()) {
                            debugPrint("email: ${emailController1.text}");
                            debugPrint("password: ${passwordController1.text}");
                            debugPrint(
                                "companyName: ${companyNameController.text}");
                            debugPrint(
                                "officialPerson: ${officialPersonController.text}");
                            debugPrint(
                                "officialPhone: ${officialPhoneController.text}");
                            debugPrint("country: $countryCode");

                            locator<MemberServices>()
                                .registerCall(
                              email: emailController1.text,
                              password: passwordController1.text,
                              companyName: companyNameController.text,
                              officialPerson: officialPersonController.text,
                              officialPhone: officialPhoneController.text,
                              country: countryCode.toString(),
                            )
                                .then((value) {
                              if (value != "error") {
                                debugPrint("REGISTRATION SUCCESSFUL");

                                locator<MemberServices>()
                                    .verifyCall(
                                        email: emailController1.text,
                                        verifyCode: value)
                                    .then((value2) {
                                  if (value2 == true) {
                                    debugPrint("VERIFICATION SUCCESSFUL");

                                    showAlertDialog(context);

                                    Timer(
                                        const Duration(milliseconds: 1500),
                                        () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LoginPage(
                                                  email: emailController1.text,
                                                  password:
                                                      passwordController1.text),
                                            )));
                                  } else {
                                    debugPrint("VERIFICATION FAILED");
                                    showAlertDialog2(context);
                                  }
                                });
                              } else {
                                debugPrint("REGISTRATION FAILED");
                                showAlertDialog2(context);
                              }
                            });
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
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
                      'Register Alert-1'.tr,
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
                      Icons.check_circle_outlined,
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
                      'Register Alert-2'.tr,
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
