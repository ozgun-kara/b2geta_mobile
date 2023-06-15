import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_sub_page.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MyAccountProductsSubPage extends StatefulWidget {
  const MyAccountProductsSubPage({Key? key}) : super(key: key);

  @override
  State<MyAccountProductsSubPage> createState() =>
      _MyAccountProductsSubPageState();
}

class _MyAccountProductsSubPageState extends State<MyAccountProductsSubPage> {
  ScrollController scrollController = ScrollController();

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

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Results'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w500,
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                ),
                              ),
                              const TextSpan(
                                text: ' ',
                              ),
                              TextSpan(
                                text: '(1247)',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: themeMode
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                color: themeMode
                                    ? AppTheme.white4
                                    : AppTheme.black15,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Provider.of<MarketPlacePageProvider>(
                                              context,
                                              listen: false)
                                          .updateFilterSwitch(false);
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(11)),
                                          color:
                                              Provider.of<MarketPlacePageProvider>(
                                                              context)
                                                          .filterSwitch ==
                                                      false
                                                  ? themeMode
                                                      ? AppTheme.white1
                                                      : AppTheme.black4
                                                  : Colors.transparent),
                                      padding: const EdgeInsets.all(7),
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
                                                    ? themeMode
                                                        ? AppTheme.black8
                                                        : AppTheme.white17
                                                    : themeMode
                                                        ? AppTheme.white18
                                                        : AppTheme.black8),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  InkWell(
                                    onTap: () {
                                      Provider.of<MarketPlacePageProvider>(
                                              context,
                                              listen: false)
                                          .updateFilterSwitch(true);
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(11)),
                                          color:
                                              Provider.of<MarketPlacePageProvider>(
                                                              context)
                                                          .filterSwitch ==
                                                      true
                                                  ? themeMode
                                                      ? AppTheme.white1
                                                      : AppTheme.black4
                                                  : Colors.transparent),
                                      padding: const EdgeInsets.all(7),
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
                                                    ? themeMode
                                                        ? AppTheme.black8
                                                        : AppTheme.white1
                                                    : themeMode
                                                        ? AppTheme.white18
                                                        : AppTheme.black8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            IconButton(
                              splashRadius: 24,
                              icon: Image.asset(
                                'assets/icons/filter.png',
                                width: 24,
                                height: 24,
                                color: themeMode
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
                  const SizedBox(height: 11),
                  Visibility(
                    visible: Provider.of<MarketPlacePageProvider>(context)
                            .filterSwitch
                        ? false
                        : true,
                    child: FutureBuilder<List<ProductModel>>(
                      future: ProductsServices()
                          .productsListAndSearchCall(queryParameters: {
                        "limit": '1000000',
                      }),
                      builder: (context, data) {
                        if (data.hasData) {
                          var productList = data.data;
                          if (productList!.isNotEmpty) {
                            return GridView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: productList.length,
                              padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 21,
                                mainAxisExtent: 304,
                              ),
                              itemBuilder: ((context, index) {
                                var product = productList[index];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              ProductDetailSubPage(
                                            productId: product.id!,
                                          ),
                                          transitionDuration:
                                              const Duration(milliseconds: 0),
                                          reverseTransitionDuration:
                                              const Duration(milliseconds: 0),
                                          transitionsBuilder: (_, a, __, c) =>
                                              FadeTransition(
                                                  opacity: a, child: c),
                                        ));
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent),
                                    child: Column(
                                      children: [
                                        Container(
                                          // width: 126,
                                          // height: 145,
                                          width: deviceWidth,
                                          height: 206,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(9),
                                            ),
                                          ),
                                          child: Image.network(
                                            product.images!.isNotEmpty
                                                ? product.images![0] ??
                                                    'https://doraev.com/images/custom/product-images/nophoto.png'
                                                : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/image_not_found.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name!.tr.toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white11,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                text:
                                                    "${product.price.toString()} ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color: themeMode
                                                      ? AppTheme.blue2
                                                      : AppTheme.white1,
                                                ),
                                              ),
                                              TextSpan(
                                                text: product.currency,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: themeMode
                                                      ? AppTheme.blue2
                                                      : AppTheme.white1,
                                                ),
                                              )
                                            ])),
                                            const SizedBox(height: 2),
                                            Text(
                                              "10 ${'Minimum Order'.tr}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
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
                              width: deviceWidth,
                              height: deviceHeight - 200,
                              child: Center(
                                  child: Text(
                                "Ürün bulunmamaktadır.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            );
                          }
                        } else {
                          return SizedBox(
                            height: deviceWidth + 115,
                            child: Center(
                                child: CupertinoActivityIndicator(
                              color:
                                  themeMode ? AppTheme.black1 : AppTheme.white1,
                              radius: 12,
                            )),
                          );
                        }
                      },
                    ),
                  ),
                  Visibility(
                    visible: Provider.of<MarketPlacePageProvider>(context)
                            .filterSwitch
                        ? true
                        : false,
                    child: FutureBuilder<List<ProductModel>>(
                      future: ProductsServices()
                          .productsListAndSearchCall(queryParameters: {
                        "limit": '10000000',
                      }),
                      builder: (context, data) {
                        if (data.hasData) {
                          var productList = data.data;

                          if (productList!.isNotEmpty) {
                            return ListView.separated(
                              controller: scrollController,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              itemCount: productList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(height: 8);
                              },
                              itemBuilder: ((context, index) {
                                var product = productList[index];

                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 0, 12, 0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                ProductDetailSubPage(
                                              productId: product.id!,
                                            ),
                                            transitionDuration:
                                                const Duration(milliseconds: 0),
                                            reverseTransitionDuration:
                                                const Duration(milliseconds: 0),
                                            transitionsBuilder: (_, a, __, c) =>
                                                FadeTransition(
                                                    opacity: a, child: c),
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(3)),
                                        color: themeMode
                                            ? AppTheme.white1
                                            : AppTheme.black7,
                                        boxShadow: [
                                          BoxShadow(
                                            blurStyle: BlurStyle.normal,
                                            offset: const Offset(0, -4),
                                            blurRadius: 26,
                                            spreadRadius: 0,
                                            color: const Color(0xFF2B3361)
                                                .withOpacity(0.10),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 126,
                                            height: 145,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(2),
                                              ),
                                            ),
                                            child: Image.network(
                                              product.images!.isNotEmpty
                                                  ? product.images![0] ??
                                                      'https://doraev.com/images/custom/product-images/nophoto.png'
                                                  : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/image_not_found.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: deviceWidth -
                                                    (24 + 16 + 126 + 10),
                                                child: Text(
                                                  product.name!.tr.toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w500,
                                                    color: themeMode
                                                        ? AppTheme.blue3
                                                        : AppTheme.white11,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                  text: "${product.price} ",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w500,
                                                    color: themeMode
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: product.currency,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: themeMode
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                                  ),
                                                ),
                                              ])),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "İstanbul, Türkiye",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.seller!.name ?? '',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: themeMode
                                                          ? AppTheme.blue3
                                                          : AppTheme.white11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          } else {
                            return SizedBox(
                              width: deviceWidth,
                              height: deviceHeight - 200,
                              child: Center(
                                  child: Text(
                                "Ürün bulunmamaktadır.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            );
                          }
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
                          // ); // SKELETON ANIMATION

                          return SizedBox(
                            height: deviceWidth + 115,
                            child: Center(
                                child: CupertinoActivityIndicator(
                              color:
                                  themeMode ? AppTheme.black1 : AppTheme.white1,
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
          );
        },
      ),
    );
  }
}
