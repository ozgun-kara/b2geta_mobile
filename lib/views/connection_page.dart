import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile/app_theme.dart';

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({Key? key}) : super(key: key);

  @override
  State<ConnectionPage> createState() => _ConnectionPageState();
}

class _ConnectionPageState extends State<ConnectionPage> {
  var deviceWidth;
  var deviceHeight;
  var deviceTopPadding;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceTopPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppTheme().pageBackgroundColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, deviceTopPadding + 22, 16, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/bowtie-logo.png',
              width: 145.07,
              height: 32,
            ),
            Column(
              children: [
                FittedBox(
                  child: Image.asset(
                    'assets/images/internet-connection.png',
                    width: 381,
                    height: 268,
                  ),
                ),
                // SizedBox(height: 42),
                Text(
                  'Bağlantı Hatası',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: AppTheme().appFontFamily,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF0C235E),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum efficitur nisi, ac aliquet lorem. Sed iaculis mi ante, eu lobortis leo semper sed. Curabitur ut nunc porttitor,',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme().appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF64739A),
                  ),
                ),
              ],
            ),
            ButtonTheme(
              minWidth: deviceWidth,
              height: 56,
              child: MaterialButton(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  color: AppTheme().primaryColor,
                  elevation: 0,
                  child: Text(
                    'Tekrar Dene',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppTheme().appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  onPressed: () async {}),
            )
          ],
        ),
      ),
    );
  }
}
