import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/agreement/agreement_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MembershipAgreementSubPage extends StatefulWidget {
  const MembershipAgreementSubPage({Key? key}) : super(key: key);

  @override
  State<MembershipAgreementSubPage> createState() =>
      _MembershipAgreementSubPageState();
}

class _MembershipAgreementSubPageState
    extends State<MembershipAgreementSubPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;

  String? membershipText;
  final AgreementServices _agreementServices = AgreementServices();

  @override
  void initState() {
    super.initState();
    membershipTextGet();
  }

  Future<void> membershipTextGet() async {
    _agreementServices.membershipAgreementCall().then((value) {
      if (value != null) {
        setState(() {
          membershipText = value;
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
                  'Üyelik Sözleşmesi'.tr,
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
      body: membershipText != null
          ? SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Html(
                data: membershipText ?? "",
                style: {
                  "table": Style(
                    backgroundColor: Colors.pink,
                    textDecorationColor: Colors.black,
                  ),
                  "tr": Style(
                    border:
                        const Border(bottom: BorderSide(color: Colors.grey)),
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
              ),
            ))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
