import 'dart:ui';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/basket/basket_model.dart';
import 'package:b2geta_mobile/models/member/address_model.dart';
import 'package:b2geta_mobile/providers/basket_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:b2geta_mobile/services/member/member_addresses_services.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/marketplace/sub_pages/shopping_summary_sub_page.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_addresses/add_address_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;
  ScrollController scrollController = ScrollController();
  List<AddressModel> addressList = [];
  int? selectedAddressIndex = 0;
  String? selectedAddressId;

  @override
  void initState() {
    Provider.of<BasketPageProvider>(context, listen: false).getAllBasket();
    getAllAddress();
    super.initState();
  }

  Future<void> getAllAddress() async {
    await MemberAddressesServices().getAllCall(
        queryParameters: {"offset": "2", "limit": "1000000"}).then((value) {
      setState(() {
        addressList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<BasketPageProvider>(
      builder: (context, basketPageProvider, child) {
        return Scaffold(
          backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 1),
                _pagePathName(),
                _basketCount(),
                (basketPageProvider.basketList.isNotEmpty)
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: basketPageProvider.basketList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _cartItem(
                              basketPageProvider.basketList[index], index);
                        },
                      )
                    : SizedBox(
                        width: deviceWidth,
                        height: deviceHeight - 200,
                        child: Center(
                            child: Text(
                          'Empty Chart'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                themeMode ? AppTheme.black12 : AppTheme.white24,
                          ),
                        )),
                      ),
                (basketPageProvider.basketList.isNotEmpty)
                    ? Column(
                        children: [
                          _orderSummary(),
                          addressList.isNotEmpty
                              ? Column(
                                  children: [
                                    Container(
                                      width: deviceWidth,
                                      height: 47.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      decoration: BoxDecoration(
                                        color: themeMode
                                            ? AppTheme.white22
                                            : AppTheme.black18,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Address Choice'.tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w800,
                                            color: themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: themeMode
                                          ? AppTheme.white1
                                          : AppTheme.black7,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 11,
                                          ),
                                          SizedBox(
                                              width: deviceWidth,
                                              height: 200,
                                              child: ListView.separated(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                controller: scrollController,
                                                shrinkWrap: true,
                                                itemCount: addressList.length,
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return const SizedBox(
                                                      height: 10);
                                                },
                                                itemBuilder: ((context, index) {
                                                  var address =
                                                      addressList[index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 9),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: themeMode
                                                            ? AppTheme.white1
                                                            : AppTheme.black7,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    5)),
                                                        border: Border.all(
                                                          width: 1,
                                                          color: themeMode
                                                              ? AppTheme.white35
                                                              : AppTheme
                                                                  .black18,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                24, 21, 24, 21),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Name'
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppTheme.white15,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        address.name ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color: themeMode
                                                                              ? AppTheme.blue3
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              28),
                                                                      Text(
                                                                        'City'
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppTheme.white15,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        address.city!.name ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color: themeMode
                                                                              ? AppTheme.blue3
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Address'
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppTheme.white15,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        address.address ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color: themeMode
                                                                              ? AppTheme.blue3
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              28),
                                                                      Text(
                                                                        'Country'
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppTheme.white15,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        address.country!.name ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color: themeMode
                                                                              ? AppTheme.blue3
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'District'
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppTheme.white15,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        address.district!.name ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          color: themeMode
                                                                              ? AppTheme.blue3
                                                                              : AppTheme.white1,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                          height:
                                                                              28),
                                                                      Text(
                                                                        'Postal Code'
                                                                            .tr,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppTheme.white15,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        address.postalCode ??
                                                                            '',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppTheme.appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w400,
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
                                                            const SizedBox(
                                                                height: 16),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    height: 30,
                                                                    child: MaterialButton(
                                                                        height: 30,
                                                                        color: selectedAddressIndex == index ? AppTheme.green1 : AppTheme.blue2,
                                                                        shape: const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(8)),
                                                                        ),
                                                                        elevation: 0,
                                                                        child: Text(
                                                                          selectedAddressIndex == index
                                                                              ? 'Chosen'.tr
                                                                              : 'Choose'.tr,
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontFamily: AppTheme.appFontFamily,
                                                                              fontWeight: FontWeight.w700,
                                                                              color: AppTheme.white1),
                                                                        ),
                                                                        onPressed: () {
                                                                          selectedAddressIndex =
                                                                              index;
                                                                          selectedAddressId =
                                                                              address.id;
                                                                          setState(
                                                                              () {});
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
                                              )),
                                          const SizedBox(
                                            height: 22,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    Container(
                                      width: deviceWidth,
                                      height: 47.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      decoration: BoxDecoration(
                                        color: themeMode
                                            ? AppTheme.white22
                                            : AppTheme.black18,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Address Choice'.tr,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w800,
                                            color: themeMode
                                                ? AppTheme.blue2
                                                : AppTheme.white1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 9),
                                      child: SizedBox(
                                        height: 47,
                                        child: MaterialButton(
                                            height: 47,
                                            minWidth: deviceWidth,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5)),
                                            ),
                                            elevation: 0,
                                            child: Text(
                                              'Add an Address'.tr,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w600,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder: (_, __,
                                                                ___) =>
                                                            const AddAddressSubPage(
                                                                operation:
                                                                    'Add'),
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
                                                      ))
                                                  .then((_) => setState(() {}));
                                            }),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                  ],
                                ),
                          Container(
                            width: deviceWidth,
                            height: 47.0,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              color: themeMode
                                  ? AppTheme.white22
                                  : AppTheme.black18,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Agreement and Conditions'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w800,
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white1,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            color:
                                themeMode ? AppTheme.white1 : AppTheme.black7,
                            width: deviceWidth,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    left: 18,
                                    right: 21,
                                    bottom: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: themeMode
                                        ? AppTheme.white22
                                        : AppTheme.black18,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    'Agreement and Conditions Detail'.tr,
                                    style: TextStyle(
                                      fontSize: 11,
                                      height: 1.44,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: themeMode
                                          ? AppTheme.blue12
                                          : AppTheme.white37,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 53,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: Checkbox(
                                        activeColor: AppTheme.blue2,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      'I have read and I accept'.tr,
                                      style: TextStyle(
                                        fontSize: 12,
                                        height: 1,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white1,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 51,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 19),
                                  child: MaterialButton(
                                      minWidth: deviceWidth,
                                      height: 52,
                                      elevation: 0,
                                      color: AppTheme.green2,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      child: Text(
                                        'Confirm Basket'.tr,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.white1),
                                      ),
                                      onPressed: () {
                                        dialog(
                                            titleText:
                                                'Confirm Basket Dialog'.tr,
                                            buttonText: 'Confirm'.tr,
                                            buttonColor: AppTheme.green1,
                                            onPressed: () {
                                              if (selectedAddressId == null) {
                                                if (addressList.isNotEmpty) {
                                                  selectedAddressId =
                                                      addressList.first.id;
                                                  OrderService()
                                                      .createOrderCall(
                                                          requestBody: {
                                                        "shipping_address_id":
                                                            selectedAddressId!,
                                                        "billing_address_id":
                                                            selectedAddressId!,
                                                        "agreement": "1"
                                                      }).then((List? value) {
                                                    if (value != null) {
                                                      debugPrint(
                                                          "${value}veri");

                                                      Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder: (_, __,
                                                                    ___) =>
                                                                ShoppingSummarySubPage(
                                                                    companyInfoList:
                                                                        value),
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

                                                      BasketServices()
                                                          .emptyBasketCall();
                                                    }
                                                  });
                                                } else {
                                                  operationFailedDialog(
                                                      context);
                                                }
                                              } else {
                                                OrderService().createOrderCall(
                                                    requestBody: {
                                                      "shipping_address_id":
                                                          selectedAddressId!,
                                                      "billing_address_id":
                                                          selectedAddressId!,
                                                      "agreement": "1"
                                                    }).then((List? value) {
                                                  if (value != null) {
                                                    debugPrint("${value}veri");

                                                    Navigator.push(
                                                        context,
                                                        PageRouteBuilder(
                                                          pageBuilder: (_, __,
                                                                  ___) =>
                                                              ShoppingSummarySubPage(
                                                                  companyInfoList:
                                                                      value),
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

                                                    BasketServices()
                                                        .emptyBasketCall();
                                                  }
                                                });
                                              }
                                            });
                                      }),
                                ),
                                const SizedBox(height: 36)
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(height: 60)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _pagePathName() {
    return Container(
      width: deviceWidth,
      height: 32,
      color: themeMode ? AppTheme.white1 : AppTheme.black5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          children: [
            Text(
              'Basket Page Route'.tr,
              style: TextStyle(
                fontSize: 12,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w500,
                color: AppTheme.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _basketCount() {
    return Container(
      width: deviceWidth,
      height: 63.0,
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      decoration: BoxDecoration(
        color: AppTheme.blue2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 23.0,
            height: 21.0,
            child: Image.asset(
              'assets/icons/shopping_car.png',
              color: AppTheme.white1,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'My Basket'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.white1,
                ),
              ),
              TextSpan(
                text: ' (2)',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.white1,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _cartItem(BasketModel basket, int index) {
    return Consumer<BasketPageProvider>(
      builder: (context, basketPageProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //cart item title
            Container(
              width: deviceWidth,
              height: 47.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: themeMode ? AppTheme.white22 : AppTheme.black18,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Brand Name",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w800,
                    color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                  ),
                ),
              ),
            ),
            //cart item content
            Container(
              width: deviceWidth,
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //cart item content image
                      Container(
                        width: 82,
                        height: 82,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(basket.product!.image != null
                                ? basket.product!.image!
                                : 'https://doraev.com/images/custom/product-images/nophoto.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: AppTheme.white21),
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      //cart item content title
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              basket.product!.productName ?? 'Product Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Delivery Time-2'.tr,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Delivery State-2'.tr,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  //basket quantity change buttons
                  Container(
                    width: 133,
                    height: 33,
                    margin: const EdgeInsets.only(left: 96),
                    decoration: BoxDecoration(
                      color: themeMode ? AppTheme.white22 : AppTheme.black18,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30,
                          child: MaterialButton(
                              minWidth: 30,
                              height: 31,
                              elevation: 0,
                              color: int.parse(basket.quantity!) == 1
                                  ? themeMode
                                      ? AppTheme.white1.withOpacity(.5)
                                      : AppTheme.black7.withOpacity(.5)
                                  : themeMode
                                      ? AppTheme.white1
                                      : AppTheme.black7,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white15,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                var basketQuantity =
                                    int.parse(basket.quantity!);

                                if (basketQuantity > 1) {
                                  locator<BasketServices>()
                                      .updateProductInBasketCall(
                                          productId: basket.productId!,
                                          quantity:
                                              "${int.parse(basket.quantity!) - 1}")
                                      .then((value) {
                                    if (value) {
                                      basketPageProvider.getAllBasket();
                                    }
                                  });
                                }

                                setState(() {});
                              }),
                        ),
                        Center(
                          child: Text(
                            basket.quantity ?? '1',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                          child: MaterialButton(
                              minWidth: 30,
                              height: 31,
                              elevation: 0,
                              color:
                                  themeMode ? AppTheme.white1 : AppTheme.black7,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: themeMode
                                        ? AppTheme.blue2
                                        : AppTheme.white15,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                BasketServices()
                                    .updateProductInBasketCall(
                                        productId: basket.productId!,
                                        quantity:
                                            "${int.parse(basket.quantity!) + 1}")
                                    .then((value) {
                                  if (value) {
                                    basketPageProvider.getAllBasket();
                                  }
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  //delete button and price info
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 41.0),
                        child: GestureDetector(
                          onTap: () {
                            dialog(
                              titleText: 'Remove Dialog'.tr,
                              buttonText: 'Remove'.tr,
                              buttonColor: Colors.red.shade600,
                              onPressed: () {
                                locator<BasketServices>()
                                    .deleteProductInBasketCall(
                                        param1: basket.product!.id!)
                                    .then((bool value) {
                                  if (value) {
                                    basketPageProvider.getAllBasket();
                                    Navigator.pop(context);
                                  }
                                });
                              },
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: 19.0,
                                height: 19.0,
                                child: Image.asset(
                                  "assets/icons/delete.png",
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Remove'.tr,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w400,
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.white15),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: basket.product!.price ?? '0.0 ',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.green3
                                    : AppTheme.green4,
                              ),
                            ),
                            TextSpan(
                              text: "₺",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.green3
                                    : AppTheme.green4,
                              ),
                            )
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: '${'Price Per Piece'.tr} 8,5',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            ),
                            TextSpan(
                              text: "₺",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: themeMode
                                    ? AppTheme.blue3
                                    : AppTheme.white1,
                              ),
                            )
                          ])),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _orderSummary() {
    return Container(
        width: deviceWidth,
        color: themeMode ? AppTheme.white1 : AppTheme.black7,
        padding: const EdgeInsets.only(
          top: 15,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Price'.tr,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.white15),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: '3.298,94 ',
                        style: TextStyle(
                          fontSize: 32,
                          height: 1,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      ),
                      TextSpan(
                        text: "₺",
                        style: TextStyle(
                          fontSize: 32,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      )
                    ])),
                    const SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  void dialog(
      {required String titleText,
      required String buttonText,
      required buttonColor,
      required VoidCallback onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(4),
            backgroundColor: Colors.transparent,
            content: Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                  color: themeMode ? AppTheme.white1 : AppTheme.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          titleText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w500,
                            color:
                                themeMode ? AppTheme.black25 : AppTheme.white1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        height: 32,
                        child: MaterialButton(
                            elevation: 0,
                            color:
                                themeMode ? AppTheme.black16 : AppTheme.black18,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            child: Text(
                              'Close'.tr,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ButtonTheme(
                        height: 32,
                        child: MaterialButton(
                            elevation: 0,
                            color: buttonColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                            onPressed: onPressed,
                            child: Text(
                              buttonText,
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
        );
      },
    );
  }

  void operationFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(4),
              backgroundColor: Colors.transparent,
              content: Container(
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: themeMode ? AppTheme.white1 : AppTheme.black12,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        Expanded(
                          child: Text(
                            'Operation Failed Dialog'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: themeMode
                                  ? AppTheme.black25
                                  : AppTheme.white1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.error_outline_sharp,
                          size: 24,
                          color: themeMode ? AppTheme.black16 : AppTheme.white1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ButtonTheme(
                      height: 32,
                      child: MaterialButton(
                          elevation: 0,
                          color:
                              themeMode ? AppTheme.black16 : AppTheme.black18,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Text(
                            'Close'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.white1),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
