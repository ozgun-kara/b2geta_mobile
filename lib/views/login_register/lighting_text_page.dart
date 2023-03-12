import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LightingTextPage extends StatefulWidget {
  const LightingTextPage({Key? key}) : super(key: key);

  @override
  State<LightingTextPage> createState() => _LightingTextPageState();
}

class _LightingTextPageState extends State<LightingTextPage> {
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
          ? AppTheme.white1
          : AppTheme.black12,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(116),
          child: Padding(
            padding: EdgeInsets.only(top: deviceTopPadding),
            child: AppBar(
              toolbarHeight: 30,
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                splashRadius: 24,
                icon: Image.asset(
                  'assets/icons/back.png',
                  width: 27,
                  height: 13,
                  color:
                      Provider.of<ThemeProvider>(context).themeMode == "light"
                          ? AppTheme.blue3
                          : AppTheme.white14,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 65),
                // padding: EdgeInsets.only(top: 49),
                child: Text(
                  'Aydınlatma Metni'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.appFontFamily,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color:
                        Provider.of<ThemeProvider>(context).themeMode == "light"
                            ? AppTheme.blue2
                            : AppTheme.white1,
                  ),
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 47,
            ),
            SizedBox(
              width: deviceWidth,
              height: deviceHeight,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'AYDINLATMA METNİ \n',
                      style: TextStyle(
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                        fontFamily: AppTheme.appFontFamily,
                        fontSize: 15,
                        height: 1.8,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text:
                          '1.TARAFLAR İşbu Üyelik Sözleşmesi ("Sözleşme");  alan adlı internet sitesi ve mobil cihaz uygulamalarının sahibi olan ve Maslak Mahallesi, Saat Sokak (Spine Tower), No: 5, İç Kapı No: 19, Sarıyer/İstanbul adresinde bulunan DSM GRUP DANIŞMANLIK İLETİŞİM VE SATIŞ TİC. A.Ş. (“DSM”) ile;  alan adlı internet sitesi ve mobil uygulamasına (“Platform”) işbu Sözleşme’deki koşul ve şartları kabul ederek üye olan kullanıcı (“Üye”, “Üyeler”) arasında, Üye\'nin DSM\'nin sunduğu hizmetlerden yararlanmasına ilişkin koşul ve şartların belirlenmesi için akdedilmiştir.DSM ve Üye işbu Sözleşme\'de ayrı ayrı “Taraf” birlikte “Taraflar” olarak anılacaktır.\n1.TANIMLAR \nPazaryeri : \nDSM’nin 6563 sayılı Elektronik Ticaretin Düzenlenmesi Hakkında Kanun uyarınca "elektronik ticaret aracı hizmet sağlayıcı" ve 5651 sayılı İnternet Ortamında Yapılan Yayınların Düzenlenmesi ve Bu Yayınlar Yoluyla İşlenen Suçlarla Mücadele Edilmesi Hakkında Kanun uyarınca',
                      style: TextStyle(
                        color: Provider.of<ThemeProvider>(context).themeMode ==
                                "light"
                            ? AppTheme.blue3
                            : AppTheme.white1,
                        fontFamily: AppTheme.appFontFamily,
                        fontSize: 15,
                        height: 1.8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]))),
            ),
          ],
        ),
      ),
    );
  }
}
