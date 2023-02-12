import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/dummy_models/company_order_dummy_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'company_orders_detail_sub_page.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CompanyOrdersSubPage extends StatefulWidget {
  const CompanyOrdersSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyOrdersSubPage> createState() => _CompanyOrdersSubPageState();
}

class _CompanyOrdersSubPageState extends State<CompanyOrdersSubPage> {
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
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/back.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: SizedBox(
              width: 103.74,
              height: 14.0,
              child: themeMode
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
      body: SingleChildScrollView(
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
            FutureBuilder(
              future: DummyService().getCompanyOrdersList(),
              builder: (context, data) {
                if (data.hasData) {
                  var productIdList = data.data;

                  return ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: productIdList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 8);
                    },
                    itemBuilder: ((context, index) {
                      var items = data.data as List<CompanyOrderDummyModel>;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CompanyOrdersDetailSubPage(
                                  passedObject: items[index],
                                ),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                themeMode ? AppTheme.white1 : AppTheme.black7,
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.normal,
                                offset: const Offset(0, -4),
                                blurRadius: 26,
                                spreadRadius: 0,
                                color:
                                    const Color(0xFF2B3361).withOpacity(0.10),
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
                                                items[index].date ?? '',
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
                                        Spacer(),
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
                                                items[index].orderNumber ?? '',
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
                                        Spacer(),
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
                                                items[index].productNumber ??
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
                                    const SizedBox(
                                        height: 18),
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
                                                items[index].seller ?? '',
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
                                        Spacer(),
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
                                                items[index].quantity ?? '',
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
                                        Spacer(),
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
                                              items[index].status == "1"
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
                                                  : items[index].status == "0"
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
