import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadStepsSubPage extends StatefulWidget {
  const UploadStepsSubPage({Key? key}) : super(key: key);

  @override
  State<UploadStepsSubPage> createState() => _UploadStepsSubPageState();
}

class _UploadStepsSubPageState extends State<UploadStepsSubPage> {
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
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black5,
      body: Column(
        children: [
          const SizedBox(height: 180),
          Container(
              width: deviceWidth,
              height: 1,
              color: themeMode ? AppTheme.white32 : AppTheme.black2),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Image.asset(
                      "assets/icons/post_image_add.png",
                      width: 18,
                      height: 18,
                      color: AppTheme.blue2,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Fotoğraf/Video Ekle",
                    style: TextStyle(
                      fontSize: 14,
                      height: 1,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w600,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                    ),
                  ),
                ],
              ),
              onPressed: () {}),
          Container(
              width: deviceWidth,
              height: 1,
              color: themeMode ? AppTheme.white32 : AppTheme.black2),
          MaterialButton(
              minWidth: deviceWidth,
              elevation: 0,
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 12),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Image.asset("assets/icons/reels-upload.png",
                        width: 18, height: 18, color: AppTheme.red5),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Reels Video Yükle",
                    style: TextStyle(
                      fontSize: 14,
                      height: 1,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w600,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                    ),
                  ),
                ],
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
