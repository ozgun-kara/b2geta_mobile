import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/providers/marketplace_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class ProductDetailSecondTabSubpage extends StatefulWidget {
  ProductDetailSecondTabSubpage({Key? key}) : super(key: key);

  @override
  State<ProductDetailSecondTabSubpage> createState() =>
      _ProductDetailSecondTabSubpageState();
}

class _ProductDetailSecondTabSubpageState
    extends State<ProductDetailSecondTabSubpage> {
  ScrollController scrollController = ScrollController();

  bool ratingCheckBox1 = true;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Column(
          children: [
            Text(
              '4.8',
              style: TextStyle(
                fontSize: 40,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w800,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.blue3
                    : AppTheme.white1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                  color: AppTheme.white26,
                ),
              ],
            ),
            SizedBox(height: 14),
            Text(
              '2 yorum',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w600,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.blue3
                    : AppTheme.white1,
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlaceProvider>(context)
                                .ratingCheckBox1
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlaceProvider>(context)
                                    .ratingCheckBox1
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlaceProvider>(context)
                              .ratingCheckBox1
                          ? Center(
                              child: Image.asset(
                                'assets/icons/check-3.png',
                                width: 10,
                                height: 8,
                                // color: Colors.red,
                              ),
                            )
                          : Container(),
                    ),
                    onTap: () {
                      Provider.of<MarketPlaceProvider>(context, listen: false)
                          .updateRatingCheckBox(1);
                    },
                  ),
                  SizedBox(width: 11),
                  Container(
                    width: 8,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '5',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white11,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 75 / 100,
                    barRadius: Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlaceProvider>(context)
                                .ratingCheckBox2
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlaceProvider>(context)
                                    .ratingCheckBox2
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlaceProvider>(context)
                              .ratingCheckBox2
                          ? Center(
                              child: Image.asset(
                                'assets/icons/check-3.png',
                                width: 10,
                                height: 8,
                                // color: Colors.red,
                              ),
                            )
                          : Container(),
                    ),
                    onTap: () {
                      Provider.of<MarketPlaceProvider>(context, listen: false)
                          .updateRatingCheckBox(2);
                    },
                  ),
                  SizedBox(width: 11),
                  Container(
                    width: 8,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '4',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white11,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 40 / 100,
                    barRadius: Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlaceProvider>(context)
                                .ratingCheckBox3
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlaceProvider>(context)
                                    .ratingCheckBox3
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlaceProvider>(context)
                              .ratingCheckBox3
                          ? Center(
                              child: Image.asset(
                                'assets/icons/check-3.png',
                                width: 10,
                                height: 8,
                                // color: Colors.red,
                              ),
                            )
                          : Container(),
                    ),
                    onTap: () {
                      Provider.of<MarketPlaceProvider>(context, listen: false)
                          .updateRatingCheckBox(3);
                    },
                  ),
                  SizedBox(width: 11),
                  Container(
                    width: 8,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '3',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white11,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 0 / 100,
                    barRadius: Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlaceProvider>(context)
                                .ratingCheckBox4
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlaceProvider>(context)
                                    .ratingCheckBox4
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlaceProvider>(context)
                              .ratingCheckBox4
                          ? Center(
                              child: Image.asset(
                                'assets/icons/check-3.png',
                                width: 10,
                                height: 8,
                                // color: Colors.red,
                              ),
                            )
                          : Container(),
                    ),
                    onTap: () {
                      Provider.of<MarketPlaceProvider>(context, listen: false)
                          .updateRatingCheckBox(4);
                    },
                  ),
                  SizedBox(width: 11),
                  Container(
                    width: 8,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '2',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white11,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 0 / 100,
                    barRadius: Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlaceProvider>(context)
                                .ratingCheckBox5
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlaceProvider>(context)
                                    .ratingCheckBox5
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlaceProvider>(context)
                              .ratingCheckBox5
                          ? Center(
                              child: Image.asset(
                                'assets/icons/check-3.png',
                                width: 10,
                                height: 8,
                                // color: Colors.red,
                              ),
                            )
                          : Container(),
                    ),
                    onTap: () {
                      Provider.of<MarketPlaceProvider>(context, listen: false)
                          .updateRatingCheckBox(5);
                    },
                  ),
                  SizedBox(width: 11),
                  Container(
                    width: 8,
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white11,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 0 / 100,
                    barRadius: Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 1,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white25
                    : AppTheme.black21),
          ],
        ), // RATING SELECTION PANEL
        SizedBox(height: 24),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(21, 0, 21, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filtrele',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue2
                            : AppTheme.blue4),
                  ),
                  GestureDetector(
                      child: Column(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.blue3
                                        : AppTheme.white15
                                    : Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.white1
                                        : AppTheme.white15),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: deviceWidth * 0.2,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.blue2
                                        : Colors.transparent
                                    : Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.blue2
                                        : Colors.transparent),
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<MarketPlaceProvider>(context, listen: false)
                            .updateProductCommentsTab(0);
                      }),
                  GestureDetector(
                      child: Column(
                        children: [
                          Text(
                            'Fotoğraflı',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.blue3
                                        : AppTheme.white15
                                    : Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.white1
                                        : AppTheme.white15),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: deviceWidth * 0.2,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.blue2
                                        : Colors.transparent
                                    : Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.blue2
                                        : Colors.transparent),
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<MarketPlaceProvider>(context, listen: false)
                            .updateProductCommentsTab(1);
                      }),
                  GestureDetector(
                      child: Column(
                        children: [
                          Text(
                            'En yeniler',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.blue3
                                        : AppTheme.white15
                                    : Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.white1
                                        : AppTheme.white15),
                          ),
                          SizedBox(height: 24),
                          Container(
                            width: deviceWidth * 0.2,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.blue2
                                        : Colors.transparent
                                    : Provider.of<MarketPlaceProvider>(context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.blue2
                                        : Colors.transparent),
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<MarketPlaceProvider>(context, listen: false)
                            .updateProductCommentsTab(2);
                      }),
                ],
              ),
            ),
            Container(
                height: 1,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white25
                    : AppTheme.black21),
            SizedBox(height: 16),
            Provider.of<MarketPlaceProvider>(context).productCommentsTab == 0
                ? Container()
                : Container(),
            SizedBox(height: 80),
          ],
        ),
      ],
    );
  }
}
