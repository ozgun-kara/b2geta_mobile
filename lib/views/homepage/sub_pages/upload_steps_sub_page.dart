import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

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

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black5,
      appBar: AppBar(
          toolbarHeight: 58,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/back-3.png',
                width: 16,
                height: 12,
                color: AppTheme.white15,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Text(
              'Create Post'.tr,
              style: TextStyle(
                fontSize: 14,
                height: 1,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w600,
                color: AppTheme.white15,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 11.5, 11, 11.5),
              child: MaterialButton(
                  height: 35,
                  color: AppTheme.blue2,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  elevation: 0,
                  child: Text(
                    'Homepage Share-3'.tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.white1),
                  ),
                  onPressed: () {}),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: deviceWidth,
                height: 1,
                color: themeMode ? AppTheme.white32 : AppTheme.black2),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 14.5, 13, 14.5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.white1,
                    ),
                    child: Image.asset("assets/icons/profile.png"),
                  ),
                  SizedBox(width: 13),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "İteme İnşaat ve Tesisat",
                      style: TextStyle(
                        fontSize: 14,
                        height: 1,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w700,
                        color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: TextFormField(
                controller: searchController,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w500,
                    color: themeMode
                        ? AppTheme.black11
                        : AppTheme.white1), // WHILE WRITING
                maxLines: 14,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 36),
                  filled: true,
                  fillColor: themeMode ? AppTheme.white3 : AppTheme.black7,
                  hintText: 'Share something about your company'.tr,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white13,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: themeMode ? AppTheme.white32 : AppTheme.black14,
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: themeMode ? AppTheme.white32 : AppTheme.black14,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
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
                      'Add Photo/Video'.tr,
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
                      'Upload Reels Video'.tr,
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
      ),
    );
  }
}
