import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/agreement/agreement_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PrivacyPolicySubPage extends StatefulWidget {
  const PrivacyPolicySubPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicySubPage> createState() => _PrivacyPolicySubPageState();
}

class _PrivacyPolicySubPageState extends State<PrivacyPolicySubPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  String? privacyPolicyText;
  final AgreementServices _agreementServices = AgreementServices();

  @override
  void initState() {
    super.initState();
    privacyPolicyGet();
  }

  Future<void> privacyPolicyGet() async {
    _agreementServices.privacyPolicyCall().then((value) {
      if (value != null) {
        setState(() {
          privacyPolicyText = value;
        });
      }
    });
  }

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
                  'Privacy Policy'.tr,
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
      body: privacyPolicyText != null
          ? SingleChildScrollView(
              child: Html(
              data: privacyPolicyText ?? "",
              style: {
                "table": Style(
                  backgroundColor: Colors.pink,
                  textDecorationColor: Colors.black,
                ),
                "tr": Style(
                  border: const Border(bottom: BorderSide(color: Colors.grey)),
                  textDecorationColor: Colors.black,
                ),
                "th": Style(
                  padding: const EdgeInsets.all(6),
                  backgroundColor: Colors.grey,
                  textDecorationColor: Colors.black,
                ),
                "td": Style(
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.topLeft,
                  textDecorationColor: Colors.black,
                ),
                'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
              },
            ))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
