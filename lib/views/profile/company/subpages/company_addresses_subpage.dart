import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/dummy_models/company_address_dummy_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/dummy_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyAddressesSubpage extends StatefulWidget {
  const CompanyAddressesSubpage({Key? key}) : super(key: key);

  @override
  State<CompanyAddressesSubpage> createState() =>
      _CompanyAddressesSubpageState();
}

class _CompanyAddressesSubpageState extends State<CompanyAddressesSubpage> {
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
      backgroundColor: themeMode ? AppTheme.white36 : AppTheme.black12,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : Colors.transparent),
            SizedBox(height: 60),
            FutureBuilder(
              future: DummyService().getCompanyAddressList(),
              builder: (context, data) {
                if (data.hasData) {
                  var productIdList = data.data;

                  return ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: productIdList!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: ((context, index) {
                      var items = data.data as List<CompanyAddressDummyModel>;

                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  themeMode ? AppTheme.white1 : AppTheme.black7,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                width: 1,
                                color: themeMode
                                    ? AppTheme.white35
                                    : AppTheme.black18,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(24, 21, 24, 21),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              items[index].name ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white1,
                                              ),
                                            ),
                                            SizedBox(height: 28),
                                            Text(
                                              "Şehir",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              items[index].city ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
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
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Adres",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              items[index].address ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white1,
                                              ),
                                            ),
                                            SizedBox(height: 28),
                                            Text(
                                              "Ülke",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              items[index].country ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
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
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "İlçe",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              items[index].district ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w400,
                                                color: themeMode
                                                    ? AppTheme.blue3
                                                    : AppTheme.white1,
                                              ),
                                            ),
                                            SizedBox(height: 28),
                                            Text(
                                              "Posta Kodu",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                            Text(
                                              items[index].postalCode ?? '',
                                              style: TextStyle(
                                                fontSize: 12,
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
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: MaterialButton(
                                              height: 30,
                                              color: AppTheme.blue2,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              elevation: 0,
                                              child: Text(
                                                "Düzenle",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppTheme.white1),
                                              ),
                                              onPressed: () {}),
                                        ),
                                      ),
                                      SizedBox(width: 17),
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: MaterialButton(
                                              height: 30,
                                              color: AppTheme.red4,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              elevation: 0,
                                              child: Text(
                                                "Sil",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        AppTheme.appFontFamily,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppTheme.white1),
                                              ),
                                              onPressed: () {}),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
            SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: SizedBox(
                height: 47,
                child: MaterialButton(
                    height: 47,
                    minWidth: deviceWidth,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    elevation: 0,
                    child: Text(
                      "Adres Ekle",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w600,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1),
                    ),
                    onPressed: () {}),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
