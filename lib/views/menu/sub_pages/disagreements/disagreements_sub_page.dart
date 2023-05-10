import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/orders/order_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/my_orders/company_orders_detail_sub_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DisagreementsSubPage extends StatefulWidget {
  const DisagreementsSubPage({Key? key}) : super(key: key);

  @override
  State<DisagreementsSubPage> createState() => _DisagreementsSubPageState();
}

class _DisagreementsSubPageState extends State<DisagreementsSubPage> {
  ScrollController scrollController = ScrollController();
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: const CustomInnerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : Colors.transparent),
            const SizedBox(height: 27),
            Center(
              child: Text(
                'My Disagreement Forms'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                ),
              ),
            ),
            const SizedBox(height: 27),
            MaterialButton(
                minWidth: deviceWidth - 32,
                height: 52,
                elevation: 0,
                color: AppTheme.blue2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/icons/plus-icon.png',
                        width: 12, height: 16, color: AppTheme.white1),
                    const SizedBox(width: 5),
                    Text(
                      'Add New Disagreement Form'.tr,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.white1),
                    ),
                  ],
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     PageRouteBuilder(
                  //       pageBuilder: (_, __, ___) =>
                  //       const AddProductSubPage(operation: 'Add'),
                  //       transitionDuration:
                  //       const Duration(milliseconds: 0),
                  //       reverseTransitionDuration:
                  //       const Duration(milliseconds: 0),
                  //       transitionsBuilder: (_, a, __, c) =>
                  //           FadeTransition(opacity: a, child: c),
                  //     )).then((_) => setState(() {}));
                }),
            const SizedBox(height: 28),
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : AppTheme.black28),
            FutureBuilder<List<OrderModel>>(
              future: locator<OrderService>().getMyIncomingOrdersCall(),
              builder: (context, data) {
                if (data.hasData) {
                  var orderList = data.data;

                  return ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: orderList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                          width: deviceWidth,
                          height: 1,
                          color:
                              themeMode ? AppTheme.white21 : AppTheme.black28);
                    },
                    itemBuilder: ((context, index) {
                      var items = data.data;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    CompanyOrdersDetailSubPage(
                                  orderId: items[index].id!,
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
                              color: themeMode
                                  ? AppTheme.white1
                                  : AppTheme.black12),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 18, 25, 39),
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
                                          flex: 4,
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
                                                items![index].orderDate ?? '',
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
                                          flex: 4,
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
                                            flex: 1,
                                            child: Center(
                                              child: ClipOval(
                                                child: Material(
                                                  color: themeMode
                                                      ? AppTheme.white44
                                                      : AppTheme.black28,
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: SizedBox(
                                                      width: 32,
                                                      height: 32,
                                                      child: Center(
                                                        child: Image.asset(
                                                          'assets/icons/more.png',
                                                          width: 16,
                                                          height: 3.2,
                                                          color: themeMode
                                                              ? AppTheme.blue3
                                                              : AppTheme.white1,
                                                          // color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 4,
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
                                                items[index].seller!.name ?? '',
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
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Problem Category:'.tr,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                              Text(
                                                'Bozuk Ürün',
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
                                        const Spacer(
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
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
                                        const SizedBox(height: 8),
                                        Visibility(
                                          visible: true,
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.blue2,
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    8, 2, 8, 2),
                                                child: Text(
                                                  'Closed'.tr,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppTheme.white1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                'Seller fulfilled the request'
                                                    .tr,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
                                                  color: themeMode
                                                      ? AppTheme.blue3
                                                      : AppTheme.white1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: false,
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: AppTheme.green11,
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    19, 2, 19, 2),
                                                child: Text(
                                                  'Open'.tr,
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppTheme.white1,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Text(
                                                'Awaiting response from seller'
                                                    .tr,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w400,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return SizedBox(
                    height: deviceWidth + 115,
                    child: Center(
                        child: CupertinoActivityIndicator(
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.black1
                          : AppTheme.white1,
                      radius: 12,
                    )),
                  );
                }
              },
            ),
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white21 : AppTheme.black28),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
