import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController1 = TextEditingController();
  final emailController2 = TextEditingController();
  final passwordController1 = TextEditingController();
  final passwordController2 = TextEditingController();
  final companyNameController = TextEditingController();
  final authorizedNameController = TextEditingController();
  final authorizedPhoneController = TextEditingController();

  final List<String> dropdownItems = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? dropdownSelectedValue;

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
                padding: EdgeInsets.only(top: 65),
                // padding: EdgeInsets.only(top: 49),
                child: Text(
                  'Üyelik Formu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.appFontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    // color: Provider.of<ThemeProvider>(context).themeSwitch
                    //     ? AppTheme.blue1
                    //     : AppTheme.white1
                  ),
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 55),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: emailController1,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "E-mail",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: emailController2,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "E-mail (tekrar)",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: passwordController1,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "Şifre",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: passwordController2,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "Şifre Tekrar",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: companyNameController,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "Firma Adı",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: authorizedNameController,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "Yetkili Kişi",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              TextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Check if the entered email has the right format
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  // Return null if the entered email is valid
                  return null;
                },
                controller: authorizedPhoneController,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.white2,
                ), // WHILE WRITING
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                  filled: true,
                  fillColor: AppTheme.black7,
                  hintText: "Yetkili Telefon",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // alignment: AlignmentDirectional.center,
                  // isExpanded: true,
                  hint: Text(
                    "Ülke",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white14,
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
                                  color: AppTheme.white14,
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
                    color: AppTheme.black7,
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
                    color: AppTheme.black7,
                  ),
                  // dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 4,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(0, 0),
                ),
              ),
              SizedBox(height: 23),
              Column(
                children: [
                  Row(
                    children: [
                      FlutterSwitch(
                        width: 42,
                        height: 21,
                        toggleSize: 17,
                        padding: 2,
                        borderRadius: 100,
                        activeColor: AppTheme.green1,
                        inactiveColor: AppTheme.black10,
                        toggleColor: AppTheme.black4,

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
                          } else {
                            Provider.of<ThemeProvider>(context, listen: false)
                                .setDarkMode();
                          }

                          // Provider.of<LoginRegisterPageProvider>(context,
                          //         listen: false)
                          //     .updateregisterSwitch(value);
                        },
                      ),
                      SizedBox(width: 13),
                      Expanded(
                        child: Text(
                          "Kullanıcı sözleşmesişni okudum onaylıyorum",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.white14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
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

                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: MaterialButton(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            "Üye Ol",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () async {}),
                    ),
                  ),
                ],
              ),

              // Row(
              //   children: [
              //     FlutterSwitch(
              //       width: 42,
              //       height: 21,
              //       toggleSize: 17,
              //       padding: 2,
              //       borderRadius: 100,
              //       activeColor: AppTheme().green1,
              //       inactiveColor: AppTheme().black10,
              //       toggleColor: AppTheme().black4,
              //       value: Provider.of<LoginRegisterPageProvider>(context)
              //           .registerSwitch,
              //       onToggle: (value) {
              //         Provider.of<LoginRegisterPageProvider>(context,
              //                 listen: false)
              //             .updateregisterSwitch(value);
              //       },
              //     ),
              //     SizedBox(width: 13),
              //     Expanded(
              //       child: Text(
              //         "Kullanıcı sözleşmesişni okudum onaylıyorum",
              //         style: TextStyle(
              //             fontSize: 12,
              //             fontFamily: AppTheme().appFontFamily,
              //             fontWeight: FontWeight.w400,
              //             color: AppTheme().white14),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 30),
              // ButtonTheme(
              //   minWidth: deviceWidth,
              //   height: 52,
              //   child: Container(
              //     height: 52,
              //     decoration: BoxDecoration(
              //         color: AppTheme().green1,
              //         // boxShadow: [
              //         //   BoxShadow(
              //         //     blurStyle: BlurStyle.outer,
              //         //     offset: Offset(0, -4),
              //         //     blurRadius: 16,
              //         //     spreadRadius: 0,
              //         //     color: Color(0xFF0E0E0F).withOpacity(0.17),
              //         //   ),
              //         //   BoxShadow(
              //         //     blurStyle: BlurStyle.normal,
              //         //     offset: Offset(0, -2),
              //         //     blurRadius: 2,
              //         //     spreadRadius: 0,
              //         //     color: Color(0xFFFFFFFF).withOpacity(0.25),
              //         //   ),
              //         //   BoxShadow(
              //         //     blurStyle: BlurStyle.normal,
              //         //     offset: Offset(0, 1),
              //         //     blurRadius: 2,
              //         //     spreadRadius: 0,
              //         //     color: Color(0xFF000000).withOpacity(0.18),
              //         //   ),
              //         // ],
              //
              //         borderRadius: BorderRadius.all(Radius.circular(16))),
              //     child: MaterialButton(
              //         elevation: 0,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(16)),
              //         ),
              //         child: Text(
              //           "Üye Ol",
              //           style: TextStyle(
              //               fontSize: 16,
              //               fontFamily: AppTheme().appFontFamily,
              //               fontWeight: FontWeight.w700,
              //               color: AppTheme().white1),
              //         ),
              //         onPressed: () async {}),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
