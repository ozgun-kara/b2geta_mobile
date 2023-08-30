import 'package:b2geta_mobile/models/dummy_models/customer_comment_dummy_model.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_gallery_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductDetailSecondTabSubPage extends StatefulWidget {
  const ProductDetailSecondTabSubPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailSecondTabSubPage> createState() =>
      _ProductDetailSecondTabSubPageState();
}

class _ProductDetailSecondTabSubPageState
    extends State<ProductDetailSecondTabSubPage> {
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
                const SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                const SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                const SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                ),
                const SizedBox(width: 4),
                Image.asset(
                  'assets/icons/star-fill.png',
                  width: 17,
                  height: 17,
                  color: AppTheme.white26,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              '2 ${'Comment'.tr}',
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w600,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.blue3
                    : AppTheme.white1,
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlacePageProvider>(context)
                                .ratingCheckBox1
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlacePageProvider>(context)
                                    .ratingCheckBox1
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlacePageProvider>(context)
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
                      Provider.of<MarketPlacePageProvider>(context,
                              listen: false)
                          .updateRatingCheckBox(1);
                    },
                  ),
                  const SizedBox(width: 11),
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
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: const EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 75 / 100,
                    barRadius: const Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlacePageProvider>(context)
                                .ratingCheckBox2
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlacePageProvider>(context)
                                    .ratingCheckBox2
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlacePageProvider>(context)
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
                      Provider.of<MarketPlacePageProvider>(context,
                              listen: false)
                          .updateRatingCheckBox(2);
                    },
                  ),
                  const SizedBox(width: 11),
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
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: const EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 40 / 100,
                    barRadius: const Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlacePageProvider>(context)
                                .ratingCheckBox3
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlacePageProvider>(context)
                                    .ratingCheckBox3
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlacePageProvider>(context)
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
                      Provider.of<MarketPlacePageProvider>(context,
                              listen: false)
                          .updateRatingCheckBox(3);
                    },
                  ),
                  const SizedBox(width: 11),
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
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: const EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 0 / 100,
                    barRadius: const Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlacePageProvider>(context)
                                .ratingCheckBox4
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlacePageProvider>(context)
                                    .ratingCheckBox4
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlacePageProvider>(context)
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
                      Provider.of<MarketPlacePageProvider>(context,
                              listen: false)
                          .updateRatingCheckBox(4);
                    },
                  ),
                  const SizedBox(width: 11),
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
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: const EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 0 / 100,
                    barRadius: const Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    radius: 24,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Provider.of<MarketPlacePageProvider>(context)
                                .ratingCheckBox5
                            ? AppTheme.green2
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3)),
                        border: Border.all(
                            width: 1,
                            color: Provider.of<MarketPlacePageProvider>(context)
                                    .ratingCheckBox5
                                ? Colors.transparent
                                : Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white24
                                    : AppTheme.black21),
                      ),
                      child: Provider.of<MarketPlacePageProvider>(context)
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
                      Provider.of<MarketPlacePageProvider>(context,
                              listen: false)
                          .updateRatingCheckBox(5);
                    },
                  ),
                  const SizedBox(width: 11),
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
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/icons/star-fill.png',
                    width: 17,
                    height: 17,
                  ),
                  const SizedBox(width: 7),
                  LinearPercentIndicator(
                    width: deviceWidth - 120,
                    padding: const EdgeInsets.all(0),
                    animation: true,
                    lineHeight: 10,
                    animationDuration: 0,
                    percent: 0 / 100,
                    barRadius: const Radius.circular(22),
                    progressColor: AppTheme.blue2,
                    backgroundColor:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.white27
                            : AppTheme.black23,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
                height: 1,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white25
                    : AppTheme.black21),
          ],
        ), // RATING SELECTION PANEL
        const SizedBox(height: 24),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter'.tr,
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
                            'All'.tr,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.blue3
                                        : AppTheme.white15
                                    : Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.white1
                                        : AppTheme.white15),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: deviceWidth * 0.2,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.blue2
                                        : Colors.transparent
                                    : Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            0
                                        ? AppTheme.blue2
                                        : Colors.transparent),
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<MarketPlacePageProvider>(context,
                                listen: false)
                            .updateProductCommentsTab(0);
                      }),
                  GestureDetector(
                      child: Column(
                        children: [
                          Text(
                            'With photo'.tr,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.blue3
                                        : AppTheme.white15
                                    : Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.white1
                                        : AppTheme.white15),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: deviceWidth * 0.2,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.blue2
                                        : Colors.transparent
                                    : Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            1
                                        ? AppTheme.blue2
                                        : Colors.transparent),
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<MarketPlacePageProvider>(context,
                                listen: false)
                            .updateProductCommentsTab(1);
                      }),
                  GestureDetector(
                      child: Column(
                        children: [
                          Text(
                            'Latest'.tr,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.blue3
                                        : AppTheme.white15
                                    : Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.white1
                                        : AppTheme.white15),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: deviceWidth * 0.2,
                            height: 1,
                            decoration: BoxDecoration(
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.blue2
                                        : Colors.transparent
                                    : Provider.of<MarketPlacePageProvider>(
                                                    context)
                                                .productCommentsTab ==
                                            2
                                        ? AppTheme.blue2
                                        : Colors.transparent),
                          ),
                        ],
                      ),
                      onTap: () {
                        Provider.of<MarketPlacePageProvider>(context,
                                listen: false)
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
            Provider.of<MarketPlacePageProvider>(context).productCommentsTab ==
                    0
                ? FutureBuilder(
                    future: DummyService().getCustomerCommentsList(),
                    builder: (context, data) {
                      if (data.hasData) {
                        var items =
                            data.data as List<CustomerCommentDummyModel>;

                        return ListView.separated(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: items.length,
                            padding: const EdgeInsets.all(0),
                            separatorBuilder: (context, index) {
                              return Container(
                                  height: 1,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.white25
                                      : AppTheme.black21);
                            },
                            itemBuilder: ((context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 14, 16, 16),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              items[index].name.replaceRange(
                                                  1,
                                                  items[index].name.length - 1,
                                                  "*" *
                                                      (items[index]
                                                              .name
                                                              .length -
                                                          2)),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black1
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                            const SizedBox(width: 9),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 6),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/icons/star-fill.png',
                                                    width: 9.84,
                                                    height: 9.84,
                                                    color: int.parse(
                                                                items[index]
                                                                    .rating) >
                                                            0
                                                        ? AppTheme.yellow1
                                                        : AppTheme.white26,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Image.asset(
                                                    'assets/icons/star-fill.png',
                                                    width: 9.84,
                                                    height: 9.84,
                                                    color: int.parse(
                                                                items[index]
                                                                    .rating) >
                                                            1
                                                        ? AppTheme.yellow1
                                                        : AppTheme.white26,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Image.asset(
                                                    'assets/icons/star-fill.png',
                                                    width: 9.84,
                                                    height: 9.84,
                                                    color: int.parse(
                                                                items[index]
                                                                    .rating) >
                                                            2
                                                        ? AppTheme.yellow1
                                                        : AppTheme.white26,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Image.asset(
                                                    'assets/icons/star-fill.png',
                                                    width: 9.84,
                                                    height: 9.84,
                                                    color: int.parse(
                                                                items[index]
                                                                    .rating) >
                                                            3
                                                        ? AppTheme.yellow1
                                                        : AppTheme.white26,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Image.asset(
                                                    'assets/icons/star-fill.png',
                                                    width: 9.84,
                                                    height: 9.84,
                                                    color: int.parse(
                                                                items[index]
                                                                    .rating) >
                                                            4
                                                        ? AppTheme.yellow1
                                                        : AppTheme.white26,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          items[index].date,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Container(
                                          width: 19,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                items[index].flagImgUrl,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          items[index].country,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (items[index].comment.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 7, 0),
                                        child: Text(
                                          items[index].comment,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white11,
                                          ),
                                        ),
                                      )
                                    else
                                      Container(),
                                    if (items[index].images.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 9, 0, 0),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          CustomGalleryWidget(
                                                        urlImages:
                                                            items[index].images,
                                                      ),
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      reverseTransitionDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      transitionsBuilder:
                                                          (_, a, __, c) =>
                                                              FadeTransition(
                                                                  opacity: a,
                                                                  child: c),
                                                    ));
                                              },
                                              child: Container(
                                                width: deviceWidth * 0.5 - 36,
                                                height: deviceWidth * 0.5 - 36,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            items[index]
                                                                .images[0]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 18),
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          CustomGalleryWidget(
                                                        urlImages:
                                                            items[index].images,
                                                      ),
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      reverseTransitionDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      transitionsBuilder:
                                                          (_, a, __, c) =>
                                                              FadeTransition(
                                                                  opacity: a,
                                                                  child: c),
                                                    ));
                                              },
                                              child: Container(
                                                width: deviceWidth * 0.5 - 36,
                                                height: deviceWidth * 0.5 - 36,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            items[index]
                                                                .images[1]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      Container(),
                                  ],
                                ),
                              );
                            }));
                      } else {
                        return SizedBox(
                          height: deviceWidth + 115,
                          child: Center(
                              child: CupertinoActivityIndicator(
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.black1
                                    : AppTheme.white1,
                            radius: 12,
                          )),
                        );
                      }
                    },
                  )
                : Provider.of<MarketPlacePageProvider>(context)
                            .productCommentsTab ==
                        1
                    ? Container()
                    : Container(),
            Container(
                height: 1,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white25
                    : AppTheme.black21),
            const SizedBox(height: 32),
            InkWell(
              onTap: () {},
              child: Text(
                'Show more'.tr,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.blue2
                          : AppTheme.white1,
                ),
              ),
            ),
            const SizedBox(height: 34),
          ],
        ), // CUSTOMERS COMMENTS PANEL
      ],
    );
  }
}
