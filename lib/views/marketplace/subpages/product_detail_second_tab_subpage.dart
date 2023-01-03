import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/providers/marketplace_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:b2geta_mobile/models/dummy_models/product_dummy_model.dart';
import 'package:b2geta_mobile/providers/marketplace_provider.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_first_tab_subpage.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_second_tab_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(height: 8),
            Text(
              '3 yoruma göre',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4E4B66),
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
