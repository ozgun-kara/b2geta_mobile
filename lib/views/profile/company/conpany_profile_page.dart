import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/company_profile_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyProfilPage extends StatefulWidget {
  const CompanyProfilPage({Key? key}) : super(key: key);

  @override
  State<CompanyProfilPage> createState() => _CompanyProfilPageState();
}

class _CompanyProfilPageState extends State<CompanyProfilPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    debugPrint("TEST");

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              color: themeMode ? AppTheme.white1 : AppTheme.black5,
              child: Column(
                children: [
                  Container(
                      width: deviceWidth,
                      height: 1,
                      color: themeMode ? AppTheme.white31 : AppTheme.black2),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 25, 16, 24),
                    child: Column(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 1, color: AppTheme.white21),
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://s3.gifyu.com/images/dummy-logo-22408bfa4a3ddec34.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                        Text(
                          "İteme İnşaat ve Tesisat",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "İstanbul, Türkiye",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.white15),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 22,
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
                                padding: EdgeInsets.fromLTRB(13, 2, 13, 0),
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
                  ),
                  Container(
                      width: deviceWidth,
                      height: 1,
                      color: themeMode ? AppTheme.white31 : AppTheme.black2),
                  Consumer<CompanyProfileProvider>(
                    builder: (context, provider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ButtonTheme(
                              height: 49,
                              child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Image.asset('assets/icons/post.png',
                                        width: 21,
                                        height: 21,
                                        color: provider.currentTabIndex == 0
                                            ? themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15),
                                  ),
                                  onPressed: () {
                                    provider.updateCurrentTabIndex(0);
                                  }),
                            ),
                          ),
                          Expanded(
                            child: ButtonTheme(
                              height: 49,
                              child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Image.asset(
                                        'assets/icons/case-play.png',
                                        width: 23,
                                        height: 22,
                                        color: provider.currentTabIndex == 1
                                            ? themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15),
                                  ),
                                  onPressed: () {
                                    provider.updateCurrentTabIndex(1);
                                  }),
                            ),
                          ),
                          Expanded(
                            child: ButtonTheme(
                              height: 49,
                              child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Image.asset(
                                        'assets/icons/shopping_car_arrow.png',
                                        width: 21,
                                        height: 21,
                                        color: provider.currentTabIndex == 2
                                            ? themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15),
                                  ),
                                  onPressed: () {
                                    provider.updateCurrentTabIndex(2);
                                  }),
                            ),
                          ),
                          Expanded(
                            child: ButtonTheme(
                              height: 49,
                              child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Image.asset('assets/icons/star2.png',
                                        width: 21,
                                        height: 20,
                                        color: provider.currentTabIndex == 3
                                            ? themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15),
                                  ),
                                  onPressed: () {
                                    provider.updateCurrentTabIndex(3);
                                  }),
                            ),
                          ),
                          Expanded(
                            child: ButtonTheme(
                              height: 49,
                              child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  elevation: 0,
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Image.asset('assets/icons/info.png',
                                        width: 21,
                                        height: 21,
                                        color: provider.currentTabIndex == 4
                                            ? themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1
                                            : AppTheme.white15),
                                  ),
                                  onPressed: () {
                                    provider.updateCurrentTabIndex(4);
                                  }),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Consumer<CompanyProfileProvider>(
              builder: (context, provider, child) {
                if (provider.currentTabIndex == 4) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(21, 19, 21, 36 + 60),
                    child: Text(
                      "Foshan Shiguang Furniture Co.,Ltd is located in Shunde District, Foshan City, which is a famous base of furniture manufacture and procurement.Our company speacializes in the development and production of wicker furniture.Items are fashionable, luxury, and high performance-to-price ratio, so it is popular in more than 30 countries and regions such as Europe, the United States, Africa, Southeast Asia and Russia.The company not only has a better management system, but also has a energetic, efficient and innovative R&D team. Base on 16 years of furniture production experience, the company has formed a standardized production process. It is in accordance with international stringent standards, including the selection of materials, cutting, grinding baking, testing and packaging. Each process has undergone rigorous testing, thus the products have been certified by SGS. Foshan Shiguang Furniture Co.,Ltd is located in Shunde District, Foshan City, which is a famous base of furniture manufacture and procurement.Our company speacializes in the development and production of wicker furniture.Items are fashionable, luxury, and high performance-to-price ratio, so it is popular in more than 30 countries and regions such as Europe, the United States, Africa, Southeast Asia and Russia.The company not only has a better management system, but also has a energetic, efficient and innovative R&D team. Base on 16 years of furniture production experience, the company has formed a standardized production process. It is in accordance with international stringent standards, including the selection of materials, cutting, grinding baking, testing and packaging. Each process has undergone rigorous testing, thus the products have been certified by SGS.",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white15,
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
