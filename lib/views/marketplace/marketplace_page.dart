import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/views/marketplace/models/banner_model.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_sub_page.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_list_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  ScrollController scrollController = ScrollController();
  List<ProductModel>? productList;

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();
    getProductList();
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          if (Provider.of<MarketPlacePageProvider>(context, listen: false)
              .isMoreData) {
            getProductList();
          }
        }
      },
    );
  }

  getProductList() async {
    Provider.of<MarketPlacePageProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    final BannerModel banner1 = BannerModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image1.png",
        height: 205,
        width: deviceWidth);
    final BannerModel banner2 = BannerModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image9.png",
        height: 150,
        width: deviceWidth);
    final BannerModel banner3 = BannerModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image13.png",
        height: 150,
        width: deviceWidth);
    final BannerModel banner4 = BannerModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image17.png",
        height: 150,
        width: deviceWidth);
    final BannerModel banner5 = BannerModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image21.png",
        height: 150,
        width: deviceWidth);
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: Consumer<MarketPlacePageProvider>(
        builder: (context, marketPlaceProvider, child) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 11,
                left: 13,
              ),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProductListSubPage(
                                productList: marketPlaceProvider.productList,
                                bannerItem: banner1,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      },
                      child: _bannerItem(bannerItem: banner1)),
                  //SPACE
                  const SizedBox(
                    height: 14.0,
                  ),
                  //CATEGORY LIST
                  SizedBox(
                    height: 130,
                    width: deviceWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      ProductListSubPage(
                                    productList:
                                        marketPlaceProvider.productList,
                                    productListName:
                                        'Construction Materials'.tr,
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          },
                          child: _categoryItem(
                              imageUrl:
                                  "assets/images/dummy_images/marketplace/marketplace_image2.png",
                              text: 'Construction Materials'.tr),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      ProductListSubPage(
                                    productList:
                                        marketPlaceProvider.productList,
                                    productListName:
                                        'Furniture and Decoration'.tr,
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          },
                          child: _categoryItem(
                              imageUrl:
                                  "assets/images/dummy_images/marketplace/marketplace_image3.png",
                              text: 'Furniture and Decoration'.tr),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      ProductListSubPage(
                                    productList:
                                        marketPlaceProvider.productList,
                                    productListName:
                                        'Automotive spare parts'.tr,
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          },
                          child: _categoryItem(
                              imageUrl:
                                  "assets/images/dummy_images/marketplace/marketplace_image4.png",
                              text: 'Automotive spare parts'.tr),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      ProductListSubPage(
                                    productList:
                                        marketPlaceProvider.productList,
                                    productListName: 'Raw materials'.tr,
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          },
                          child: _categoryItem(
                              imageUrl:
                                  "assets/images/dummy_images/marketplace/marketplace_image5.png",
                              text: 'Raw materials'.tr),
                        ),
                      ],
                    ),
                  ),
                  //SPACE
                  const SizedBox(
                    height: 28.0,
                  ),
                  //PRODUCT LIST
                  SizedBox(
                    height: 15,
                    width: deviceWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'The most demanded products'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            height: 1,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      ProductListSubPage(
                                    productList:
                                        marketPlaceProvider.productList,
                                    productListName:
                                        'The most demanded products'.tr,
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 13.0),
                            child: Row(
                              children: [
                                Text(
                                  "All".tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Image.asset(
                                  "assets/icons/next.png",
                                  width: 10,
                                  height: 8,
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white11,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23.0,
                  ),
                  SizedBox(
                    height: 222,
                    width: deviceWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image6.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image7.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image8.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                      ],
                    ),
                  ),
                  //SPACE
                  const SizedBox(
                    height: 23,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProductListSubPage(
                                productList: marketPlaceProvider.productList,
                                bannerItem: banner2,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      },
                      child: _bannerItem(bannerItem: banner2)),
                  //SPACE
                  const SizedBox(
                    height: 28.0,
                  ),
                  //PRODUCT LIST
                  SizedBox(
                    height: 15,
                    width: deviceWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Furniture and Decoration'.tr,
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        ProductListSubPage(
                                      productList:
                                          marketPlaceProvider.productList,
                                      productListName:
                                          'Furniture and Decoration'.tr,
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 0),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 0),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  'All'.tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Image.asset(
                                  "assets/icons/next.png",
                                  width: 10,
                                  height: 8,
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white11,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23.0,
                  ),
                  SizedBox(
                    height: 222,
                    width: deviceWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image10.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image11.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image12.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                      ],
                    ),
                  ),
                  //SPACE
                  const SizedBox(
                    height: 23,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProductListSubPage(
                                productList: marketPlaceProvider.productList,
                                bannerItem: banner3,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      },
                      child: _bannerItem(bannerItem: banner3)),
                  //SPACE
                  const SizedBox(
                    height: 28.0,
                  ),
                  //PRODUCT LIST
                  SizedBox(
                    height: 15,
                    width: deviceWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Popular Products from Istanbul'.tr,
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        ProductListSubPage(
                                      productList:
                                          marketPlaceProvider.productList,
                                      productListName:
                                          'Popular Products from Istanbul'.tr,
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 0),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 0),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  'All'.tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Image.asset(
                                  "assets/icons/next.png",
                                  width: 10,
                                  height: 8,
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white11,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23.0,
                  ),
                  SizedBox(
                    height: 222,
                    width: deviceWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image14.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image15.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image16.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                      ],
                    ),
                  ),
                  //SPACE
                  const SizedBox(
                    height: 23,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProductListSubPage(
                                productList: marketPlaceProvider.productList,
                                bannerItem: banner4,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      },
                      child: _bannerItem(bannerItem: banner4)),
                  //SPACE
                  const SizedBox(
                    height: 23.0,
                  ),
                  //PRODUCT LIST
                  SizedBox(
                    height: 15,
                    width: deviceWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Automotive spare parts'.tr,
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        ProductListSubPage(
                                      productList:
                                          marketPlaceProvider.productList,
                                      productListName:
                                          'Automotive spare parts'.tr,
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 0),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 0),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ));
                            },
                            child: Row(
                              children: [
                                Text(
                                  'All'.tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.3,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white11,
                                  ),
                                ),
                                const SizedBox(
                                  width: 9,
                                ),
                                Image.asset(
                                  "assets/icons/next.png",
                                  width: 10,
                                  height: 8,
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white11,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 23.0,
                  ),
                  SizedBox(
                    height: 222,
                    width: deviceWidth,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image18.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image19.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                        const SizedBox(
                          width: 15,
                        ),
                        _productItem(
                            productImageUrl:
                                "assets/images/dummy_images/marketplace/marketplace_image20.png",
                            productName:
                                'Karaca Keenover 10 Parça Bıçak Seti Xl',
                            productPrice: '128 - 290'),
                      ],
                    ),
                  ),
                  //SPACE
                  const SizedBox(
                    height: 23,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => ProductListSubPage(
                                productList: marketPlaceProvider.productList,
                                bannerItem: banner5,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 0),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 0),
                              transitionsBuilder: (_, a, __, c) =>
                                  FadeTransition(opacity: a, child: c),
                            ));
                      },
                      child: _bannerItem(bannerItem: banner5)),
                  //SPACE
                  const SizedBox(
                    height: 23.0,
                  ),
                  //PRODUCT LIST
                  Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                            width: deviceWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Newly Added Products'.tr,
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 13.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                ProductListSubPage(
                                              productList: marketPlaceProvider
                                                  .productList,
                                              productListName:
                                                  'Newly Added Products'.tr,
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
                                    child: Row(
                                      children: [
                                        Text(
                                          'All'.tr,
                                          style: TextStyle(
                                            fontSize: 15,
                                            height: 1.3,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w500,
                                            color: themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white11,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9,
                                        ),
                                        Image.asset(
                                          "assets/icons/next.png",
                                          width: 10,
                                          height: 8,
                                          color: themeMode
                                              ? AppTheme.blue2
                                              : AppTheme.white11,
                                        )
                                      ],
                                    ),
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
                      GridView.builder(
                        itemCount: marketPlaceProvider.productList.length,
                        padding: const EdgeInsets.only(right: 12),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 9.0,
                          mainAxisSpacing: 9.0,
                          mainAxisExtent: 275,
                        ),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var product = marketPlaceProvider.productList[index];
                          return GestureDetector(
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
                            child: _productItemNetwork(
                                productImageUrl: product.images!.isNotEmpty
                                    ? product.images![0].toString()
                                    : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                productName: product.name!.tr.toString(),
                                productPrice: product.price.toString()),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _productItem({
    required String productImageUrl,
    required String productName,
    required String productPrice,
    double? width,
    double? height,
  }) {
    return Column(
      children: [
        Container(
          width: width ?? 134,
          height: height ?? 155,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: AppTheme.white21),
              color: AppTheme.white1,
              image: DecorationImage(
                image: AssetImage(productImageUrl),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 14.0,
        ),
        SizedBox(
          width: 127,
          height: 30,
          child: Text(
            productName,
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode ? AppTheme.blue3 : AppTheme.white1,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 127,
          height: 15,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "$productPrice ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            ),
            TextSpan(
              text: "₺",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            )
          ])),
        ),
      ],
    );
  }

  Widget _productItemNetwork(
      {required String productImageUrl,
      required String productName,
      required String productPrice}) {
    return Column(
      children: [
        Container(
          width: 178,
          height: 206,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: AppTheme.white21),
              color: AppTheme.white1,
              image: DecorationImage(
                image: NetworkImage(productImageUrl),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 14.0,
        ),
        SizedBox(
          width: 127,
          height: 30,
          child: Text(
            productName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              height: 1.2,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode ? AppTheme.blue3 : AppTheme.white1,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          width: 127,
          height: 15,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "$productPrice ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w500,
                height: 1,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            ),
            TextSpan(
              text: "₺",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
              ),
            )
          ])),
        ),
      ],
    );
  }

  Widget _categoryItem({required String imageUrl, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
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
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                height: 1.2,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w500,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bannerItem({required BannerModel bannerItem}) {
    return Padding(
      padding: const EdgeInsets.only(
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
