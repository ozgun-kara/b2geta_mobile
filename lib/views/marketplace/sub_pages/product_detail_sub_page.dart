import 'package:b2geta_mobile/models/products/product_detail_model.dart';
import 'package:b2geta_mobile/models/profile/company_profile_model.dart';
import 'package:b2geta_mobile/providers/basket_page_provider.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:b2geta_mobile/utils.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/messages/sub_pages/add_message_sub_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/marketplace_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_gallery_widget.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_first_tab_sub_page.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/product_detail_second_tab_sub_page.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';

class ProductDetailSubPage extends StatefulWidget {
  const ProductDetailSubPage({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final String productId;

  @override
  State<ProductDetailSubPage> createState() => _ProductDetailSubPageState();
}

class _ProductDetailSubPageState extends State<ProductDetailSubPage> {
  ScrollController scrollController = ScrollController();
  int rating = 4;

  late double deviceTopPadding;
  late double deviceBottomPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final ProductsServices _productsServices = ProductsServices();
  ProductDetailModel? product;

  final MemberServices _memberServices = MemberServices();
  CompanyProfileModel? companyProfileModel;

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    await _productsServices.getProductCall(
        productId: widget.productId, queryParameters: {}).then((value) {
      if (value != null) {
        setState(() {
          product = value;
          getProfile();
        });
      }
    });
  }

  getProfile() async {
    if (product != null) {
      await _memberServices
          .getCompanyProfileCall(userId: product!.accountId!)
          .then((value) {
        if (value != null) {
          companyProfileModel = value;
          setState(() {});
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceBottomPadding = MediaQuery.of(context).padding.bottom;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black7,
      appBar: const CustomAppBar(),
      body: product != null
          ? SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 96),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 1),
                    Container(
                      width: deviceWidth,
                      height: 32,
                      decoration: BoxDecoration(
                        color: themeMode ? AppTheme.white1 : AppTheme.black5,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 26,
                            color: Color.fromRGBO(41, 67, 214, 0.05),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        // child: Row(
                        //   children: [
                        //     Expanded(
                        //       child: Text(
                        //         "Mobilya ve Dekorasyon   -   Ofis Mobilyaları",
                        //         style: TextStyle(
                        //           fontSize: 11,
                        //           fontFamily: AppTheme.appFontFamily,
                        //           fontWeight: FontWeight.w600,
                        //           color: AppTheme.white15,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      CustomGalleryWidget(
                                    urlImages: (product!.images != null &&
                                            product!.images!.isNotEmpty)
                                        ? product!.images!
                                        : [],
                                  ),
                                  transitionDuration:
                                      const Duration(milliseconds: 0),
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 0),
                                  transitionsBuilder: (_, a, __, c) =>
                                      FadeTransition(opacity: a, child: c),
                                ));
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                width: deviceWidth,
                                height: 352,
                                child: Image.network(
                                  (product!.images != null &&
                                          product!.images!.isNotEmpty)
                                      ? product!.images![0]
                                      : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/image_not_found.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 11,
                                right: 10,
                                child: Container(
                                    width: 38,
                                    height: 38,
                                    decoration: BoxDecoration(
                                      color: AppTheme.black1.withOpacity(0.34),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/zoom-in.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ), // PRODUCT IMAGE
                        const SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  spacing: 11,
                                  runSpacing: 11,
                                  children: [
                                    SizedBox(
                                      width: 41,
                                      height: 41,
                                      child: MaterialButton(
                                          minWidth: 41,
                                          height: 41,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: Provider.of<MarketPlacePageProvider>(
                                                                context)
                                                            .productImageIndex ==
                                                        0
                                                    ? 2
                                                    : 1,
                                                color: Provider.of<MarketPlacePageProvider>(
                                                                context)
                                                            .productImageIndex ==
                                                        0
                                                    ? AppTheme.blue9
                                                    : AppTheme.white21),
                                          ),
                                          child: FittedBox(
                                            fit: BoxFit.none,
                                            child: SizedBox(
                                              width: 39,
                                              height: 39,
                                              child: Image.network(
                                                (product!.images != null &&
                                                        product!
                                                            .images!.isNotEmpty)
                                                    ? product!.images![0]
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
                                          ),
                                          onPressed: () {
                                            Provider.of<MarketPlacePageProvider>(
                                                    context,
                                                    listen: false)
                                                .updateProductImageIndex(0);
                                          }),
                                    ),
                                    //   SizedBox(
                                    //     width: 41,
                                    //     height: 41,
                                    //     child: MaterialButton(
                                    //         minWidth: 41,
                                    //         height: 41,
                                    //         elevation: 0,
                                    //         shape: RoundedRectangleBorder(
                                    //           side: BorderSide(
                                    //               width: Provider.of<MarketPlacePageProvider>(
                                    //                               context)
                                    //                           .productImageIndex ==
                                    //                       1
                                    //                   ? 2
                                    //                   : 1,
                                    //               color: Provider.of<MarketPlacePageProvider>(
                                    //                               context)
                                    //                           .productImageIndex ==
                                    //                       1
                                    //                   ? AppTheme.blue9
                                    //                   : AppTheme.white21),
                                    //         ),
                                    //         child: FittedBox(
                                    //           fit: BoxFit.none,
                                    //           child: Container(
                                    //             width: 39,
                                    //             height: 39,
                                    //             decoration: BoxDecoration(
                                    //               image: DecorationImage(
                                    //                 image:
                                    //                     NetworkImage(imgList[0]),
                                    //                 fit: BoxFit.cover,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         onPressed: () {
                                    //           // Provider.of<MarketPlacePageProvider>(
                                    //           //         context,
                                    //           //         listen: false)
                                    //           //     .updateProductImageIndex(1);
                                    //         }),
                                    //   ),
                                    //   SizedBox(
                                    //     width: 41,
                                    //     height: 41,
                                    //     child: MaterialButton(
                                    //         minWidth: 41,
                                    //         height: 41,
                                    //         elevation: 0,
                                    //         shape: RoundedRectangleBorder(
                                    //           side: BorderSide(
                                    //               width: Provider.of<MarketPlacePageProvider>(
                                    //                               context)
                                    //                           .productImageIndex ==
                                    //                       2
                                    //                   ? 2
                                    //                   : 1,
                                    //               color: Provider.of<MarketPlacePageProvider>(
                                    //                               context)
                                    //                           .productImageIndex ==
                                    //                       2
                                    //                   ? AppTheme.blue9
                                    //                   : AppTheme.white21),
                                    //         ),
                                    //         child: FittedBox(
                                    //           fit: BoxFit.none,
                                    //           child: Container(
                                    //             width: 39,
                                    //             height: 39,
                                    //             decoration: BoxDecoration(
                                    //               image: DecorationImage(
                                    //                 image:
                                    //                     NetworkImage(imgList[0]),
                                    //                 fit: BoxFit.cover,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         onPressed: () {
                                    //           // Provider.of<MarketPlacePageProvider>(
                                    //           //         context,
                                    //           //         listen: false)
                                    //           //     .updateProductImageIndex(2);
                                    //         }),
                                    //   ),
                                    //   SizedBox(
                                    //     width: 41,
                                    //     height: 41,
                                    //     child: MaterialButton(
                                    //         minWidth: 41,
                                    //         height: 41,
                                    //         elevation: 0,
                                    //         shape: RoundedRectangleBorder(
                                    //           side: BorderSide(
                                    //               width: Provider.of<MarketPlacePageProvider>(
                                    //                               context)
                                    //                           .productImageIndex ==
                                    //                       3
                                    //                   ? 2
                                    //                   : 1,
                                    //               color: Provider.of<MarketPlacePageProvider>(
                                    //                               context)
                                    //                           .productImageIndex ==
                                    //                       3
                                    //                   ? AppTheme.blue9
                                    //                   : AppTheme.white21),
                                    //         ),
                                    //         child: FittedBox(
                                    //           fit: BoxFit.none,
                                    //           child: Container(
                                    //             width: 39,
                                    //             height: 39,
                                    //             decoration: BoxDecoration(
                                    //               image: DecorationImage(
                                    //                 image:
                                    //                     NetworkImage(imgList[0]),
                                    //                 fit: BoxFit.cover,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //         onPressed: () {
                                    //           // Provider.of<MarketPlacePageProvider>(
                                    //           //         context,
                                    //           //         listen: false)
                                    //           //     .updateProductImageIndex(3);
                                    //         }),
                                    //   ),
                                  ],
                                ),
                              ), // PRODUCT IMAGES
                              const SizedBox(height: 19),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      product!.productName ?? '',
                                      style: TextStyle(
                                        fontSize: 17,
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
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/star-fill.png',
                                          width: 10,
                                          height: 10,
                                          color: rating > 0
                                              ? AppTheme.yellow1
                                              : AppTheme.white26,
                                        ),
                                        const SizedBox(width: 2),
                                        Image.asset(
                                          'assets/icons/star-fill.png',
                                          width: 10,
                                          height: 10,
                                          color: rating > 1
                                              ? AppTheme.yellow1
                                              : AppTheme.white26,
                                        ),
                                        const SizedBox(width: 2),
                                        Image.asset(
                                          'assets/icons/star-fill.png',
                                          width: 10,
                                          height: 10,
                                          color: rating > 2
                                              ? AppTheme.yellow1
                                              : AppTheme.white26,
                                        ),
                                        const SizedBox(width: 2),
                                        Image.asset(
                                          'assets/icons/star-fill.png',
                                          width: 10,
                                          height: 10,
                                          color: rating > 3
                                              ? AppTheme.yellow1
                                              : AppTheme.white26,
                                        ),
                                        const SizedBox(width: 2),
                                        Image.asset(
                                          'assets/icons/star-fill.png',
                                          width: 10,
                                          height: 10,
                                          color: rating > 4
                                              ? AppTheme.yellow1
                                              : AppTheme.white26,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '6 ${'Reviews'.tr}   -   8 ${'Receivers'.tr}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 11),
                              Container(
                                  height: 1,
                                  color: themeMode
                                      ? AppTheme.white29
                                      : AppTheme.black21),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 15,
                                runSpacing: 13,
                                children: [
                                  SizedBox(
                                    width: deviceWidth * 0.5 - 17.5,
                                    height: 39,
                                    child: MaterialButton(
                                        minWidth: deviceWidth * 0.5 - 17.5,
                                        height: 39,
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                        ),
                                        color:
                                            Provider.of<MarketPlacePageProvider>(
                                                            context)
                                                        .productCountIndex ==
                                                    0
                                                ? AppTheme.blue2
                                                : themeMode
                                                    ? AppTheme.white31
                                                    : AppTheme.black18,
                                        // padding: const EdgeInsets.all(7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "50 - 199 ${'Piece-1'.tr}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productCountIndex ==
                                                          0
                                                      ? AppTheme.white30
                                                      : AppTheme.white15,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              product!.price ?? '0',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Provider.of<MarketPlacePageProvider>(
                                                                context)
                                                            .productCountIndex ==
                                                        0
                                                    ? AppTheme.white1
                                                    : themeMode
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Provider.of<MarketPlacePageProvider>(
                                                  context,
                                                  listen: false)
                                              .updateProductCountIndex(0);
                                        }),
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.5 - 17.5,
                                    height: 39,
                                    child: MaterialButton(
                                        minWidth: deviceWidth * 0.5 - 17.5,
                                        height: 39,
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                        ),
                                        color:
                                            Provider.of<MarketPlacePageProvider>(
                                                            context)
                                                        .productCountIndex ==
                                                    1
                                                ? AppTheme.blue2
                                                : themeMode
                                                    ? AppTheme.white31
                                                    : AppTheme.black18,
                                        // padding: const EdgeInsets.all(7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "200 - 499 ${'Piece-1'.tr}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productCountIndex ==
                                                          1
                                                      ? AppTheme.white30
                                                      : AppTheme.white15,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "89,05",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: Provider.of<MarketPlacePageProvider>(
                                                                context)
                                                            .productCountIndex ==
                                                        1
                                                    ? AppTheme.white1
                                                    : themeMode
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Provider.of<MarketPlacePageProvider>(
                                                  context,
                                                  listen: false)
                                              .updateProductCountIndex(1);
                                        }),
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.5 - 17.5,
                                    height: 39,
                                    child: MaterialButton(
                                        minWidth: deviceWidth * 0.5 - 17.5,
                                        height: 39,
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                        ),
                                        color:
                                            Provider.of<MarketPlacePageProvider>(
                                                            context)
                                                        .productCountIndex ==
                                                    2
                                                ? AppTheme.blue2
                                                : themeMode
                                                    ? AppTheme.white31
                                                    : AppTheme.black18,
                                        // padding: const EdgeInsets.all(7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                "500 - 999 ${'Piece-1'.tr}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productCountIndex ==
                                                          2
                                                      ? AppTheme.white30
                                                      : AppTheme.white15,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "83,11",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: Provider.of<MarketPlacePageProvider>(
                                                                context)
                                                            .productCountIndex ==
                                                        2
                                                    ? AppTheme.white1
                                                    : themeMode
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Provider.of<MarketPlacePageProvider>(
                                                  context,
                                                  listen: false)
                                              .updateProductCountIndex(2);
                                        }),
                                  ),
                                  SizedBox(
                                    width: deviceWidth * 0.5 - 17.5,
                                    height: 39,
                                    child: MaterialButton(
                                        minWidth: deviceWidth * 0.5 - 17.5,
                                        height: 39,
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                        ),
                                        color:
                                            Provider.of<MarketPlacePageProvider>(
                                                            context)
                                                        .productCountIndex ==
                                                    3
                                                ? AppTheme.blue2
                                                : themeMode
                                                    ? AppTheme.white31
                                                    : AppTheme.black18,
                                        // padding: const EdgeInsets.all(7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                ">= 1000 ${'Piece-1'.tr}",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w500,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productCountIndex ==
                                                          3
                                                      ? AppTheme.white30
                                                      : AppTheme.white15,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "79,15",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: Provider.of<MarketPlacePageProvider>(
                                                                context)
                                                            .productCountIndex ==
                                                        3
                                                    ? AppTheme.white1
                                                    : themeMode
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          Provider.of<MarketPlacePageProvider>(
                                                  context,
                                                  listen: false)
                                              .updateProductCountIndex(3);
                                        }),
                                  ),
                                ],
                              ), // PRODUCT COUNT
                              const SizedBox(height: 17),
                              Container(
                                  height: 1,
                                  color: themeMode
                                      ? AppTheme.white29
                                      : AppTheme.black21),
                              const SizedBox(height: 24),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Dimension'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 9),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      spacing: 15,
                                      runSpacing: 14,
                                      children: [
                                        SizedBox(
                                          width: deviceWidth * 0.5 - 17.5,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth:
                                                  deviceWidth * 0.5 - 17.5,
                                              height: 117,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productDimensionIndex ==
                                                            0
                                                        ? themeMode
                                                            ? AppTheme.blue2
                                                            : AppTheme.blue6
                                                        : themeMode
                                                            ? AppTheme.white20
                                                            : AppTheme.black17),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              // color: AppTheme.white28,
                                              // padding: const EdgeInsets.all(7),
                                              child: Text(
                                                "30*29*55cm",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productDimensionIndex ==
                                                          0
                                                      ? themeMode
                                                          ? AppTheme.green3
                                                          : AppTheme.green4
                                                      : themeMode
                                                          ? AppTheme.blue3
                                                          : AppTheme.white11,
                                                ),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductDimensionIndex(
                                                        0);
                                              }),
                                        ),
                                        SizedBox(
                                          width: deviceWidth * 0.5 - 17.5,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth:
                                                  deviceWidth * 0.5 - 17.5,
                                              height: 117,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productDimensionIndex ==
                                                            1
                                                        ? themeMode
                                                            ? AppTheme.blue2
                                                            : AppTheme.blue6
                                                        : themeMode
                                                            ? AppTheme.white20
                                                            : AppTheme.black17),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              // color: AppTheme.white28,
                                              // padding: const EdgeInsets.all(7),
                                              child: Text(
                                                "30*29*55cm",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productDimensionIndex ==
                                                          1
                                                      ? themeMode
                                                          ? AppTheme.green3
                                                          : AppTheme.green4
                                                      : themeMode
                                                          ? AppTheme.blue3
                                                          : AppTheme.white11,
                                                ),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductDimensionIndex(
                                                        1);
                                              }),
                                        ),
                                        SizedBox(
                                          width: deviceWidth * 0.5 - 17.5,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth:
                                                  deviceWidth * 0.5 - 17.5,
                                              height: 117,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productDimensionIndex ==
                                                            2
                                                        ? themeMode
                                                            ? AppTheme.blue2
                                                            : AppTheme.blue6
                                                        : themeMode
                                                            ? AppTheme.white20
                                                            : AppTheme.black17),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              // color: AppTheme.white28,
                                              // padding: const EdgeInsets.all(7),
                                              child: Text(
                                                "30*29*55cm",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: Provider.of<MarketPlacePageProvider>(
                                                                  context)
                                                              .productDimensionIndex ==
                                                          2
                                                      ? themeMode
                                                          ? AppTheme.green3
                                                          : AppTheme.green4
                                                      : themeMode
                                                          ? AppTheme.blue3
                                                          : AppTheme.white11,
                                                ),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductDimensionIndex(
                                                        2);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ), // PRODUCT DIMENSION
                              const SizedBox(height: 23),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Color'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 9),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Wrap(
                                      spacing: 10,
                                      runSpacing: 10,
                                      children: [
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            0
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.blue8),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(0);
                                              }),
                                        ),
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            1
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.black1),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(1);
                                              }),
                                        ),
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            2
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.red1),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(2);
                                              }),
                                        ),
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            3
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.white1),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(3);
                                              }),
                                        ),
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            4
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.green5),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(4);
                                              }),
                                        ),
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            5
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.purple1),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(5);
                                              }),
                                        ),
                                        SizedBox(
                                          width: 38,
                                          height: 38,
                                          child: MaterialButton(
                                              minWidth: 38,
                                              height: 38,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Provider.of<MarketPlacePageProvider>(
                                                                    context)
                                                                .productColorIndex ==
                                                            6
                                                        ? AppTheme.blue2
                                                        : Colors.transparent),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(4)),
                                              ),
                                              color: AppTheme.white28,
                                              padding: const EdgeInsets.all(7),
                                              child: Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.yellow2),
                                              ),
                                              onPressed: () {
                                                Provider.of<MarketPlacePageProvider>(
                                                        context,
                                                        listen: false)
                                                    .updateProductColorIndex(6);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ), // PRODUCT COLOR
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Delivery Time-1'.tr,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Table(
                                    border: TableBorder.all(
                                        borderRadius: BorderRadius.circular(4),
                                        width: 1,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.white20
                                                : AppTheme.black17),
                                    columnWidths: const {
                                      0: FlexColumnWidth(7),
                                      1: FlexColumnWidth(5),
                                      2: FlexColumnWidth(6),
                                      3: FlexColumnWidth(18),
                                    },
                                    children: [
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            'Piece-1'.tr,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            "1-20",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            "21-60",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            "60+",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            'Day'.tr,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            "15",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            "20",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Text(
                                            'Delivery State-1'.tr,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: Provider.of<ThemeProvider>(
                                                              context)
                                                          .themeMode ==
                                                      "light"
                                                  ? AppTheme.white15
                                                  : AppTheme.white11,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  ),
                                ],
                              ), // DELIVERY TIME
                              const SizedBox(height: 11),
                              Container(
                                width: deviceWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 1,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white21
                                        : AppTheme.black18,
                                  ),
                                ),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: deviceWidth,
                                          height: 70,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.white1
                                              : AppTheme.black18,
                                          child: Center(
                                            child: Text(
                                              'Supplier'.tr,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.blue2
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: deviceWidth,
                                            height: 1,
                                            color: Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.white21
                                                : AppTheme.black18),
                                        Column(
                                          children: [
                                            const SizedBox(height: 48),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "9,2",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w800,
                                                    color: AppTheme.white15,
                                                  ),
                                                ),
                                                const SizedBox(width: 2),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4),
                                                  child: Image.asset(
                                                    'assets/icons/star.png',
                                                    width: 15,
                                                    height: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 6),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  companyProfileModel != null
                                                      ? companyProfileModel!
                                                              .name ??
                                                          ""
                                                      : "İteme İnşaat ve Tesisat",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        Provider.of<ThemeProvider>(
                                                                        context)
                                                                    .themeMode ==
                                                                "light"
                                                            ? AppTheme.blue3
                                                            : AppTheme.white1,
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/icons/check.png',
                                                  width: 23,
                                                  height: 23,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              "İstanbul, Türkiye",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.white15),
                                            ),
                                            const SizedBox(height: 24),
                                          ],
                                        ),
                                        Container(
                                            width: deviceWidth,
                                            height: 1,
                                            color: Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.white21
                                                : AppTheme.black18),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 30, 0, 24),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Seller Rating'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "9.2 / 10",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Response Time'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "<12saat",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Membership Period'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "2 yıl",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Total Trade'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "574",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Certificates'.tr,
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 12,
                                                            fontFamily: AppTheme
                                                                .appFontFamily,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Provider.of<ThemeProvider>(
                                                                            context)
                                                                        .themeMode ==
                                                                    "light"
                                                                ? AppTheme.blue3
                                                                : AppTheme
                                                                    .white1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 2),
                                                          child: Image.asset(
                                                            'assets/icons/circle_arrow.png',
                                                            width: 16,
                                                            height: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Timely Delivery'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "80.0%",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Employee'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "246",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 16),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Establishment'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 2),
                                                      Text(
                                                        "2014",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 24),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ButtonTheme(
                                                minWidth: 117,
                                                height: 39,
                                                child: MaterialButton(
                                                    color:
                                                        Provider.of<ThemeProvider>(
                                                                        context)
                                                                    .themeMode ==
                                                                "light"
                                                            ? AppTheme.white22
                                                            : AppTheme.black18,
                                                    elevation: 0,
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    child: Text(
                                                      'Company Profile'.tr,
                                                      style: TextStyle(
                                                        fontSize: 12,
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
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder: (_, __,
                                                                    ___) =>
                                                                CompanyProfilePage(
                                                                    userId:
                                                                        product!.userId ??
                                                                            ''),
                                                            transitionDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        0),
                                                            reverseTransitionDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        0),
                                                            transitionsBuilder: (_,
                                                                    a, __, c) =>
                                                                FadeTransition(
                                                                    opacity: a,
                                                                    child: c),
                                                          ));
                                                    }),
                                              ),
                                              ButtonTheme(
                                                minWidth: 117,
                                                height: 39,
                                                child: MaterialButton(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  5)),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.blue2
                                                              : AppTheme.blue5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 2),
                                                          child: Image.asset(
                                                            'assets/icons/bag.png',
                                                            width: 14,
                                                            height: 14,
                                                            color: Provider.of<ThemeProvider>(
                                                                            context)
                                                                        .themeMode ==
                                                                    "light"
                                                                ? AppTheme.blue2
                                                                : AppTheme
                                                                    .blue4,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 6),
                                                        Text(
                                                          'Store'.tr,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppTheme
                                                                .appFontFamily,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Provider.of<ThemeProvider>(
                                                                            context)
                                                                        .themeMode ==
                                                                    "light"
                                                                ? AppTheme.blue2
                                                                : AppTheme
                                                                    .blue4,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder: (_, __,
                                                                    ___) =>
                                                                CompanyProfilePage(
                                                                    userId:
                                                                        product!.userId ??
                                                                            ''),
                                                            transitionDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        0),
                                                            reverseTransitionDuration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        0),
                                                            transitionsBuilder: (_,
                                                                    a, __, c) =>
                                                                FadeTransition(
                                                                    opacity: a,
                                                                    child: c),
                                                          ));
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 60,
                                      child: Container(
                                        width: 55,
                                        height: 55,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color: AppTheme.white21),
                                        ),
                                        child: ClipOval(
                                          child: Image.network(
                                            (companyProfileModel != null)
                                                ? companyProfileModel!.logo ??
                                                    "https://s3.gifyu.com/images/dummy-logo-22408bfa4a3ddec34.png"
                                                : "https://s3.gifyu.com/images/dummy-logo-22408bfa4a3ddec34.png",
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/image_not_found.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 190,
                                      child: ButtonTheme(
                                        minWidth: double.minPositive,
                                        height: 22,
                                        child: MaterialButton(
                                            elevation: 0,
                                            color: AppTheme.blue2,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(36)),
                                            ),
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 2, 12, 0),
                                            child: Text(
                                              (companyProfileModel != null)
                                                  ? (companyProfileModel!
                                                              .followStatus ??
                                                          false)
                                                      ? 'UnFollow'.tr
                                                      : 'Follow'.tr
                                                  : 'Follow'.tr,
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.white1,
                                              ),
                                            ),
                                            onPressed: () async {}),
                                      ),
                                    ),
                                  ],
                                ),
                              ), // SUPPLIER INFORMATION
                              const SizedBox(height: 11),
                              Container(
                                width: deviceWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 1,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white1
                                        : AppTheme.black18,
                                  ),
                                ),
                                child: Container(
                                  width: deviceWidth,
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.white1
                                      : Colors.transparent,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 16, 10, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Product Details'.tr,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight: FontWeight
                                                              .w600,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      0
                                                                  ? AppTheme
                                                                      .blue2
                                                                  : AppTheme
                                                                      .white24
                                                              : Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      0
                                                                  ? AppTheme
                                                                      .white1
                                                                  : AppTheme
                                                                      .white15),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Container(
                                                      width: deviceWidth * 0.4,
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      0
                                                                  ? AppTheme
                                                                      .blue2
                                                                  : Colors
                                                                      .transparent
                                                              : Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      0
                                                                  ? AppTheme
                                                                      .blue4
                                                                  : Colors
                                                                      .transparent),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  Provider.of<MarketPlacePageProvider>(
                                                          context,
                                                          listen: false)
                                                      .updateProductDetailTab(
                                                          0);
                                                }),
                                            GestureDetector(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${'Customer Comments'.tr} (8)',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight: FontWeight
                                                              .w600,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      1
                                                                  ? AppTheme
                                                                      .blue2
                                                                  : AppTheme
                                                                      .white24
                                                              : Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      1
                                                                  ? AppTheme
                                                                      .white1
                                                                  : AppTheme
                                                                      .white15),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Container(
                                                      width: deviceWidth * 0.4,
                                                      height: 1,
                                                      decoration: BoxDecoration(
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      1
                                                                  ? AppTheme
                                                                      .blue2
                                                                  : Colors
                                                                      .transparent
                                                              : Provider.of<MarketPlacePageProvider>(
                                                                              context)
                                                                          .productDetailTab ==
                                                                      1
                                                                  ? AppTheme
                                                                      .blue4
                                                                  : Colors
                                                                      .transparent),
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  Provider.of<MarketPlacePageProvider>(
                                                          context,
                                                          listen: false)
                                                      .updateProductDetailTab(
                                                          1);
                                                }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 1,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.white25
                                              : AppTheme.black21),
                                      const SizedBox(height: 16),
                                      Provider.of<MarketPlacePageProvider>(
                                                      context)
                                                  .productDetailTab ==
                                              0
                                          ? const ProductDetailFirstTabSubPage()
                                          : const ProductDetailSecondTabSubPage(),
                                    ],
                                  ),
                                ),
                              ), // PRODUCT DETAILS / CUSTOMERS COMMENTS
                              const SizedBox(height: 28),
                              Row(
                                children: [
                                  Text(
                                    'Other Products of the Company'.tr,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.blue2
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              FutureBuilder<List<ProductModel>>(
                                future: ProductsServices()
                                    .allProductsListAndSearchCall(
                                        queryParameters: {
                                      "offset": "0",
                                      "limit": '10000000',
                                    }),
                                builder: (context, data) {
                                  if (data.hasData) {
                                    var productList = data.data;

                                    if (productList!.isNotEmpty) {
                                      return ListView.separated(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 0, 12, 0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          ProductDetailSubPage(
                                                        productId: product.id!,
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
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(3)),
                                                  color: themeMode
                                                      ? AppTheme.white1
                                                      : AppTheme.black7,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurStyle:
                                                          BlurStyle.normal,
                                                      offset:
                                                          const Offset(0, -4),
                                                      blurRadius: 26,
                                                      spreadRadius: 0,
                                                      color: const Color(
                                                              0xFF2B3361)
                                                          .withOpacity(0.10),
                                                    ),
                                                  ],
                                                ),
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child:  Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 100,
                                                      height: 125,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(2),
                                                        ),
                                                      ),
                                                      child: Image.network(
                                                        product.images!
                                                                .isNotEmpty
                                                            ? product.images![
                                                                    0] ??
                                                            'https://doraev.com/images/custom/product-images/nophoto.png'
                                                            : 'assets/images/image_not_found.jpg',
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                                'assets/images/image_not_found.jpg',
                                                                fit: BoxFit
                                                                    .cover),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                            product.name!.tr
                                                                .toString(),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              fontFamily: AppTheme
                                                                  .appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: themeMode
                                                                  ? AppTheme
                                                                      .blue3
                                                                  : AppTheme
                                                                      .white11,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 8,
                                                        ),
                                                        RichText(
                                                            text: TextSpan(
                                                                children: [
                                                              TextSpan(
                                                                text:
                                                                    "${product.price} ",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontFamily:
                                                                      AppTheme
                                                                          .appFontFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: themeMode
                                                                      ? AppTheme
                                                                          .blue2
                                                                      : AppTheme
                                                                          .white1,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: product
                                                                    .currency,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: themeMode
                                                                      ? AppTheme
                                                                          .blue2
                                                                      : AppTheme
                                                                          .white1,
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
                                                            fontFamily: AppTheme
                                                                .appFontFamily,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppTheme
                                                                .white15,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              product.seller!
                                                                      .name ??
                                                                  '',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                fontFamily: AppTheme
                                                                    .appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: themeMode
                                                                    ? AppTheme
                                                                        .blue3
                                                                    : AppTheme
                                                                        .white11,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        SizedBox(
                                                          height: 24,
                                                          child: ButtonTheme(
                                                            // minWidth: deviceWidth,
                                                            height: 22,

                                                            child:
                                                                MaterialButton(
                                                                    elevation:
                                                                        0,
                                                                    color: Colors
                                                                        .transparent,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      side: BorderSide(
                                                                          width:
                                                                              1,
                                                                          color:
                                                                              AppTheme.white19),
                                                                      borderRadius: const BorderRadius
                                                                              .all(
                                                                          Radius.circular(
                                                                              36)),
                                                                    ),
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            3.5),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Image.asset(
                                                                            'assets/icons/comment.png',
                                                                            width:
                                                                                12.5,
                                                                            height:
                                                                                12.5,
                                                                            color:
                                                                                AppTheme.black16),
                                                                        const SizedBox(
                                                                            width:
                                                                                3.5),
                                                                        Text(
                                                                          'Contact to Supplier'
                                                                              .tr,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                10,
                                                                            fontFamily:
                                                                                AppTheme.appFontFamily,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            color: themeMode
                                                                                ? AppTheme.blue2
                                                                                : AppTheme.white1,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      Navigator.push(
                                                                          context,
                                                                          PageRouteBuilder(
                                                                            pageBuilder: (_, __, ___) =>
                                                                                AddMessageSubPage(
                                                                              toId: product.accountId!,
                                                                              fromId: Provider.of<UserProvider>(context, listen: false).getUser.id!,
                                                                            ),
                                                                            transitionDuration:
                                                                                const Duration(milliseconds: 0),
                                                                            reverseTransitionDuration:
                                                                                const Duration(milliseconds: 0),
                                                                            transitionsBuilder: (_, a, __, c) =>
                                                                                FadeTransition(opacity: a, child: c),
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
                                        color: themeMode
                                            ? AppTheme.black1
                                            : AppTheme.white1,
                                        radius: 12,
                                      )),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(
              child: Center(
                  child: CupertinoActivityIndicator(
                color: Provider.of<ThemeProvider>(context).themeMode == "light"
                    ? AppTheme.black1
                    : AppTheme.white1,
                radius: 12,
              )),
            ),
      bottomNavigationBar: product != null
          ? AnimatedBuilder(
              animation: scrollController,
              builder: (context, child) {
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: scrollController.hasClients
                        ? scrollController.position.userScrollDirection ==
                                ScrollDirection.reverse
                            ? 0
                            : 60+deviceBottomPadding
                        : 60+deviceBottomPadding,
                    child: child);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  width: deviceWidth,
                  height: 60+deviceBottomPadding,
                  color: AppTheme.blue2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  '1 ${'Piece-1'.tr}',
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.white15,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "${product!.price} ${product!.currency}",
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.white1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            ButtonTheme(
                              minWidth: double.minPositive,
                              height: 41,
                              child: MaterialButton(
                                  elevation: 0,
                                  color: AppTheme.green2,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                  child: Text(
                                    'Add to Basket'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.white1),
                                  ),
                                  onPressed: () {
                                    BasketServices()
                                        .addProductCall(
                                            productId: widget.productId,
                                            quantity: '1')
                                        .then(
                                      (value) {
                                        showSnackbar(
                                            context: context,
                                            message: "Product cart added".tr);
                                        Provider.of<BasketPageProvider>(context,
                                                listen: false)
                                            .getAllBasket();
                                      },
                                    );
                                  }),
                            ),
                            const SizedBox(width: 8),
                            ButtonTheme(
                              minWidth: double.minPositive,
                              height: 41,
                              child: MaterialButton(
                                  elevation: 0,
                                  color: AppTheme.blue7,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                  onPressed: () {
                                    Provider.of<BasketPageProvider>(context,
                                            listen: false)
                                        .getAllBasket();

                                    context
                                        .read<NavigationPageProvider>()
                                        .updateCurrentTabIndex(2);

                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              const NavigationPage(),
                                          transitionDuration:
                                              const Duration(milliseconds: 0),
                                          reverseTransitionDuration:
                                              const Duration(milliseconds: 0),
                                          transitionsBuilder: (_, a, __, c) =>
                                              FadeTransition(
                                                  opacity: a, child: c),
                                        ));
                                  },
                                  child: Text(
                                    "Go To Basket".tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.white1),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
