import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/dummy_models/company_order_dummy_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:b2geta_mobile/views/profile/company/subpages/company_orders_detail_subpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyOrdersSubpage extends StatefulWidget {
  const CompanyOrdersSubpage({Key? key}) : super(key: key);

  @override
  State<CompanyOrdersSubpage> createState() => _CompanyOrdersSubpageState();
}

class _CompanyOrdersSubpageState extends State<CompanyOrdersSubpage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : Colors.transparent),
            SizedBox(height: 21),
            Text(
              "Siparişlerim",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w600,
                color: themeMode ? AppTheme.blue3 : AppTheme.white1,
              ),
            ),
            SizedBox(height: 22),
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
                      return SizedBox(height: 8);
                    },
                    itemBuilder: ((context, index) {
                      var items = data.data as List<CompanyOrderDummyModel>;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CompanyOrdersDetailSubpage(
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
                                offset: Offset(0, -4),
                                blurRadius: 26,
                                spreadRadius: 0,
                                color: Color(0xFF2B3361).withOpacity(0.10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(21, 21, 21, 23),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tarih:",
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
                                          SizedBox(height: 16),
                                          Text(
                                            "Satıcı:",
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
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sipariş No:",
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
                                          SizedBox(height: 16),
                                          Text(
                                            "Miktar:",
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
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Ürün No:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily:
                                                  AppTheme.appFontFamily,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.white15,
                                            ),
                                          ),
                                          Text(
                                            items[index].productNumber ?? '',
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
                                          SizedBox(height: 16),
                                          Text(
                                            "Durum:",
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
                                                  "Onaylandı",
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
                                              : items[index].status == "0"
                                                  ? Text(
                                                      "Değerlendiriliyor",
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
                                                      "Reddedildi",
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
                              ),
                              Container(
                                  width: deviceWidth,
                                  height: 1,
                                  color: themeMode
                                      ? AppTheme.white21
                                      : AppTheme.black18),
                              SizedBox(height: 2),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(21, 8, 21, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
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
                                          SizedBox(width: 5),
                                          Text(
                                            "Mesaj Gönder",
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
                                    SizedBox(width: 20),
                                    InkWell(
                                      onTap: () {},
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
                                          SizedBox(width: 6),
                                          Text(
                                            "Detaylar",
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
            SizedBox(height: 82),
          ],
        ),
      ),
    );
  }
}
