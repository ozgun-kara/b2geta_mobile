import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/login_register_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF21233A),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 55),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(23, 0, 23, 0),
                child: Container(
                  width: deviceWidth,
                  height: deviceHeight * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: Color(0xFF2D304B),
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
                              'Dil Seçimi',
                              style: TextStyle(
                                  fontFamily: AppTheme().appFontFamily,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xFF21233A),
                        ),
                      ),
                      SizedBox(height: 21),
                      ButtonTheme(
                        minWidth: deviceWidth,
                        height: 64,
                        child: Container(
                          height: 64,
                          decoration: BoxDecoration(
                              color: Color(0xFF2943D6),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, -2),
                                    color: Color(0xFFFFFFFF).withOpacity(0.25),
                                    blurRadius: 2,
                                    spreadRadius: 0),
                                BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Color(0xFF000000).withOpacity(0.18),
                                    blurRadius: 2,
                                    spreadRadius: 0),
                              ],

                              // gradient:

                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: MaterialButton(
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Text(
                                "Kaydet",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTheme().appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              onPressed: () async {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 400),
              Row(
                children: [
                  FlutterSwitch(
                    width: 42,
                    height: 21,
                    toggleSize: 17,
                    padding: 2,
                    borderRadius: 100,
                    activeColor: AppTheme().green1,
                    inactiveColor: AppTheme().black10,
                    toggleColor: AppTheme().black4,
                    value: Provider.of<LoginRegisterPageProvider>(context)
                        .registerSwitch,
                    onToggle: (value) {
                      Provider.of<LoginRegisterPageProvider>(context,
                              listen: false)
                          .updateregisterSwitch(value);
                    },
                  ),
                  SizedBox(width: 13),
                  Expanded(
                    child: Text(
                      "Kullanıcı sözleşmesişni okudum onaylıyorum",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme().appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: AppTheme().white14),
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
                      color: AppTheme().green1,
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
                            fontFamily: AppTheme().appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme().white1),
                      ),
                      onPressed: () async {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
