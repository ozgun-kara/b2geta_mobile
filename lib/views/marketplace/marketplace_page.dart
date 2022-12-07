import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
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
          : AppTheme.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 55),
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
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 13, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sonuçlar',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.white1,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                          ),
                          TextSpan(
                            text: '(1247)',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 78,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white4
                                    : AppTheme.black15,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<MarketPlacePageProvider>(context,
                                          listen: false)
                                      .updateFilterSwitch(false);
                                },
                                child: Container(
                                  width: 32,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                      color:
                                          Provider.of<MarketPlacePageProvider>(
                                                          context)
                                                      .filterSwitch ==
                                                  false
                                              ? Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white1
                                                  : AppTheme.black4
                                              : Colors.transparent),
                                  padding: EdgeInsets.all(7),
                                  child: Center(
                                    child: Image.asset(
                                        'assets/icons/grid_1.png',
                                        width: 17.06,
                                        height: 17.06,
                                        color:
                                            Provider.of<MarketPlacePageProvider>(
                                                            context)
                                                        .filterSwitch ==
                                                    false
                                                ? Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? AppTheme.black8
                                                    : AppTheme.white17
                                                : AppTheme.black8),
                                  ),
                                ),
                              ),
                              SizedBox(width: 4),
                              InkWell(
                                onTap: () {
                                  Provider.of<MarketPlacePageProvider>(context,
                                          listen: false)
                                      .updateFilterSwitch(true);
                                },
                                child: Container(
                                  width: 32,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(11)),
                                      color:
                                          Provider.of<MarketPlacePageProvider>(
                                                          context)
                                                      .filterSwitch ==
                                                  true
                                              ? Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white1
                                                  : AppTheme.black4
                                              : Colors.transparent),
                                  padding: EdgeInsets.all(7),
                                  child: Center(
                                    child: Image.asset(
                                        'assets/icons/grid_2.png',
                                        width: 14.62,
                                        height: 13.38,
                                        color:
                                            Provider.of<MarketPlacePageProvider>(
                                                            context)
                                                        .filterSwitch ==
                                                    true
                                                ? Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? AppTheme.black8
                                                    : AppTheme.white17
                                                : AppTheme.black8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        IconButton(
                          splashRadius: 24,
                          icon: Image.asset(
                            'assets/icons/filter.png',
                            width: 24,
                            height: 24,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue2
                                    : AppTheme.white12,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
