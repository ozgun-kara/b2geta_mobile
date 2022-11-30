import 'package:b2geta_mobile/app_constants.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF21233A),
      body: Center(
        child: Padding(
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
                            fontFamily: AppConstants().appFontFamily,
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

                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: MaterialButton(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          "Kaydet",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppConstants().appFontFamily,
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
      ),
    );
  }
}
