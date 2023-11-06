// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_sub_page.dart';
import 'package:b2geta_mobile/views/messages/sub_pages/add_message_sub_page.dart';

class SearchPage extends StatefulWidget {
  final String searchKeyword;
  const SearchPage({
    Key? key,
    required this.searchKeyword,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  var deviceWidth;
  var deviceHeight;
  var deviceTopPadding;

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceTopPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: const CustomInnerAppBar(),
      body: _body(deviceTopPadding, context, themeMode, deviceWidth),
    );
  }

  Widget _body(double deviceTopPadding, BuildContext context, bool themeMode,
      double deviceWidth) {
    return Padding(
      padding: EdgeInsets.only(top: deviceTopPadding * .2),
      child: Column(
        children: [
          FutureBuilder<List<ProductModel>>(
            future: ProductsServices()
                .allProductsListAndSearchCall(queryParameters: {
              "offset": '0',
              "limit": '10000000',
              "keyword": widget.searchKeyword,
            }),
            builder: (context, data) {
              if (data.hasData) {
                var productList = data.data;

                if (productList!.isNotEmpty) {
                  return Column(
                    children: [
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
                                    text: '(' '${productList.length})',
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 11),
                      ListView.separated(
                        //  controller: scrollController,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: productList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        itemBuilder: ((context, index) {
                          var product = productList[index];

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
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
                                          FadeTransition(opacity: a, child: c),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 126,
                                      height: 145,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2),
                                        ),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: product.images!.isNotEmpty
                                            ? product.images![0].url ??
                                                'https://doraev.com/images/custom/product-images/nophoto.png'
                                            : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                        fit: BoxFit.cover,
                                        errorWidget: (context, error,
                                                stackTrace) =>
                                            Image.asset(
                                                'assets/images/image_not_found.jpg',
                                                fit: BoxFit.cover),
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
                                            product.name!.tr ??
                                                product.name!.en!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
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
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.seller!.name ?? '',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
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
                                                      color: AppTheme.white19),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(36)),
                                                ),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
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
                                                    const SizedBox(width: 3.5),
                                                    Text(
                                                      'Contact to Supplier'.tr,
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: AppTheme
                                                            .appFontFamily,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: themeMode
                                                            ? AppTheme.blue2
                                                            : AppTheme.white1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                onPressed: () async {
                                                  Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder: (_, __,
                                                                ___) =>
                                                            AddMessageSubPage(
                                                          toId: product
                                                              .accountId!,
                                                          fromId: Provider.of<
                                                                      UserProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .getUser
                                                              .id!,
                                                        ),
                                                        transitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    0),
                                                        reverseTransitionDuration:
                                                            const Duration(
                                                                milliseconds:
                                                                    0),
                                                        transitionsBuilder:
                                                            (_, a, __, c) =>
                                                                FadeTransition(
                                                                    opacity: a,
                                                                    child: c),
                                                      ));
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
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
                    color: themeMode ? AppTheme.black1 : AppTheme.white1,
                    radius: 12,
                  )),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
