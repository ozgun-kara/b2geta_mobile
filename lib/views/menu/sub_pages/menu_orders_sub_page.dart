import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/orders/order_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:b2geta_mobile/views/menu/sub_pages/menu_orders_detail_sub_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MenuOrdersSubPage extends StatefulWidget {
  const MenuOrdersSubPage({Key? key}) : super(key: key);

  @override
  State<MenuOrdersSubPage> createState() => _MenuOrdersSubPageState();
}

class _MenuOrdersSubPageState extends State<MenuOrdersSubPage> {
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
      appBar: const CustomAppBar(), body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : Colors.transparent),
            const SizedBox(height: 21),
            Text(
              'My Orders'.tr,
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w600,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            const SizedBox(height: 22),
            FutureBuilder<List<OrderModel>>(
              future: OrderService().getOrderCall(),
              builder: (context, data) {
                if (data.hasData) {
                  var orderList = data.data;

                  return ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: orderList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                    itemBuilder: ((context, index) {
                      var items = data.data;

                      return Container(
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
                              padding:
                                  const EdgeInsets.fromLTRB(21, 21, 21, 23),
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
                                              items[index].id ?? '',
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
                                            items[index].status == "approved"
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
                                                : items[index].status == "new"
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
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
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
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    height: 35,
                                    child: MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MenuOrdersDetailSubPage(
                                                orderId: items[index].id!,
                                              ),
                                            ));
                                      },
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
                                                'assets/icons/arrow.png',
                                                width: 8,
                                                height: 8,
                                                color: AppTheme.white15),
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            'Details'.tr,
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
                                ],
                              ),
                            ),
                          ],
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
            const SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
