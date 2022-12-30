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
                SizedBox(height: 22),
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
