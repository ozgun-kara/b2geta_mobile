import 'package:b2geta_mobile/models/product_dummy_model.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:skeleton_text/skeleton_text.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
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
                                                : Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? AppTheme.white18
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
                                                : Provider.of<ThemeProvider>(
                                                                context)
                                                            .themeMode ==
                                                        "light"
                                                    ? AppTheme.white18
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
              FutureBuilder(
                future: GeneralService().getProductList(),
                builder: (context, data) {
                  if (data.hasData) {
                    var items = data.data as List<ProductDummyModel>;

                    return ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white1
                                    : AppTheme.black7,
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
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
                                            Radius.circular(8),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 1,
                                                offset: Offset(0.0, 1.5))
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: 54,
                                    color: AppTheme.white1.withOpacity(0.2),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        items[index].totalRate ?? '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.white1),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }));
                  } else {
                    return ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SkeletonAnimation(
                                borderRadius: BorderRadius.circular(10.0),
                                shimmerDuration: 1000,
                                shimmerColor: index % 2 != 0
                                    ? Colors.grey
                                    : Colors.white54,
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromRGBO(225, 230, 250, 0.8),
                                    // color: Colors.grey[300]
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SkeletonAnimation(
                                    borderRadius: BorderRadius.circular(10.0),
                                    shimmerDuration: 1000,
                                    shimmerColor: index % 2 != 0
                                        ? Colors.grey
                                        : Colors.white54,
                                    child: Container(
                                      width: deviceWidth * 0.5,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        // color: Colors.grey[300]

                                        color:
                                            Color.fromRGBO(225, 230, 250, 0.8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  SkeletonAnimation(
                                    borderRadius: BorderRadius.circular(10.0),
                                    shimmerColor: index % 2 != 0
                                        ? Colors.grey
                                        : Colors.white54,
                                    child: Container(
                                      width: deviceWidth * 0.2,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        // color: Colors.grey[300]

                                        color:
                                            Color.fromRGBO(225, 230, 250, 0.8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ); // SEKELATON ANIMATION
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
