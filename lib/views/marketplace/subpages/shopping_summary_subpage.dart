import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class ShoppingSummarySubpage extends StatefulWidget {
  const ShoppingSummarySubpage({Key? key}) : super(key: key);

  @override
  State<ShoppingSummarySubpage> createState() => _ShoppingSummarySubpageState();
}

class _ShoppingSummarySubpageState extends State<ShoppingSummarySubpage> {
  ScrollController scrollController = ScrollController();

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
          : AppTheme.black7,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 63, 0, 14),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/check-2.png',
                  width: 75.83,
                  height: 75.83,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
