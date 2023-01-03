import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/providers/marketplace_provider.dart';

class ProductDetailFirstTabSubpage extends StatefulWidget {
  ProductDetailFirstTabSubpage({Key? key}) : super(key: key);

  @override
  State<ProductDetailFirstTabSubpage> createState() =>
      _ProductDetailFirstTabSubpageState();
}

class _ProductDetailFirstTabSubpageState
    extends State<ProductDetailFirstTabSubpage> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hızlı Detaylar",
          style: TextStyle(
            fontSize: 14,
            fontFamily: AppTheme.appFontFamily,
            fontWeight: FontWeight.w600,
            color: Provider.of<ThemeProvider>(context).themeMode == "light"
                ? AppTheme.blue3
                : AppTheme.white11,
          ),
        ),
        SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 25, 0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Özel kullanım:",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 22),
              Column(
                children: [
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Otel sandalye",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
