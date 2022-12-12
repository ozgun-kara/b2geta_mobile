import 'package:b2geta_mobile/models/dummy/product_dummy_model.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:flutter/cupertino.dart';
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
          padding: EdgeInsets.fromLTRB(0, 0, 0, 14),
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white1,
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
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue3
                                  : AppTheme.white1,
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
              SizedBox(height: 11),
              Visibility(
                visible:
                    Provider.of<MarketPlacePageProvider>(context).filterSwitch
                        ? false
                        : true,
                child: FutureBuilder(
                  future: GeneralService().getProductList(),
                  builder: (context, data) {
                    if (data.hasData) {
                      var items = data.data as List<ProductDummyModel>;

                      return GridView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: items.length,
                        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 21,
                          mainAxisExtent: 304,
                        ),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: Column(
                                children: [
                                  Container(
                                    // width: 126,
                                    // height: 145,
                                    width: deviceWidth,
                                    height: 206,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          items[index].imgUrl ?? '',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(9),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].title ?? '',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white11,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        items[index].price ?? '',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w500,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue2
                                              : AppTheme.white1,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        items[index].subTitle ?? '',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      );
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
                ),
              ),
              Visibility(
                visible:
                    Provider.of<MarketPlacePageProvider>(context).filterSwitch
                        ? true
                        : false,
                child: FutureBuilder(
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
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white1
                                        : AppTheme.black7,
                                    boxShadow: [
                                      BoxShadow(
                                        blurStyle: BlurStyle.normal,
                                        offset: Offset(0, -4),
                                        blurRadius: 26,
                                        spreadRadius: 0,
                                        color:
                                            Color(0xFF2B3361).withOpacity(0.10),
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
                                              color: Provider.of<ThemeProvider>(
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
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue3
                                                          : AppTheme.white11,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                items[index].totalRate ?? '',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w800,
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
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 1,
                                                        color:
                                                            AppTheme.white19),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                36)),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 2, 10, 3.5),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                          'assets/icons/comment.png',
                                                          width: 12.5,
                                                          height: 12.5,
                                                          color:
                                                              AppTheme.black16),
                                                      SizedBox(width: 3.5),
                                                      Text(
                                                        "Tedarikçiye Ulaşın",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue2
                                                              : AppTheme.white1,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
