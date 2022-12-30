import 'package:b2geta_mobile/models/dummy_models/product_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy_models/shopping_summary_dummy_model.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';

class ShoppingSummarySubpage extends StatefulWidget {
  const ShoppingSummarySubpage({Key? key}) : super(key: key);

  @override
  State<ShoppingSummarySubpage> createState() => _ShoppingSummarySubpageState();
}

class _ShoppingSummarySubpageState extends State<ShoppingSummarySubpage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white2
          : AppTheme.black7,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 63, 0, 84),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/check-2.png',
                  width: 75.83,
                  height: 75.83,
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "Siparişleriniz firmalara iletildi!",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w700,
                      color: Provider.of<ThemeProvider>(context).themeMode ==
                              "light"
                          ? AppTheme.blue3
                          : AppTheme.white1,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "En kısa sürede sizinle iletişime geçeceklerdir mesaj kutunuzu kontrol edin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                FutureBuilder(
                  future: DummyService().getShoppingSummaryList(),
                  builder: (context, data) {
                    if (data.hasData) {
                      var items = data.data as List<ShoppingSummaryDummyModel>;

                      return ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(45, 0, 45, 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(22)),
                                  color: Provider.of<ThemeProvider>(context)
                                              .themeMode ==
                                          "light"
                                      ? AppTheme.white1
                                      : AppTheme.black7,
                                  boxShadow: [
                                    BoxShadow(
                                      blurStyle: BlurStyle.normal,
                                      offset: Offset(0, -4),
                                      blurRadius: 26,
                                      spreadRadius: 0,
                                      color:
                                          Color(0xFF2B3361).withOpacity(0.10),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(12, 23, 27, 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 55,
                                          height: 55,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                items[index].imgUrl ?? '',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index].rating ?? '',
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w800,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Image.asset('assets/icons/star.png',
                                                width: 15, height: 15),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index].companyName ?? '',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w600,
                                            color: Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.black19
                                                : AppTheme.white1,
                                          ),
                                        ),
                                        Text(
                                          items[index].location ?? '',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: AppTheme.appFontFamily,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.white15,
                                          ),
                                        ),
                                        SizedBox(height: 4),
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
                                                      BorderRadius.all(
                                                          Radius.circular(36)),
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 2, 10, 3.5),
                                                child: Text(
                                                  "Takip Et",
                                                  style: TextStyle(
                                                    fontSize: 11,
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
                                                onPressed: () async {}),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }));
                    } else {
                      return SizedBox(
                        height: deviceWidth + 115,
                        child: Center(
                            child: CupertinoActivityIndicator(
                          color:
                              Provider.of<ThemeProvider>(context).themeMode ==
                                      "light"
                                  ? AppTheme.black1
                                  : AppTheme.white1,
                          radius: 12,
                        )),
                      );
                    }
                  },
                ),
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 52),
                  child: Text(
                    "Ödeme kargo takip ve diğer hususlar için hala sorularınız var ise rehber sayfamızı ziyaret edebilirsiniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ButtonTheme(
                    minWidth: deviceWidth,
                    height: 62,
                    child: MaterialButton(
                        elevation: 0,
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.white2
                            : AppTheme.black18,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(68)),
                          side: BorderSide(
                              width: 1,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.white23
                                  : AppTheme.black18),
                        ),
                        child: Text(
                          "Sıkça Sorulan Sorular",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w400,
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.blue2
                                  : AppTheme.white1),
                        ),
                        onPressed: () {}),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
