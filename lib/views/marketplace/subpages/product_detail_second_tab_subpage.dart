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
                        color: ratingCheckBox1
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: ratingCheckBox1
                                ? Colors.transparent
                                : AppTheme.white24),
                      ),
                      child: ratingCheckBox1
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
                      setState(() {
                        ratingCheckBox1 = !ratingCheckBox1;
                      });
                    },
                  ),
                  SizedBox(width: 11),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
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
          ],
        ),
        SizedBox(height: 16),
        // FittedBox(
        //   child: Column(
        //     children: [
        //       Row(
        //         children: [
        //           Container(
        //             width: deviceWidth * 0.5 - 15,
        //             child: LinearPercentIndicator(
        //               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        //               animation: true,
        //               lineHeight: 12,
        //               animationDuration: 0,
        //               percent: 60 / 100,
        //               barRadius: Radius.circular(100),
        //               progressColor: AppTheme.blue2,
        //               // progressColor: percent != 100 ? AppTheme().secondaryColor : AppTheme().successColor,
        //               backgroundColor: AppTheme.blue2.withOpacity(0.1),
        //             ),
        //           ),
        //           SizedBox(width: 12),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Image.asset(
        //                 'assets/icons/star-fill.png',
        //                 width: 24,
        //                 height: 24,
        //               ),
        //               SizedBox(width: 4),
        //               Image.asset(
        //                 'assets/icons/star-fill.png',
        //                 width: 24,
        //                 height: 24,
        //               ),
        //               SizedBox(width: 4),
        //               Image.asset(
        //                 'assets/icons/star-fill.png',
        //                 width: 24,
        //                 height: 24,
        //               ),
        //               SizedBox(width: 4),
        //               Image.asset(
        //                 'assets/icons/star-fill.png',
        //                 width: 24,
        //                 height: 24,
        //               ),
        //               SizedBox(width: 4),
        //               Image.asset(
        //                 'assets/icons/star-fill.png',
        //                 width: 24,
        //                 height: 24,
        //               ),
        //             ],
        //           ),
        //           SizedBox(width: 8),
        //           Text(
        //             '2.567',
        //             style: TextStyle(
        //               fontSize: 16,
        //               fontFamily: AppTheme.appFontFamily,
        //               fontWeight: FontWeight.w600,
        //               color: AppTheme.black1,
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(height: 15),
        //     ],
        //   ),
        // ),
        SizedBox(height: 24),
      ],
    );
  }
}
