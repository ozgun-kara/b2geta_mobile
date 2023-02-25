import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';

class ShoppingSummarySubPage extends StatefulWidget {
  const ShoppingSummarySubPage({
    Key? key,
    required this.companyInfoList,
  }) : super(key: key);
  final List companyInfoList;
  @override
  State<ShoppingSummarySubPage> createState() => _ShoppingSummarySubPageState();
}

class _ShoppingSummarySubPageState extends State<ShoppingSummarySubPage> {
  ScrollController scrollController = ScrollController();

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late List companyInfos;

  @override
  void initState() {
    super.initState();
    companyInfos = widget.companyInfoList;
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).themeMode == "light"
          ? AppTheme.white2
          : AppTheme.black7,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 63, 0, 84),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/check-2.png',
                  width: 75.83,
                  height: 75.83,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37),
                  child: Text(
                    "Siparişleriniz firmalara iletildi!",
                    textAlign: TextAlign.center,
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
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  itemCount: companyInfos.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: ((context, index) {
                    var company = companyInfos[index];
                    var companyName = company["seller"]["name"];
                    var companyPhoto = company["seller"]["photo"];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                          child: Container(
                            width: deviceWidth,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(22)),
                              border: Border.all(
                                width: 1,
                                color: Provider.of<ThemeProvider>(context)
                                            .themeMode ==
                                        "light"
                                    ? AppTheme.white21
                                    : AppTheme.black15,
                              ),
                              color: Provider.of<ThemeProvider>(context)
                                          .themeMode ==
                                      "light"
                                  ? AppTheme.white1
                                  : AppTheme.black15,
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
                            padding: const EdgeInsets.fromLTRB(12, 23, 27, 20),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: Provider.of<ThemeProvider>(
                                                            context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.white21
                                                : AppTheme.black20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            companyPhoto.isNotEmpty
                                                ? companyPhoto
                                                : 'https://api.businessucces.com/uploads/profile/2023/01/15012023203949-1673811589.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '9,2',
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
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              companyName ?? '',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                                    context)
                                                                .themeMode ==
                                                            "light"
                                                        ? AppTheme.black19
                                                        : AppTheme.white1,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: true,
                                            child: Image.asset(
                                                'assets/icons/check.png',
                                                width: 23,
                                                height: 23),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'İstanbul, Türkiye',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: AppTheme.appFontFamily,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        height: 22,
                                        child: ButtonTheme(
                                          minWidth: double.minPositive,
                                          height: 22,
                                          child: MaterialButton(
                                              elevation: 0,
                                              color: AppTheme.blue2,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(36)),
                                              ),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      12, 2, 12, 0),
                                              child: Text(
                                                "Takip Et",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppTheme.white1,
                                                ),
                                              ),
                                              onPressed: () async {}),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60, 8, 60, 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Image.asset('assets/icons/message.png',
                                        width: 13,
                                        height: 11,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                        .themeMode ==
                                                    "light"
                                                ? AppTheme.blue2
                                                : AppTheme.blue6),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Mesaj Gönder",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.white15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Image.asset('assets/icons/bag.png',
                                          width: 11,
                                          height: 11,
                                          color: Provider.of<ThemeProvider>(
                                                          context)
                                                      .themeMode ==
                                                  "light"
                                              ? AppTheme.blue2
                                              : AppTheme.blue6),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Firma Profili",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: AppTheme.white15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 18),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(68)),
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
