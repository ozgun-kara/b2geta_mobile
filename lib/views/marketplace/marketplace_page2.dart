import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class MarketplacePage2 extends StatefulWidget {
  const MarketplacePage2({Key? key}) : super(key: key);

  @override
  State<MarketplacePage2> createState() => _MarketplacePage2State();
}

class _MarketplacePage2State extends State<MarketplacePage2> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    var themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 11,
            left: 13,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 13,
                ),
                child: Container(
                  height: 205,
                  width: deviceWidth,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/dummy_images/marketplace/marketplace_image1.png"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              const SizedBox(
                height: 14.0,
              ),
              SizedBox(
                height: 130,
                width: deviceWidth,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/dummy_images/marketplace/marketplace_image2.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 90,
                            height: 30,
                            child: Text(
                              'İnşaat Malzemeleri',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.2,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/dummy_images/marketplace/marketplace_image3.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 90,
                            height: 30,
                            child: Text(
                              'Mobilya ve Dekorasyon',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.2,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/dummy_images/marketplace/marketplace_image4.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 90,
                            height: 30,
                            child: Text(
                              'Otomotiv Yedek Parça',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.2,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/dummy_images/marketplace/marketplace_image5.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 90,
                            child: Text(
                              'Ham Madde',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                height: 1.2,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28.0,
              ),
              SizedBox(
                height: 15,
                width: deviceWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'En çok talep gören ürünler',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Row(
                        children: [
                          Text(
                            'Tümü',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue2 : AppTheme.white11,
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Image.asset(
                            "assets/icons/next.png",
                            width: 10,
                            height: 8,
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white11,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
