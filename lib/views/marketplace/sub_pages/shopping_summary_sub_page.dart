// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b2geta_mobile/models/orders/order_details_model.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_orders/company_orders_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_orders/profile_orders_sub_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/messages/messages_page.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';

import '../../../providers/user_provider.dart';

class ShoppingSummarySubPage extends StatefulWidget {
  const ShoppingSummarySubPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final String orderId;
  @override
  State<ShoppingSummarySubPage> createState() => _ShoppingSummarySubPageState();
}

class _ShoppingSummarySubPageState extends State<ShoppingSummarySubPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  OrderDetailsModel? _orderDetailsModel;
  @override
  void initState() {
    super.initState();
    getOrderDetails();
  }

  Future<void> getOrderDetails() async {
    OrderDetailsModel? orderDetailsModel =
        await OrderService().getOrderDetailCall(orderId: widget.orderId);
    if (orderDetailsModel != null) {
      _orderDetailsModel = orderDetailsModel;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    var user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white2
          : AppTheme.black7,
      appBar: AppBar(
        toolbarHeight: 68,
        backgroundColor:
            Provider.of<ThemeProvider>(context).themeMode == "light"
                ? AppTheme.white1
                : AppTheme.black5,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/back-2.png',
              width: 23,
              height: 17,
              color: AppTheme.white15,
            ),
            onPressed: () {
              context.read<NavigationPageProvider>().updateCurrentTabIndex(2);

              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const NavigationPage(),
                    transitionDuration: const Duration(milliseconds: 0),
                    reverseTransitionDuration: const Duration(milliseconds: 0),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ));
            },
          ),
        ),
        title: SizedBox(
            width: 103.74,
            height: 14.0,
            child: Provider.of<ThemeProvider>(context).themeMode == "light"
                ? Image.asset('assets/images/b2geta_logo_light.png')
                : Image.asset('assets/images/b2geta_logo_dark.png')),
        actions: [
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/search.png',
              width: 19,
              height: 19,
              color: AppTheme.white15,
            ),
            onPressed: () {
              Provider.of<NavigationPageProvider>(context, listen: false)
                  .updateSearchState();
            },
          ),
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/bell.png',
              width: 16.0,
              height: 18.0,
              color: AppTheme.white15,
            ),
            onPressed: () {},
          ),
          IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/message.png',
                width: 19.0,
                height: 16.0,
                color: AppTheme.white15,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const MessagesPage(),
                      transitionDuration: const Duration(milliseconds: 0),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 0),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ));
              }),
        ],
      ),
      body: _orderDetailsModel != null
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 63, 0, 84),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/icons/check-2.png',
                        width: 75.83,
                        height: 75.83,
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 37),
                        child: Text(
                          "Siparişleriniz firmalara iletildi!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: _orderDetailsModel!.products!.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: ((context, index) {
                          var product = _orderDetailsModel!.products![index];
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: Container(
                                  width: deviceWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(22)),
                                    border: Border.all(
                                      width: 1,
                                      color: Provider.of<ThemeProvider>(context)
                                                  .themeMode ==
                                              "light"
                                          ? AppTheme.white21
                                          : AppTheme.black15,
                                    ),
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white1
                                        : AppTheme.black15,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 0, 12),
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              product!.image != null
                                                  ? product.image!
                                                  : 'https://doraev.com/images/custom/product-images/nophoto.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        product.name ?? '',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Provider.of<ThemeProvider>(
                                                                          context)
                                                                      .themeMode ==
                                                                  "light"
                                                              ? AppTheme.black19
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '${'Quantity:'.tr} :',
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                fontFamily: AppTheme
                                                                    .appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: AppTheme
                                                                    .white15),
                                                          ),
                                                          Text(
                                                            product.quantity ??
                                                                '',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily: AppTheme
                                                                  .appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Provider.of<ThemeProvider>(
                                                                              context)
                                                                          .themeMode ==
                                                                      "light"
                                                                  ? AppTheme
                                                                      .black19
                                                                  : AppTheme
                                                                      .white1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Total Price'.tr,
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily: AppTheme
                                                                .appFontFamily,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppTheme
                                                                .white15),
                                                      ),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                              text: product
                                                                      .totalPrice ??
                                                                  '0.0 ',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily: AppTheme
                                                                    .appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: themeMode
                                                                    ? AppTheme
                                                                        .green3
                                                                    : AppTheme
                                                                        .green4,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: "₺",
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: themeMode
                                                                    ? AppTheme
                                                                        .green3
                                                                    : AppTheme
                                                                        .green4,
                                                              ),
                                                            )
                                                          ])),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                              text:
                                                                  '${'Price Per Piece'.tr} ${product.price ?? '0.0 '}',
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
                                                                        .white1,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: "₺",
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: themeMode
                                                                    ? AppTheme
                                                                        .blue3
                                                                    : AppTheme
                                                                        .white1,
                                                              ),
                                                            )
                                                          ])),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(60, 8, 60, 20),
                                  child: SizedBox()),
                            ],
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: MaterialButton(
                            minWidth: deviceWidth,
                            height: 52,
                            elevation: 0,
                            color: AppTheme.blue2,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              'My Orders'.tr,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        user.type.toString().toLowerCase() ==
                                                'company'
                                            ? const CompanyOrdersSubPage()
                                            : const ProfileOrdersSubPage(),
                                    transitionDuration:
                                        const Duration(milliseconds: 0),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 0),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  )).then((_) => setState(() {}));
                            }),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 52),
                        child: Text(
                          "Ödeme kargo takip ve diğer hususlar için hala sorularınız var ise rehber sayfamızı ziyaret edebilirsiniz.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.white15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ButtonTheme(
                          minWidth: deviceWidth,
                          height: 62,
                          child: MaterialButton(
                              elevation: 0,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.white2
                                  : AppTheme.black18,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(68)),
                                side: BorderSide(
                                    width: 1,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.white23
                                        : AppTheme.black18),
                              ),
                              child: Text(
                                "Sıkça Sorulan Sorular",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Provider.of<ThemeProvider>(context)
                                                .themeMode ==
                                            "light"
                                        ? AppTheme.blue2
                                        : AppTheme.white1),
                              ),
                              onPressed: () {}),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
