import 'dart:ui';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/orders/order_details_model.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_text_form_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
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
  late double deviceBottomPadding;
  late bool themeMode;
  ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> _invoiceGlobalKey = GlobalKey<FormState>();

  OrderDetailsModel? _orderDetailsModel;

  final TextEditingController _invoiceNumberController =
      TextEditingController();
  final TextEditingController _invoiceUrlController = TextEditingController();
  final TextEditingController _invoiceDateController = TextEditingController();

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    getOrderDetails();
    DateTime now = DateTime.now(); //current date
    DateFormat formatter = DateFormat('yyyy-MM-dd'); // use any format
    String formatted = formatter.format(now);
    _invoiceDateController.text = formatted;
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
    deviceBottomPadding = MediaQuery.of(context).padding.bottom;
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
                          '${'Order Detail'.tr} #${_orderDetailsModel!.id}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 46),
                    ],
                  ),
                  ListView.builder(
                    itemCount: _orderDetailsModel!.products!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
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
                              padding:
                                  const EdgeInsets.fromLTRB(12, 13, 21, 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 82,
                                    height: 82,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            _orderDetailsModel!
                                                .products![index]!.image
                                                .toString()),
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
                                          _orderDetailsModel!
                                              .products![index]!.name
                                              .toString(),
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
                                          height: 10,
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
                                                      .products![index]!
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
                                            text: _orderDetailsModel!
                                                    .products![index]!.price ??
                                                '',
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
                              padding:
                                  const EdgeInsets.fromLTRB(27, 21, 27, 21),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              _orderDetailsModel!.orderDate ??
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              _orderDetailsModel!
                                                      .products![index]!
                                                      .quantity ??
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              _orderDetailsModel!
                                                      .products![index]!.id ??
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                    : _orderDetailsModel!
                                                                .status!
                                                                .toLowerCase() ==
                                                            "shipped"
                                                        ? Text(
                                                            'Shipped Out'.tr,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: AppTheme
                                                                  .appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: themeMode
                                                                  ? AppTheme
                                                                      .blue3
                                                                  : AppTheme
                                                                      .white1,
                                                            ),
                                                          )
                                                        : Text(
                                                            'Denied'.tr,
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              fontFamily: AppTheme
                                                                  .appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: themeMode
                                                                  ? AppTheme
                                                                      .red2
                                                                  : AppTheme
                                                                      .red3,
                                                            ),
                                                          )
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
                                              'Payment Status:'.tr,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              _orderDetailsModel!.paymentStatus!
                                                  ? 'Done'.tr
                                                  : 'Not Done'.tr,
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: themeMode
                                                    ? _orderDetailsModel!
                                                            .paymentStatus!
                                                        ? AppTheme.blue3
                                                        : AppTheme.red2
                                                    : AppTheme.white1,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  _orderDetailsModel!.status!.toLowerCase() ==
                                          "shipped"
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Cargo Tracking Url:'
                                                            .tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      Text(
                                                        _orderDetailsModel!
                                                                .cargoTrackingUrl ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: themeMode
                                                              ? AppTheme.green6
                                                              : AppTheme.green7,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Cargo Tracking No:'.tr,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              AppTheme.white15,
                                                        ),
                                                      ),
                                                      Text(
                                                        _orderDetailsModel!
                                                                .cargoTrackingNo ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          fontFamily: AppTheme
                                                              .appFontFamily,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: themeMode
                                                              ? _orderDetailsModel!
                                                                      .paymentStatus!
                                                                  ? AppTheme
                                                                      .blue3
                                                                  : AppTheme
                                                                      .red2
                                                              : AppTheme.white1,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 35,
                                    child: MaterialButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2),
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
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: MaterialButton(
                        minWidth: deviceWidth,
                        height: 52,
                        elevation: 0,
                        color: AppTheme.blue2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          'Sonraki Adım'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.white1),
                        ),
                        onPressed: () {
                          createInvoiceDialog(context);
                        }),
                  ),
                  const SizedBox(height: 130),
                ],
              ),
            )
          : Center(
              child: CupertinoActivityIndicator(
                  color: themeMode ? AppTheme.black1 : AppTheme.white1,
                  radius: 12),
            ),
    );
  }

  void createInvoiceDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
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
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create Invoice'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w500,
                        color: themeMode ? AppTheme.black25 : AppTheme.white1,
                      ),
                    ),
                    Container(
                        width: deviceWidth,
                        height: 1,
                        color:
                            themeMode ? AppTheme.white32 : Colors.transparent),
                    const SizedBox(height: 32),
                    Form(
                        key: _invoiceGlobalKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              titleText: 'Invoice Number'.tr,
                              controller: _invoiceNumberController,
                              color: themeMode
                                  ? AppTheme.white6
                                  : AppTheme.black11,
                              autofocus: true,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Invoice Number Validate'.tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomTextFormField(
                              titleText: 'Invoice Url'.tr,
                              controller: _invoiceUrlController,
                              color: themeMode
                                  ? AppTheme.white6
                                  : AppTheme.black11,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Invoice Url Validate'.tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomTextFormField(
                              titleText: 'Invoice Date'.tr,
                              controller: _invoiceDateController,
                              color: themeMode
                                  ? AppTheme.white6
                                  : AppTheme.black11,
                              inputFormatters: [
                                DateTextFormatter(),
                              ],
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Invoice Date Validate'.tr;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonTheme(
                            height: 32,
                            child: MaterialButton(
                                elevation: 0,
                                color: AppTheme.green1,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Text(
                                  'Confirm'.tr,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.white1),
                                ),
                                onPressed: () {
                                  if (_invoiceGlobalKey.currentState!
                                      .validate()) {
                                    locator<OrderService>()
                                        .updateOrderCall(
                                            orderId: widget.orderId,
                                            orderStatus: 'shipped',
                                            invoiceUrl:
                                                _invoiceUrlController.text,
                                            invoiceNo:
                                                _invoiceNumberController.text,
                                            invoiceDate:
                                                _invoiceDateController.text)
                                        .then((value) {
                                      if (value) {
                                        Navigator.pop(context);
                                      }
                                    });
                                  }
                                }),
                          ),
                          ButtonTheme(
                            height: 32,
                            child: MaterialButton(
                                elevation: 0,
                                color: themeMode
                                    ? AppTheme.black16
                                    : AppTheme.black18,
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
                        ],
                      ),
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

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length &&
        newValue.text.isNotEmpty &&
        oldValue.text.isNotEmpty) {
      if (RegExp('[^0-9-]').hasMatch(newValue.text)) return oldValue;
      if (newValue.text.length > 10) return oldValue;
      if (newValue.text.length == 7) {
        return TextEditingValue(
          text: '${newValue.text}-',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      } else if (newValue.text.length == 5 && newValue.text[4] != '-') {
        return TextEditingValue(
          text:
              '${newValue.text.substring(0, 4)}-${newValue.text.substring(4)}',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      } else if (newValue.text.length == 6 && newValue.text[7] != '-') {
        return TextEditingValue(
          text:
              '${newValue.text.substring(0, 7)}-${newValue.text.substring(6)}',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      }
    } else if (newValue.text.length == 1 &&
        oldValue.text.isEmpty &&
        RegExp('[^0-9]').hasMatch(newValue.text)) {
      return oldValue;
    }
    return newValue;
  }
}
