import 'package:b2geta_mobile/services/test_services/company/company_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class CompanyTestPage extends StatefulWidget {
  const CompanyTestPage({Key? key}) : super(key: key);

  @override
  State<CompanyTestPage> createState() => _CompanyTestPageState();
}

class _CompanyTestPageState extends State<CompanyTestPage> {
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
              SizedBox(height: 200),
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
                        'ADD COMPANY',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {
                        // debugPrint("email: " + emailController1.text);
                        // debugPrint("password: " + passwordController1.text);
                        // debugPrint(
                        //     "companyName: " + companyNameController.text);
                        // debugPrint("officialPerson: " +
                        //     officialPersonController.text);
                        // debugPrint(
                        //     "officialPhone: " + officialPhoneController.text);
                        // debugPrint(
                        //     "country: " + dropdownSelectedValue.toString());

                        CompanyServices()
                            .addCompanyCall(
                                // companyName: 'ABC Firma LTD',
                                // taxNumber: '1234567890',
                                // email: 'example@company.com',
                                // wantEmail: '1',
                                // city: '34',
                                // district: '45',
                                // about: 'Firma hakkında bilgiler',
                                // timezone: '3'

                                companyName: 'ABC Firma LTD',
                                taxOffice: 'Beşiktaş',
                                taxNumber: '1234567890',
                                phoneNumber: '+905556667788',
                                email: 'example@company.com',
                                wantEmail: '1',
                                country: 'TR',
                                city: '34',
                                district: '45',
                                address: 'Mecidiyeköy mah abc sokak',
                                postalCode: '34387',
                                about: 'Firma hakkında bilgiler',
                                languageCode: 'tr',
                                countryCode: 'TR',
                                timezone: '3')
                            .then((value) {
                          if (value == true) {
                            debugPrint("COMPANY SUCCESSFULLY ADDED");
                          } else {
                            debugPrint("THE COMPANY HAS NOT ADDED");
                            showAlertDialog2(context);
                          }
                        });
                      }),
                ),
              ),
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
