import 'package:b2geta_mobile/models/dummy_models/product_dummy_model.dart';
import 'package:b2geta_mobile/providers/marketplace_provider.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_first_tab_subpage.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_second_tab_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class ProductDetailSubpage extends StatefulWidget {
  const ProductDetailSubpage({Key? key}) : super(key: key);

  @override
  State<ProductDetailSubpage> createState() => _ProductDetailSubpageState();
}

class _ProductDetailSubpageState extends State<ProductDetailSubpage> {
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
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1),
              Container(
                width: deviceWidth,
                height: 32,
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.white1
                    : AppTheme.black5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Mobilya ve Dekorasyon   -   Ofiis Mobilyaları",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.white15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Teslimat süresi:",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.black2
                                    : AppTheme.white11,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Table(
                          border: TableBorder.all(
                              borderRadius: BorderRadius.circular(4),
                              width: 1,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.white20
                                  : AppTheme.black17),
                          columnWidths: {
                            0: FlexColumnWidth(7),
                            1: FlexColumnWidth(5),
                            2: FlexColumnWidth(6),
                            3: FlexColumnWidth(18),
                          },
                          children: [
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "Adet",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "1-20",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "21-60",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "60+",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "Gün",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "15",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "20",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "Müzakere Edilecek",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white15
                                        : AppTheme.white11,
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ],
                    ), // DELIVERY TIME
                    SizedBox(height: 11),
                    Container(
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 1,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.white21
                                  : AppTheme.black18,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: deviceWidth,
                                height: 70,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white1
                                    : AppTheme.black18,
                                child: Center(
                                  child: Text(
                                    "Tedarikçi",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  width: deviceWidth,
                                  height: 1,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.white21
                                      : AppTheme.black18),
                              Column(
                                children: [
                                  SizedBox(height: 48),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "9,2",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                      SizedBox(width: 2),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: Image.asset(
                                          'assets/icons/star.png',
                                          width: 15,
                                          height: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "İteme İnşaat ve Tesisat",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w700,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.black2
                                              : AppTheme.white1,
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/icons/check.png',
                                        width: 23,
                                        height: 23,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "İstanbul, Türkiye",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.white15),
                                  ),
                                  SizedBox(height: 24),
                                ],
                              ),
                              Container(
                                  width: deviceWidth,
                                  height: 1,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.white21
                                      : AppTheme.black18),
                              Padding(
                                padding: EdgeInsets.fromLTRB(60, 30, 60, 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mağaza puanı",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "9.2 / 10",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Yanıt Süresi",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "<12saat",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Üyelik süresi",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "2 yıl",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Toplam ticaret",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "574",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        InkWell(
                                          onTap: () {},
                                          child: Row(
                                            children: [
                                              Text(
                                                "Sertifikalar",
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue3
                                                          : AppTheme.white1,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 2),
                                                child: Image.asset(
                                                  'assets/icons/circle_arrow.png',
                                                  width: 16,
                                                  height: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Zamanında Teslim",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "80.0%",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Personel",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "246",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kuruluş",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "2014",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(60, 0, 60, 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ButtonTheme(
                                      // minWidth: double.minPositive,
                                      height: 39,
                                      child: MaterialButton(
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.white22
                                              : AppTheme.black18,
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(22, 0, 22, 0),
                                          child: Text(
                                            "Firma Profili",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.blue2
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                          onPressed: () {}),
                                    ),
                                    ButtonTheme(
                                      // minWidth: double.minPositive,
                                      height: 39,
                                      child: MaterialButton(
                                          color: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            side: BorderSide(
                                                width: 1,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.blue2
                                                        : AppTheme.blue5),
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(22, 0, 22, 0),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2),
                                                child: Image.asset(
                                                  'assets/icons/bag.png',
                                                  width: 14,
                                                  height: 14,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue2
                                                          : AppTheme.blue4,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                "Mağaza",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue2
                                                          : AppTheme.blue4,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 60,
                            child: Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: AppTheme.white21),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://s3.gifyu.com/images/dummy-logo-22408bfa4a3ddec34.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 190,
                            child: ButtonTheme(
                              minWidth: double.minPositive,
                              height: 22,
                              child: MaterialButton(
                                  elevation: 0,
                                  color: AppTheme.blue2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(36)),
                                  ),
                                  padding: EdgeInsets.fromLTRB(12, 2, 12, 0),
                                  child: Text(
                                    "Takip Et",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.white1,
                                    ),
                                  ),
                                  onPressed: () async {}),
                            ),
                          ),
                        ],
                      ),
                    ), // SUPPLIER INFORMATION
                    SizedBox(height: 11),
                    Container(
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          width: 1,
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.white1
                                  : AppTheme.black18,
                        ),
                      ),
                      child: Container(
                        width: deviceWidth,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white1
                            : Colors.transparent,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 16, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Ürün Detayları',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            0
                                                        ? AppTheme.blue2
                                                        : AppTheme.white24
                                                    : Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            0
                                                        ? AppTheme.white1
                                                        : AppTheme.white15),
                                          ),
                                          SizedBox(height: 16),
                                          Container(
                                            width: deviceWidth * 0.4,
                                            height: 1,
                                            decoration: BoxDecoration(
                                                color: Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            0
                                                        ? AppTheme.blue2
                                                        : Colors.transparent
                                                    : Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            0
                                                        ? AppTheme.blue4
                                                        : Colors.transparent),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Provider.of<MarketPlaceProvider>(
                                                context,
                                                listen: false)
                                            .updateProductDetailTab(0);
                                      }),
                                  GestureDetector(
                                      child: Column(
                                        children: [
                                          Text(
                                            'Alıcı Yorumları (8)',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            1
                                                        ? AppTheme.blue2
                                                        : AppTheme.white24
                                                    : Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            1
                                                        ? AppTheme.white1
                                                        : AppTheme.white15),
                                          ),
                                          SizedBox(height: 16),
                                          Container(
                                            width: deviceWidth * 0.4,
                                            height: 1,
                                            decoration: BoxDecoration(
                                                color: Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            1
                                                        ? AppTheme.blue2
                                                        : Colors.transparent
                                                    : Provider.of<MarketPlaceProvider>(
                                                                    context)
                                                                .productDetailTab ==
                                                            1
                                                        ? AppTheme.blue4
                                                        : Colors.transparent),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Provider.of<MarketPlaceProvider>(
                                                context,
                                                listen: false)
                                            .updateProductDetailTab(1);
                                      }),
                                ],
                              ),
                            ),
                            Container(
                                height: 1,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white25
                                    : AppTheme.black21),
                            SizedBox(height: 16),
                            Provider.of<MarketPlaceProvider>(context)
                                        .productDetailTab ==
                                    0
                                ? ProductDetailFirstTabSubpage()
                                : ProductDetailSecondTabSubpage(),
                          ],
                        ),
                      ),
                    ), // PRODUCT DETAILS / CUSTOMERS COMMENTS
                    SizedBox(height: 28),
                    Row(
                      children: [
                        Text(
                          "Firmanın Diğer Ürünleri",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue2
                                    : AppTheme.white1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    FutureBuilder(
                      future: DummyService().getProductList(),
                      builder: (context, data) {
                        if (data.hasData) {
                          var items = data.data as List<ProductDummyModel>;

                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3)),
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.white1
                                                : AppTheme.black22,
                                        boxShadow: [
                                          BoxShadow(
                                            blurStyle: BlurStyle.normal,
                                            offset: Offset(0, -4),
                                            blurRadius: 26,
                                            spreadRadius: 0,
                                            color: Color(0xFF2B3361)
                                                .withOpacity(0.10),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 126,
                                            height: 145,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  items[index].imgUrl ?? '',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(2),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: deviceWidth -
                                                    (24 + 16 + 126 + 10),
                                                height: 35,
                                                child: Text(
                                                  items[index].title ?? '',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        Provider.of<ThemeProvider>(
                                                                        context)
                                                                    .themeMode ==
                                                                "light"
                                                            ? AppTheme.blue3
                                                            : AppTheme.white11,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                items[index].price ?? '',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue2
                                                          : AppTheme.white1,
                                                ),
                                              ),
                                              Text(
                                                items[index].subTitle ?? '',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                items[index].province ?? '',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              SizedBox(height: 1),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    items[index].company ?? '',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue3
                                                          : AppTheme.white11,
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    items[index].totalRate ??
                                                        '',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: AppTheme.white15,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Image.asset(
                                                      'assets/icons/star.png',
                                                      width: 15,
                                                      height: 15),
                                                ],
                                              ),
                                              SizedBox(height: 2),
                                              SizedBox(
                                                height: 24,
                                                child: ButtonTheme(
                                                  // minWidth: deviceWidth,
                                                  height: 22,

                                                  child: MaterialButton(
                                                      elevation: 0,
                                                      color: Colors.transparent,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: AppTheme
                                                                .white19),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    36)),
                                                      ),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 2, 10, 3.5),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Image.asset(
                                                              'assets/icons/comment.png',
                                                              width: 12.5,
                                                              height: 12.5,
                                                              color: AppTheme
                                                                  .black16),
                                                          SizedBox(width: 3.5),
                                                          Text(
                                                            "Tedarikçiye Ulaşın",
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily: AppTheme
                                                                  .appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Provider.of<ThemeProvider>(
                                                                              context)
                                                                          .themeMode ==
                                                                      "light"
                                                                  ? AppTheme
                                                                      .blue2
                                                                  : AppTheme
                                                                      .white1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      onPressed: () async {}),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }));
                        } else {
                          // return ListView.builder(
                          //   controller: scrollController,
                          //   shrinkWrap: true,
                          //   itemCount: 10,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return Padding(
                          //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           SkeletonAnimation(
                          //             borderRadius: BorderRadius.circular(10.0),
                          //             shimmerDuration: 1000,
                          //             shimmerColor: index % 2 != 0
                          //                 ? Colors.grey
                          //                 : Colors.white54,
                          //             child: Container(
                          //               height: 60,
                          //               width: 60,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(5),
                          //                 color: Color.fromRGBO(225, 230, 250, 0.8),
                          //                 // color: Colors.grey[300]
                          //               ),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: 6,
                          //           ),
                          //           Column(
                          //             crossAxisAlignment: CrossAxisAlignment.start,
                          //             children: <Widget>[
                          //               SkeletonAnimation(
                          //                 borderRadius: BorderRadius.circular(10.0),
                          //                 shimmerDuration: 1000,
                          //                 shimmerColor: index % 2 != 0
                          //                     ? Colors.grey
                          //                     : Colors.white54,
                          //                 child: Container(
                          //                   width: deviceWidth * 0.5,
                          //                   height: 30,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(10.0),
                          //                     // color: Colors.grey[300]
                          //
                          //                     color:
                          //                         Color.fromRGBO(225, 230, 250, 0.8),
                          //                   ),
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: 6,
                          //               ),
                          //               SkeletonAnimation(
                          //                 borderRadius: BorderRadius.circular(10.0),
                          //                 shimmerColor: index % 2 != 0
                          //                     ? Colors.grey
                          //                     : Colors.white54,
                          //                 child: Container(
                          //                   width: deviceWidth * 0.2,
                          //                   height: 30,
                          //                   decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(10.0),
                          //                     // color: Colors.grey[300]
                          //
                          //                     color:
                          //                         Color.fromRGBO(225, 230, 250, 0.8),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // ); // SEKELATON ANIMATION

                          return SizedBox(
                            height: deviceWidth + 115,
                            child: Center(
                                child: CupertinoActivityIndicator(
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.black1
                                  : AppTheme.white1,
                              radius: 12,
                            )),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: scrollController.hasClients
                  ? scrollController.position.userScrollDirection ==
                          ScrollDirection.reverse
                      ? 0
                      : 120
                  : 120,
              child: child);
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: Container(
            width: deviceWidth,
            height: 60,
            color: AppTheme.blue2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 9, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "50 - 199 Adet",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.white15,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "98,94₺",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.white1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ButtonTheme(
                        minWidth: double.minPositive,
                        height: 41,
                        child: MaterialButton(
                            elevation: 0,
                            color: AppTheme.green2,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            child: Text(
                              "Sepete Ekle",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            ),
                            onPressed: () {}),
                      ),
                      SizedBox(width: 8),
                      ButtonTheme(
                        minWidth: double.minPositive,
                        height: 41,
                        child: MaterialButton(
                            elevation: 0,
                            color: AppTheme.blue7,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                            ),
                            child: Text(
                              "Satıcıya Sor",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
