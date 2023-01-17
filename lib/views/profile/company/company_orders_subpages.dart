import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/dummy_models/company_order_dummy_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
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
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailSubpage(productId: productIdList[index], productName: productList["title"].toString(), imageUrl: productList["imgUrl"].toString(),price: productList["price"].toString()),),);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color:
                                Provider.of<ThemeProvider>(context).themeMode ==
                                        "light"
                                    ? AppTheme.white1
                                    : AppTheme.black7,
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
                          padding: EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 126,
                                height: 145,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                ),
                                child: Image.network(
                                  items[index].imgUrl ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //? bu kısım sorulacak.
                                  SizedBox(
                                    width: deviceWidth - (24 + 16 + 126 + 10),
                                    height: 35,
                                    child: Text(
                                      items[index].title ?? '',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue3
                                                : AppTheme.white11,
                                      ),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                      text: items[index].totalPayment ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.white1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "₺",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.white1,
                                      ),
                                    )
                                  ])),

                                  Text(
                                    "10 adet min. sipariş",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w500,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "İstanbul, Türkiye",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.white15,
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "İteme İnşaat",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w700,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue3
                                              : AppTheme.white11,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "9,2",
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w800,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Image.asset('assets/icons/star.png',
                                          width: 15, height: 15),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  SizedBox(
                                    height: 24,
                                    child: ButtonTheme(
                                      // minWidth: deviceWidth,
                                      height: 22,

                                      child: MaterialButton(
                                          elevation: 0,
                                          color: Colors.transparent,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: AppTheme.white19),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(36)),
                                          ),
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 2, 10, 3.5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Image.asset(
                                                  'assets/icons/comment.png',
                                                  width: 12.5,
                                                  height: 12.5,
                                                  color: AppTheme.black16),
                                              const SizedBox(width: 3.5),
                                              Text(
                                                "Tedarikçiye Ulaşın",
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      Provider.of<ThemeProvider>(
                                                                      context)
                                                                  .themeMode ==
                                                              "light"
                                                          ? AppTheme.blue2
                                                          : AppTheme.white1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () async {}),
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}
