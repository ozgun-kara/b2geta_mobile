import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/views/marketplace/models/banner_model.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_sub_page.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_list_sub_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    Provider.of<MarketPlacePageProvider>(context, listen: false)
        .getMarketPlaceData();
  }

  getProductList() async {
    //Provider.of<MarketPlacePageProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    final SliderModel slider1 = SliderModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image1.png",
        height: 205,
        width: deviceWidth);
    final SliderModel slider2 = SliderModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image9.png",
        height: 150,
        width: deviceWidth);
    final SliderModel slider3 = SliderModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image13.png",
        height: 150,
        width: deviceWidth);
    final SliderModel slider4 = SliderModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image17.png",
        height: 150,
        width: deviceWidth);
    final SliderModel slider5 = SliderModel(
        imageUrl:
            "assets/images/dummy_images/marketplace/marketplace_image21.png",
        height: 150,
        width: deviceWidth);
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      body: Consumer<MarketPlacePageProvider>(
        builder: (context, marketPlaceProvider, child) {
          return marketPlaceProvider.marketPlaceModel != null
              ? SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 11,
                      left: 13,
                    ),
                    child: Column(
                      children: [
                        _sliderItem(sliderItem: slider1),
                        //SPACE
                        const SizedBox(
                          height: 14.0,
                        ),
                        //CATEGORY LIST
                        SizedBox(
                          height: 130,
                          width: deviceWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: marketPlaceProvider
                                .marketPlaceModel!.categories!.length,
                            itemBuilder: (context, index) {
                              var category = marketPlaceProvider
                                  .marketPlaceModel!.categories![index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            ProductListSubPage(
                                          productList: category.products!.data!,
                                          productListName:
                                              category.categoryName.toString(),
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
                                child: _categoryItem(
                                  imageUrl: category!.image ??
                                      "assets/images/dummy_images/marketplace/marketplace_image2.png",
                                  text: category.categoryName.toString(),
                                ),
                              );
                            },
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
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            ProductListSubPage(
                                          productList: marketPlaceProvider
                                                  .marketPlaceModel!
                                                  .mostDemandProducts!
                                                  .data ??
                                              [],
                                          productListName:
                                              'The most demanded products'.tr,
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
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: marketPlaceProvider.marketPlaceModel!
                                .mostDemandProducts!.data!.length,
                            itemBuilder: (context, index) {
                              var mostDemandProduct = marketPlaceProvider
                                  .marketPlaceModel!
                                  .mostDemandProducts!
                                  .data![index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                ProductDetailSubPage(
                                              productId: mostDemandProduct.id!
                                                  .toString(),
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
                                    child: _productItem(
                                      productImageUrl: mostDemandProduct!
                                          .image!.url
                                          .toString(),
                                      productName:
                                          mostDemandProduct.name.toString(),
                                      productPrice:
                                          mostDemandProduct.price.toString(),
                                      productCurrency:
                                          mostDemandProduct.currency.toString(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        //SPACE
                        const SizedBox(
                          height: 23,
                        ),
                        _sliderItem(sliderItem: slider2),
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
                                marketPlaceProvider.marketPlaceModel!
                                    .categories![1]!.categoryName
                                    .toString(),
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
                                                .marketPlaceModel!
                                                .categories![1]!
                                                .products!
                                                .data!,
                                            productListName: marketPlaceProvider
                                                .marketPlaceModel!
                                                .categories![1]!
                                                .categoryName,
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
                        SizedBox(
                          height: 222,
                          width: deviceWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: marketPlaceProvider.marketPlaceModel!
                                .categories![1]!.products!.data!.length,
                            itemBuilder: (context, index) {
                              var categoryProduct = marketPlaceProvider
                                  .marketPlaceModel!
                                  .categories![1]!
                                  .products!
                                  .data![index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                ProductDetailSubPage(
                                              productId: categoryProduct.id!
                                                  .toString(),
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
                                    child: _productItem(
                                        productImageUrl: categoryProduct!
                                            .image!.url
                                            .toString(),
                                        productName:
                                            categoryProduct.name.toString(),
                                        productPrice:
                                            categoryProduct.price.toString(),
                                        productCurrency: categoryProduct
                                            .currency
                                            .toString()),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        //SPACE
                        const SizedBox(
                          height: 23,
                        ),
                        _sliderItem(sliderItem: slider3),
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
                                'Popular Products'.tr,
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
                                                    .marketPlaceModel!
                                                    .popularProducts!
                                                    .data ??
                                                [],
                                            productListName:
                                                'Popular Products'.tr,
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
                        SizedBox(
                          height: 222,
                          width: deviceWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: marketPlaceProvider.marketPlaceModel!
                                .popularProducts!.data!.length,
                            itemBuilder: (context, index) {
                              var popularProduct = marketPlaceProvider
                                  .marketPlaceModel!
                                  .popularProducts!
                                  .data![index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                ProductDetailSubPage(
                                              productId:
                                                  popularProduct.id!.toString(),
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
                                    child: _productItem(
                                        productImageUrl: popularProduct!
                                            .image!.url
                                            .toString(),
                                        productName:
                                            popularProduct.name.toString(),
                                        productPrice:
                                            popularProduct.price.toString(),
                                        productCurrency:
                                            popularProduct.currency.toString()),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        //SPACE
                        const SizedBox(
                          height: 23,
                        ),
                        _sliderItem(sliderItem: slider4),
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
                                marketPlaceProvider.marketPlaceModel!
                                    .categories![2]!.categoryName!,
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
                                                .marketPlaceModel!
                                                .categories![2]!
                                                .products!
                                                .data!,
                                            productListName: marketPlaceProvider
                                                .marketPlaceModel!
                                                .categories![2]!
                                                .categoryName!,
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
                        SizedBox(
                          height: 222,
                          width: deviceWidth,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: marketPlaceProvider.marketPlaceModel!
                                .categories![2]!.products!.data!.length,
                            itemBuilder: (context, index) {
                              var categoryProduct = marketPlaceProvider
                                  .marketPlaceModel!
                                  .categories![1]!
                                  .products!
                                  .data![index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                ProductDetailSubPage(
                                              productId: categoryProduct.id!
                                                  .toString(),
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
                                    child: _productItem(
                                        productImageUrl: categoryProduct!
                                            .image!.url
                                            .toString(),
                                        productName:
                                            categoryProduct.name.toString(),
                                        productPrice:
                                            categoryProduct.price.toString(),
                                        productCurrency: categoryProduct
                                            .currency
                                            .toString()),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        //SPACE
                        const SizedBox(
                          height: 23,
                        ),
                        _sliderItem(sliderItem: slider5),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        padding:
                                            const EdgeInsets.only(right: 13.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (_, __, ___) =>
                                                      ProductListSubPage(
                                                    productList:
                                                        marketPlaceProvider
                                                                .marketPlaceModel!
                                                                .newProducts!
                                                                .data ??
                                                            [],
                                                    productListName:
                                                        'Newly Added Products'
                                                            .tr,
                                                  ),
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 0),
                                                  reverseTransitionDuration:
                                                      const Duration(
                                                          milliseconds: 0),
                                                  transitionsBuilder:
                                                      (_, a, __, c) =>
                                                          FadeTransition(
                                                              opacity: a,
                                                              child: c),
                                                ));
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                'All'.tr,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  height: 1.3,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
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
                              itemCount: marketPlaceProvider
                                  .marketPlaceModel!.newProducts!.data!.length,
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
                                var product = marketPlaceProvider
                                    .marketPlaceModel!
                                    .newProducts!
                                    .data![index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              ProductDetailSubPage(
                                            productId: product.id!.toString(),
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
                                  child: _productItemNetwork(
                                    productImageUrl: product!
                                            .image!.url!.isNotEmpty
                                        ? product.image!.url.toString()
                                        : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                    productName: product.name!.tr.toString(),
                                    productPrice: product.price.toString(),
                                    productCurrency:
                                        product.currency.toString(),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
        },
      ),
    );
  }

  Widget _productItem({
    required String productImageUrl,
    required String productName,
    required String productPrice,
    required String productCurrency,
    double? width,
    double? height,
  }) {
    return Column(
      children: [
        Container(
          width: width ?? 134,
          height: height ?? 155,
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: AppTheme.white21),
            color: AppTheme.white1,
          ),
          child: CachedNetworkImage(
            imageUrl: productImageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, error, stackTrace) => Image.asset(
                'assets/images/image_not_found.jpg',
                fit: BoxFit.cover),
          ),
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
              text: productCurrency,
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

  Widget _productItemNetwork({
    required String productImageUrl,
    required String productName,
    required String productPrice,
    required String productCurrency,
  }) {
    return Column(
      children: [
        Container(
          width: 178,
          height: 206,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: AppTheme.white21),
            color: AppTheme.white1,
          ),
          child: CachedNetworkImage(
            imageUrl: productImageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, error, stackTrace) => Image.asset(
                'assets/images/image_not_found.jpg',
                fit: BoxFit.cover),
          ),
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
              text: productCurrency,
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
                image: CachedNetworkImageProvider(
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

  Widget _sliderItem({required SliderModel sliderItem}) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Container(
        height: sliderItem.height,
        width: sliderItem.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(sliderItem.imageUrl),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
