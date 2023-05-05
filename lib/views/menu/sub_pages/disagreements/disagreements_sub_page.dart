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
                'Anlaşmazlık Formlarım',
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
                      'Yeni Anlaşmazlık Formu Ekle'.tr,
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
                              color:
                                  themeMode ? AppTheme.white1 : AppTheme.black12

                              // boxShadow: [
                              //   BoxShadow(
                              //     blurStyle: BlurStyle.normal,
                              //     offset: const Offset(0, -4),
                              //     blurRadius: 26,
                              //     spreadRadius: 0,
                              //     color: const Color(0xFF2B3361).withOpacity(0.10),
                              //   ),
                              // ],
                              ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 18, 25, 16),
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
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sorun Kategorisi:'.tr,
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
                                      : AppTheme.black28),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                  'assets/icons/check-4.png',
                                                  width: 12,
                                                  height: 9,
                                                  color: AppTheme.green3),
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                              'Confirm'.tr,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppTheme.green3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                                  'assets/icons/cross-3.png',
                                                  width: 9,
                                                  height: 9,
                                                  color: AppTheme.red6),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Reject'.tr,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppTheme.red6),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                                      ? AppTheme.blue3
                                                      : AppTheme.blue13),
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
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
