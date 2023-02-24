import 'dart:io';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/home_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

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

  TextEditingController commentController = TextEditingController();

  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     // setState(() => this.successImage = imageTemp);
  //     Provider.of<HomePageProvider>(context, listen: false)
  //         .updateSelectedImage(imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  // final ImagePicker imgPicker = ImagePicker();
  // List<XFile>? imageFilesList;

  openImages() async {
    try {
      var pickedFiles = await ImagePicker().pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedFiles != null) {
        // imageFilesList = pickedFiles;
        // setState(() {});

        Provider.of<HomePageProvider>(context, listen: false)
            .updateSelectedImageFilesList(pickedFiles);
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black5,
          appBar: provider.uploadStep == 0
              ? firstAppBar(themeMode)
              : provider.uploadStep == 1
                  ? secondAppBar(themeMode)
                  : provider.uploadStep == 2
                      ? thirdAppBar(themeMode)
                      : fourthAppBar(themeMode),
          body: provider.uploadStep == 0
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          width: deviceWidth,
                          height: 1,
                          color:
                              themeMode ? AppTheme.white32 : AppTheme.black2),
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
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: TextFormField(
                          controller: commentController,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: AppTheme.appFontFamily,
                              fontWeight: FontWeight.w500,
                              color: themeMode
                                  ? AppTheme.black11
                                  : AppTheme.white1), // WHILE WRITING
                          maxLines: 14,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(16, 0, 16, 36),
                            filled: true,
                            fillColor:
                                themeMode ? AppTheme.white3 : AppTheme.black7,
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
                                  color: themeMode
                                      ? AppTheme.white32
                                      : AppTheme.black14,
                                  width: 1,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: themeMode
                                      ? AppTheme.white32
                                      : AppTheme.black14,
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: themeMode
                                    ? AppTheme.blue2
                                    : AppTheme.white1,
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
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            provider.updateUploadType('Post');
                            provider.updateUploadStep(1);
                          }),
                      Container(
                          width: deviceWidth,
                          height: 1,
                          color:
                              themeMode ? AppTheme.white32 : AppTheme.black2),
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
                                    "assets/icons/reels-upload.png",
                                    width: 18,
                                    height: 18,
                                    color: AppTheme.red5),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Upload Reels Video'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: themeMode
                                      ? AppTheme.blue3
                                      : AppTheme.white1,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            provider.updateUploadType('Reels');
                            provider.updateUploadStep(1);
                          }),
                    ],
                  ),
                )
              : provider.uploadStep == 1
                  ? Container(
                      child: provider.uploadType == 'Post'
                          ? SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                        child: provider.imageFilesList == null
                                            ? Column(
                                                children: [
                                                  SizedBox(height: 100),
                                                  Center(
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/icons/mdi_cloud-upload-outline.png",
                                                          width: 58,
                                                          height: 58,
                                                        ),
                                                        SizedBox(height: 8),
                                                        SizedBox(
                                                          width: 212,
                                                          child: Text(
                                                            'Maximum File Size Info'
                                                                .tr,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                fontFamily: AppTheme
                                                                    .appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: themeMode
                                                                    ? AppTheme
                                                                        .blue2
                                                                    : AppTheme
                                                                        .white1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 176),
                                                ],
                                              )
                                            : Wrap(
                                                spacing: 3,
                                                runSpacing: 3,
                                                children: provider
                                                    .imageFilesList!
                                                    .map((image) {
                                                  return Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        child: Image.file(
                                                          File(image.path),
                                                          width: 128,
                                                          height: 128,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 3,
                                                        right: 3,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4)),
                                                          child: Material(
                                                            color:
                                                                AppTheme.white1,
                                                            child: InkWell(
                                                              onTap: () {
                                                                // provider.deleteSelectedImage();

                                                                // provider
                                                                //     .imageFilesList!
                                                                //     .remove(
                                                                //         imageone);

                                                                provider
                                                                    .deleteSelectedImage(
                                                                        image);
                                                              },
                                                              child: SizedBox(
                                                                width: 24,
                                                                height: 24,
                                                                child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/icons/trash.png',
                                                                    width: 14,
                                                                    height: 16,
                                                                    color: AppTheme
                                                                        .blue2,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }).toList(),
                                              )),
                                    Container(
                                        child: provider.imageFilesList == null
                                            ? MaterialButton(
                                                height: 47,
                                                color: AppTheme.blue2,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(9)),
                                                ),
                                                elevation: 0,
                                                child: Text(
                                                  'Select From Gallery'.tr,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppTheme.white1),
                                                ),
                                                onPressed: () {
                                                  // pickImage();

                                                  openImages();
                                                })
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        26, 114, 26, 26),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: MaterialButton(
                                                          height: 47,
                                                          color: AppTheme.blue2,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                          ),
                                                          elevation: 0,
                                                          child: Text(
                                                            'Add More'.tr,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily: AppTheme
                                                                    .appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppTheme
                                                                    .white1),
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                    SizedBox(width: 8),
                                                    Expanded(
                                                      child: MaterialButton(
                                                          height: 47,
                                                          color:
                                                              AppTheme.green1,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            9)),
                                                          ),
                                                          elevation: 0,
                                                          child: Text(
                                                            'Upload'.tr,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily: AppTheme
                                                                    .appFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppTheme
                                                                    .white1),
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                    SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            ))
                  : provider.uploadStep == 2
                      ? SingleChildScrollView(
                          child: Column(
                            children: [],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [],
                          ),
                        ),
        );
      },
    );
  }

  PreferredSizeWidget firstAppBar(themeMode) {
    return AppBar(
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
        ]);
  }

  PreferredSizeWidget secondAppBar(themeMode) {
    return AppBar(
        toolbarHeight: 58,
        backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
        elevation: 0,
        leading: SizedBox(),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Text(
            Provider.of<HomePageProvider>(context).uploadType == 'Post'
                ? 'Add Photo/Video'.tr
                : 'Upload Reels Video'.tr,
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
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/cross.png',
                width: 19,
                height: 19,
              ),
              onPressed: () {
                Provider.of<HomePageProvider>(context, listen: false)
                    .updateUploadStep(0);
              },
            ),
          ),
        ]);
  }

  PreferredSizeWidget thirdAppBar(themeMode) {
    return AppBar(
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
        ]);
  }

  PreferredSizeWidget fourthAppBar(themeMode) {
    return AppBar(
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
        ]);
  }
}
