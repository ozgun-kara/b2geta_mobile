import 'package:b2geta_mobile/models/orders/order_details_model.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class MenuOrdersDetailSubPage extends StatefulWidget {
  const MenuOrdersDetailSubPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  final String orderId;

  @override
  State<MenuOrdersDetailSubPage> createState() =>
      _MenuOrdersDetailSubPageState();
}

class _MenuOrdersDetailSubPageState extends State<MenuOrdersDetailSubPage> {
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

    return Scaffold(
        backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
        appBar: AppBar(
            toolbarHeight: 68,
            backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
            elevation: 0,
            leadingWidth: 125.74,
            leading: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: SizedBox(
                  width: 103.74,
                  height: 14.0,
                  child: themeMode
                      ? Image.asset('assets/images/b2geta_logo_light.png')
                      : Image.asset('assets/images/b2geta_logo_dark.png')),
            ),
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
                  if (themeMode) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setDarkMode();
                  } else {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .setLightMode();
                  }
                },
              ),
              const SizedBox(width: 4),
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
              const SizedBox(width: 4),
              IconButton(
                splashRadius: 24,
                icon: Image.asset(
                  'assets/icons/message.png',
                  width: 19.0,
                  height: 16.0,
                  color: AppTheme.white15,
                ),
                onPressed: () {},
              ),
            ]),
        body: _orderDetailsModel != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: deviceWidth,
                        height: 1,
                        color:
                            themeMode ? AppTheme.white32 : Colors.transparent),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: IconButton(
                            splashRadius: 24,
                            icon: Image.asset(
                              'assets/icons/back-2.png',
                              width: 14,
                              height: 12,
                              color: AppTheme.white15,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Text(
                          '${'Order Detail'.tr} #${_orderDetailsModel!.id}',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: themeMode ? AppTheme.white1 : AppTheme.black7,
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.normal,
                            offset: const Offset(0, -4),
                            blurRadius: 26,
                            spreadRadius: 0,
                            color: const Color(0xFF2B3361).withOpacity(0.10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(21, 21, 21, 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 82,
                                  height: 82,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/dummy_images/product_image1.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 1, color: AppTheme.white21),
                                  ),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: Text(
                                    'Karaca Keenover 10 Parça Bıçak Seti Xl',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: deviceWidth,
                              height: 1,
                              color: themeMode
                                  ? AppTheme.white21
                                  : AppTheme.black18),
                          const SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(21, 27, 21, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Date:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            _orderDetailsModel!.orderDate ?? '',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order Number:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            _orderDetailsModel!.id ?? '',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Product Number:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            '210477',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
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
                                const SizedBox(height: 18),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Seller:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            _orderDetailsModel!.seller!.name ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Quantity:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            '10.000',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w600,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Status:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          _orderDetailsModel!.status ==
                                                  "approved"
                                              ? Text(
                                                  'Approved'.tr,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w600,
                                                    color: themeMode
                                                        ? AppTheme.green6
                                                        : AppTheme.green7,
                                                  ),
                                                )
                                              : _orderDetailsModel!.status ==
                                                      "new"
                                                  ? Text(
                                                      'Evaluating'.tr,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily: AppTheme
                                                            .appFontFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: themeMode
                                                            ? AppTheme.blue3
                                                            : AppTheme.white1,
                                                      ),
                                                    )
                                                  : Text(
                                                      'Denied'.tr,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily: AppTheme
                                                            .appFontFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: themeMode
                                                            ? AppTheme.red2
                                                            : AppTheme.red3,
                                                      ),
                                                    )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 28),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Address:'.tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                        Text(
                                          _orderDetailsModel!.addresses!
                                                  .shipping!.address ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: themeMode
                                                ? AppTheme.blue3
                                                : AppTheme.white1,
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Total Price:'.tr,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 34,
                                          child: RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                              text: _orderDetailsModel!
                                                      .totalPrice ??
                                                  '',
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.green3,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "₺",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: AppTheme.green3,
                                              ),
                                            )
                                          ])),
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text: '${'Price Per Piece'.tr} ',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '8,5',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "₺",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: themeMode
                                                  ? AppTheme.blue3
                                                  : AppTheme.white1,
                                            ),
                                          )
                                        ])),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: deviceWidth,
                              height: 1,
                              color: themeMode
                                  ? AppTheme.white21
                                  : AppTheme.black18),
                          const SizedBox(height: 2),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 6, 4, 6),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 2),
                                          child: Image.asset(
                                              'assets/icons/message.png',
                                              width: 12,
                                              height: 10,
                                              color: AppTheme.white15),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Send Message'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: themeMode
                                                  ? AppTheme.blue2
                                                  : AppTheme.blue10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 22),
                                SizedBox(
                                  height: 35,
                                  child: MaterialButton(
                                    onPressed: () {},
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 2),
                                          child: Image.asset(
                                              'assets/icons/message.png',
                                              width: 12,
                                              height: 10,
                                              color: AppTheme.white15),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Start Dispute'.tr,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w700,
                                              color: themeMode
                                                  ? AppTheme.red2
                                                  : AppTheme.red3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FutureBuilder(
                    //   future: DummyService().getCompanyOrdersList(),
                    //   builder: (context, data) {
                    //     if (data.hasData) {
                    //       var productIdList = data.data;
                    //
                    //       return ListView.separated(
                    //         controller: scrollController,
                    //         shrinkWrap: true,
                    //         itemCount: productIdList!.length,
                    //         separatorBuilder: (BuildContext context, int index) {
                    //           return SizedBox(height: 8);
                    //         },
                    //         itemBuilder: ((context, index) {
                    //           var items = data.data as List<CompanyOrderDummyModel>;
                    //
                    //           return InkWell(
                    //             onTap: () {
                    //               // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailSubPage(productId: productIdList[index], productName: productList["title"].toString(), imageUrl: productList["imgUrl"].toString(),price: productList["price"].toString()),),);
                    //             },
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 color:
                    //                     themeMode ? AppTheme.white1 : AppTheme.black7,
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                     blurStyle: BlurStyle.normal,
                    //                     offset: Offset(0, -4),
                    //                     blurRadius: 26,
                    //                     spreadRadius: 0,
                    //                     color: Color(0xFF2B3361).withOpacity(0.10),
                    //                   ),
                    //                 ],
                    //               ),
                    //               child: Column(
                    //                 children: [
                    //                   SizedBox(height: 60),
                    //                   Padding(
                    //                     padding: EdgeInsets.fromLTRB(21, 21, 21, 23),
                    //                     child: Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         Flexible(
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(
                    //                                 "Tarih:",
                    //                                 style: TextStyle(
                    //                                   fontSize: 12,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w400,
                    //                                   color: AppTheme.white15,
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 items[index].date ?? '',
                    //                                 style: TextStyle(
                    //                                   fontSize: 13,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w600,
                    //                                   color: themeMode
                    //                                       ? AppTheme.blue3
                    //                                       : AppTheme.white1,
                    //                                 ),
                    //                               ),
                    //                               SizedBox(height: 16),
                    //                               Text(
                    //                                 "Satıcı:",
                    //                                 style: TextStyle(
                    //                                   fontSize: 12,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w400,
                    //                                   color: AppTheme.white15,
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 items[index].seller ?? '',
                    //                                 style: TextStyle(
                    //                                   fontSize: 13,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w600,
                    //                                   color: themeMode
                    //                                       ? AppTheme.blue3
                    //                                       : AppTheme.white1,
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                         Flexible(
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(
                    //                                 "Sipariş No:",
                    //                                 style: TextStyle(
                    //                                   fontSize: 12,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w400,
                    //                                   color: AppTheme.white15,
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 items[index].orderNumber ?? '',
                    //                                 style: TextStyle(
                    //                                   fontSize: 13,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w600,
                    //                                   color: themeMode
                    //                                       ? AppTheme.blue3
                    //                                       : AppTheme.white1,
                    //                                 ),
                    //                               ),
                    //                               SizedBox(height: 16),
                    //                               Text(
                    //                                 "Miktar:",
                    //                                 style: TextStyle(
                    //                                   fontSize: 12,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w400,
                    //                                   color: AppTheme.white15,
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 items[index].quantity ?? '',
                    //                                 style: TextStyle(
                    //                                   fontSize: 13,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w600,
                    //                                   color: themeMode
                    //                                       ? AppTheme.blue3
                    //                                       : AppTheme.white1,
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                         Flexible(
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.start,
                    //                             children: [
                    //                               Text(
                    //                                 "Ürün No:",
                    //                                 style: TextStyle(
                    //                                   fontSize: 12,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w400,
                    //                                   color: AppTheme.white15,
                    //                                 ),
                    //                               ),
                    //                               Text(
                    //                                 items[index].productNumber ?? '',
                    //                                 style: TextStyle(
                    //                                   fontSize: 13,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w600,
                    //                                   color: themeMode
                    //                                       ? AppTheme.blue3
                    //                                       : AppTheme.white1,
                    //                                 ),
                    //                               ),
                    //                               SizedBox(height: 16),
                    //                               Text(
                    //                                 "Durum:",
                    //                                 style: TextStyle(
                    //                                   fontSize: 12,
                    //                                   fontFamily:
                    //                                       AppTheme.appFontFamily,
                    //                                   fontWeight: FontWeight.w400,
                    //                                   color: AppTheme.white15,
                    //                                 ),
                    //                               ),
                    //                               items[index].status == "1"
                    //                                   ? Text(
                    //                                       "Onaylandı",
                    //                                       style: TextStyle(
                    //                                         fontSize: 13,
                    //                                         fontFamily:
                    //                                             AppTheme.appFontFamily,
                    //                                         fontWeight: FontWeight.w600,
                    //                                         color: themeMode
                    //                                             ? AppTheme.green6
                    //                                             : AppTheme.green7,
                    //                                       ),
                    //                                     )
                    //                                   : items[index].status == "0"
                    //                                       ? Text(
                    //                                           "Değerlendiriliyor",
                    //                                           style: TextStyle(
                    //                                             fontSize: 13,
                    //                                             fontFamily: AppTheme
                    //                                                 .appFontFamily,
                    //                                             fontWeight:
                    //                                                 FontWeight.w600,
                    //                                             color: themeMode
                    //                                                 ? AppTheme.blue3
                    //                                                 : AppTheme.white1,
                    //                                           ),
                    //                                         )
                    //                                       : Text(
                    //                                           "Reddedildi",
                    //                                           style: TextStyle(
                    //                                             fontSize: 13,
                    //                                             fontFamily: AppTheme
                    //                                                 .appFontFamily,
                    //                                             fontWeight:
                    //                                                 FontWeight.w600,
                    //                                             color: themeMode
                    //                                                 ? AppTheme.red2
                    //                                                 : AppTheme.red3,
                    //                                           ),
                    //                                         )
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                   Container(
                    //                       width: deviceWidth,
                    //                       height: 1,
                    //                       color: themeMode
                    //                           ? AppTheme.white21
                    //                           : AppTheme.black18),
                    //                   SizedBox(height: 2),
                    //                   Padding(
                    //                     padding:
                    //                         const EdgeInsets.fromLTRB(21, 8, 21, 8),
                    //                     child: Row(
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         InkWell(
                    //                           onTap: () {},
                    //                           child: Row(
                    //                             children: [
                    //                               Padding(
                    //                                 padding: const EdgeInsets.only(
                    //                                     bottom: 2),
                    //                                 child: Image.asset(
                    //                                     'assets/icons/message.png',
                    //                                     width: 12,
                    //                                     height: 10,
                    //                                     color: AppTheme.white15),
                    //                               ),
                    //                               SizedBox(width: 5),
                    //                               Text(
                    //                                 "Mesaj Gönder",
                    //                                 style: TextStyle(
                    //                                     fontSize: 12,
                    //                                     fontFamily:
                    //                                         AppTheme.appFontFamily,
                    //                                     fontWeight: FontWeight.w700,
                    //                                     color: themeMode
                    //                                         ? AppTheme.blue2
                    //                                         : AppTheme.blue10),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                         SizedBox(width: 20),
                    //                         InkWell(
                    //                           onTap: () {},
                    //                           child: Row(
                    //                             children: [
                    //                               Padding(
                    //                                 padding: const EdgeInsets.only(
                    //                                     bottom: 2),
                    //                                 child: Image.asset(
                    //                                     'assets/icons/arrow.png',
                    //                                     width: 8,
                    //                                     height: 8,
                    //                                     color: AppTheme.white15),
                    //                               ),
                    //                               SizedBox(width: 6),
                    //                               Text(
                    //                                 "Detaylar",
                    //                                 style: TextStyle(
                    //                                     fontSize: 12,
                    //                                     fontFamily:
                    //                                         AppTheme.appFontFamily,
                    //                                     fontWeight: FontWeight.w700,
                    //                                     color: themeMode
                    //                                         ? AppTheme.blue2
                    //                                         : AppTheme.blue10),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           );
                    //         }),
                    //       );
                    //     } else {
                    //       return SizedBox(
                    //         height: deviceWidth + 115,
                    //         child: Center(
                    //             child: CupertinoActivityIndicator(
                    //           color: Provider.of<ThemeProvider>(context).themeMode ==
                    //                   "light"
                    //               ? AppTheme.black1
                    //               : AppTheme.white1,
                    //           radius: 12,
                    //         )),
                    //       );
                    //     }
                    //   },
                    // ),
                    const SizedBox(height: 82),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
