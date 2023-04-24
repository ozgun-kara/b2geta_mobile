import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/orders/order_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/orders/order_service.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CompanyOrdersSubPage extends StatefulWidget {
  const CompanyOrdersSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyOrdersSubPage> createState() => _CompanyOrdersSubPageState();
}

class _CompanyOrdersSubPageState extends State<CompanyOrdersSubPage> {
  ScrollController scrollController = ScrollController();

  final List<String> dropdownItems = [
    'Alınan Siparişler',
    'Verilen Siparişler'
  ];
  String? dropdownSelectedValue = 'Alınan Siparişler';

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
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  // alignment: AlignmentDirectional.center,
                  isExpanded: true,
                  hint: Text(
                    dropdownSelectedValue.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  items: dropdownItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Center(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w700,
                                  color: AppTheme.white1,
                                ),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ))
                      .toList(),
                  value: dropdownSelectedValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownSelectedValue = value as String;
                    });
                  },
                  icon: Center(
                    child: Image.asset('assets/icons/dropdown.png',
                        width: 10, height: 6, color: AppTheme.white1),
                  ),
                  iconSize: 24,
                  // iconEnabledColor: Colors.yellow,
                  // iconDisabledColor: Colors.grey,
                  // icon: Container(),
                  buttonHeight: 52,
                  buttonWidth: deviceWidth,
                  buttonPadding: const EdgeInsets.only(left: 28, right: 18),
                  buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // border:
                      //     Border.all(color: Color.fromRGBO(110, 113, 145, 0.25)),
                      color: AppTheme.blue2),
                  // buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  // dropdownWidth: deviceWidth,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      // color: Color(0xFFEFF0F7),
                      color: AppTheme.blue2),
                  // dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 4,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(0, 0),
                ),
              ),
            ),
            const SizedBox(height: 23),
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : AppTheme.black28),
            FutureBuilder<List<OrderModel>>(
              future: OrderService().getOrderCallTest(),
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

                      return Container(
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? (themeMode ? AppTheme.white1 : AppTheme.black12)
                              : (themeMode
                                  ? AppTheme.white43
                                  : AppTheme.black5),

                          // themeMode ? AppTheme.white1 : AppTheme.black7,

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
