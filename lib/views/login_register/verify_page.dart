import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({
    Key? key,
    required this.email,
  }) : super(key: key);
  final String email;

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
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
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
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
                'Üyelik Aktifleştirme',
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
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            // key: formKey2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: widget.email,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.black11
                          : AppTheme.white1), // WHILE WRITING
                  maxLines: 1,
                  readOnly: true,
                  enabled: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 16, 25, 16),
                    filled: true,
                    labelText: "Email",
                    fillColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
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
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue2
                            : AppTheme.white1,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "4 haneli kodu giriniz",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w500,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.black11
                          : AppTheme.white1),
                ),
                const SizedBox(
                  height: 13,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black11
                                    : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding:
                              const EdgeInsets.fromLTRB(4, 16, 4, 16),
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        initialValue: widget.email,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black11
                                    : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        readOnly: true,
                        enabled: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 16, 25, 16),
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        initialValue: widget.email,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black11
                                    : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        readOnly: true,
                        enabled: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 16, 25, 16),
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        initialValue: widget.email,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black11
                                    : AppTheme.white1), // WHILE WRITING
                        maxLines: 1,
                        readOnly: true,
                        enabled: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding:
                              const EdgeInsets.fromLTRB(25, 16, 25, 16),
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1,
                              width: 1,
                            ),
                          ),
                        ),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    child: MaterialButton(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          'Etkinleştir'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1),
                        ),
                        onPressed: () {
                          /*  if (formKey2.currentState!.validate()) {
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
                          } */
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
}
