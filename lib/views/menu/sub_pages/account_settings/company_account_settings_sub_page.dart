// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/profile/company_profile_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';
import 'package:b2geta_mobile/views/login_register/login_page.dart';

class CompanyAccountSettingsSubPage extends StatefulWidget {
  const CompanyAccountSettingsSubPage({
    Key? key,
    required this.companyProfileModel,
  }) : super(key: key);
  final CompanyProfileModel companyProfileModel;

  @override
  State<CompanyAccountSettingsSubPage> createState() =>
      _CompanyAccountSettingsSubPageState();
}

class _CompanyAccountSettingsSubPageState
    extends State<CompanyAccountSettingsSubPage> {
  ScrollController scrollController = ScrollController();
  final MemberServices _memberServices = MemberServices();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _citizenshipNumber = TextEditingController();

  var countryCode;
  var phoneNumber;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();
    _firstNameController.text =
        Provider.of<UserProvider>(context, listen: false).getUser.firstname ??
            '';
    _lastNameController.text =
        Provider.of<UserProvider>(context, listen: false).getUser.lastname ??
            '';
    _phoneNumberController.text =
        Provider.of<UserProvider>(context, listen: false).getUser.phone != null
            ? Provider.of<UserProvider>(context, listen: false)
                .getUser
                .phone!
                .substring(2)
            : '';
    _emailController.text =
        Provider.of<UserProvider>(context, listen: false).getUser.email ?? '';
    _citizenshipNumber.text = Provider.of<UserProvider>(context, listen: false)
            .getUser
            .citizenshipNumber ??
        '';
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
      appBar: const CustomInnerAppBar(),
      body: Consumer<UserProvider>(
        builder: (BuildContext context, userProvider, Widget? child) {
          return SingleChildScrollView(
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
                        child: (userProvider.getUser.avatar != null &&
                                userProvider.getUser.avatar!.isNotEmpty)
                            ? CachedNetworkImage(
                                imageUrl: '${userProvider.getUser.avatar}',
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
                    titleText: 'First Name'.tr,
                    controller: _firstNameController,
                    color: themeMode ? AppTheme.white5 : AppTheme.black7,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'First Name Validate'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  CustomTextFormField(
                    titleText: 'Last Name'.tr,
                    controller: _lastNameController,
                    color: themeMode ? AppTheme.white5 : AppTheme.black7,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Last Name Validate'.tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 13),
                  IntlPhoneField(
                    validator: (value) {
                      if (value == null) {
                        return 'Phone Number Validate'.tr;
                      }
                      return null;
                    },
                    controller: _phoneNumberController,
                    onChanged: (phone) {
                      phoneNumber = phone.completeNumber;
                    },
                    initialCountryCode: 'TR',
                    invalidNumberMessage: 'Phone Number Validate'.tr,
                    autovalidateMode: AutovalidateMode.disabled,
                    dropdownTextStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white1), // ,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.black11
                            : AppTheme.white1), // WHILE WRITING
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                      filled: true,
                      fillColor:
                          Provider.of<ThemeProvider>(context).themeMode ==
                                  "light"
                              ? AppTheme.white5
                              : AppTheme.black7,
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
                  const SizedBox(height: 13),
                  CustomTextFormField(
                    titleText: 'E-mail'.tr,
                    controller: _emailController,
                    color: themeMode ? AppTheme.white5 : AppTheme.black7,
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
                    titleText: 'CitizenshipNumber'.tr,
                    controller: _citizenshipNumber,
                    color: themeMode ? AppTheme.white5 : AppTheme.black7,
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
                  const SizedBox(height: 27),
                  Container(
                    width: deviceWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
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
                                _memberServices
                                    .deleteAccountCall()
                                    .then((value) {
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
                                              FadeTransition(
                                                  opacity: a, child: c),
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
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
