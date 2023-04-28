import 'package:b2geta_mobile/models/orders/order_details_model.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class CompanyOrdersDetailSubPage extends StatefulWidget {
  const CompanyOrdersDetailSubPage({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  final String orderId;

  @override
  State<CompanyOrdersDetailSubPage> createState() =>
      _CompanyOrdersDetailSubPageState();
}

class _CompanyOrdersDetailSubPageState
    extends State<CompanyOrdersDetailSubPage> {
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
        appBar: const CustomInnerAppBar(),
        body: _orderDetailsModel != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                            width: deviceWidth,
                            height: 1,
                            color: themeMode
                                ? AppTheme.white32
                                : Colors.transparent),
                        const SizedBox(height: 27),
                        Center(
                          child: Text(
                            'Order Detail' + ' #058743',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w600,
                              color:
                                  themeMode ? AppTheme.blue3 : AppTheme.white1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 46),
                      ],
                    ),
                    Container(
                      color: themeMode ? AppTheme.white1 : Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                              width: deviceWidth,
                              height: 1,
                              color: themeMode
                                  ? AppTheme.white32
                                  : AppTheme.black28),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 13, 21, 16),
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Karaca Keenover 10 Parça Bıçak Seti Xl',
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 1,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: themeMode
                                              ? AppTheme.blue3
                                              : AppTheme.white1,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Dimension:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '30*29*55cm',
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.green3,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 28,
                                          ),
                                          Text(
                                            'Color:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              height: 1,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 4),
                                            child: Container(
                                              width: 16,
                                              height: 16,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: AppTheme.white15,
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 15,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    color: AppTheme.orange1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        'Adet: 10.000'.tr,
                                        style: TextStyle(
                                          fontSize: 13,
                                          height: 1,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.white1,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
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
                                            fontFamily: AppTheme.appFontFamily,
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
                                            fontFamily: AppTheme.appFontFamily,
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
                            padding: const EdgeInsets.fromLTRB(27, 21, 27, 21),
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
                                            'Customer:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            _orderDetailsModel!.buyer!.name ??
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
                                            'Order Date:'.tr,
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
                                  ],
                                ),
                                const SizedBox(height: 10),
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
                                            '058743',
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
                                            'Order Confirmation Date:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            _orderDetailsModel!.shippingPrice ??
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
                                  ],
                                ),
                                const SizedBox(height: 10),
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
                                    const Spacer(),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Address:'.tr,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            _orderDetailsModel!.addresses!
                                                    .billing!.address ??
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
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Status:'.tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                        Text(
                                          _orderDetailsModel!.status ?? '',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: themeMode
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
                          Container(
                              width: deviceWidth,
                              height: 1,
                              color: themeMode
                                  ? AppTheme.white21
                                  : AppTheme.black18),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                              'assets/icons/exclamation.png',
                                              width: 12,
                                              height: 12,
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
                                                  ? AppTheme.blue2
                                                  : AppTheme.red6),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 1,
                                    height: 64,
                                    color: themeMode
                                        ? AppTheme.white21
                                        : AppTheme.black18),
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
                                                  : AppTheme.blue13),
                                        ),
                                      ],
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 130),
                  ],
                ),
              )
            : Center(
                child: CupertinoActivityIndicator(
                    color: themeMode ? AppTheme.black1 : AppTheme.white1,
                    radius: 12)));
  }
}
