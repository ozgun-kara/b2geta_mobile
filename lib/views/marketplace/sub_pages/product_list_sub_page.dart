import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/marketplace/models/banner_model.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_sub_page.dart';
import 'package:b2geta_mobile/views/messages/sub_pages/add_message_sub_page.dart';

class ProductListSubPage extends StatefulWidget {
  const ProductListSubPage({
    Key? key,
    required this.productList,
    this.productListName,
    this.bannerItem,
  }) : super(key: key);
  final List<ProductModel> productList;
  final String? productListName;
  final BannerModel? bannerItem;

  @override
  State<ProductListSubPage> createState() => _ProductListSubPageState();
}

class _ProductListSubPageState extends State<ProductListSubPage> {
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
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 96),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 1),
              widget.productListName != null
                  ? Column(
                      children: [
                        Container(
                          width: deviceWidth,
                          height: 32,
                          color: themeMode ? AppTheme.white1 : AppTheme.black5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.productListName ?? '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.white24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 14,
                    ),
              widget.bannerItem != null
                  ? _bannerItem(bannerItem: widget.bannerItem!)
                  : const SizedBox(),
              const SizedBox(height: 18),
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
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
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
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
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
                            color:
                                themeMode ? AppTheme.white4 : AppTheme.black15,
                          ),
                          padding: const EdgeInsets.all(5),
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
                                  Provider.of<MarketPlacePageProvider>(context,
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
                            color:
                                themeMode ? AppTheme.blue2 : AppTheme.white12,
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
                visible:
                    Provider.of<MarketPlacePageProvider>(context).filterSwitch
                        ? false
                        : true,
                child: (widget.productList.isNotEmpty)
                    ? GridView.builder(
                        controller: scrollController,
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: widget.productList.length,
                        padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 21,
                          mainAxisExtent: 304,
                        ),
                        itemBuilder: ((context, index) {
                          var product = widget.productList[index];

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
                                        FadeTransition(opacity: a, child: c),
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
                                      errorBuilder: (context, error,
                                              stackTrace) =>
                                          Image.asset(
                                              'assets/images/image_not_found.jpg',
                                              fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name!.tr ?? product.name!.en!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
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
                                          text: "${product.price.toString()} ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppTheme.appFontFamily,
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
                      )
                    : SizedBox(
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
                      ),
              ),
              Visibility(
                visible:
                    Provider.of<MarketPlacePageProvider>(context).filterSwitch
                        ? true
                        : false,
                child: (widget.productList.isNotEmpty)
                    ? ListView.separated(
                        controller: scrollController,
                        reverse: true,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: widget.productList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 8);
                        },
                        itemBuilder: ((context, index) {
                          var product = widget.productList[index];

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
                                            product.name!.tr ?? product.name!.en!,
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
                      )
                    : SizedBox(
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
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerItem({required BannerModel bannerItem}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Container(
        height: bannerItem.height,
        width: bannerItem.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(bannerItem.imageUrl),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
