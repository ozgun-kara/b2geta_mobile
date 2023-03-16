import 'dart:io';
import 'dart:math';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/menu_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:path/path.dart' as path;

class AddProductImageSubPage extends StatefulWidget {
  const AddProductImageSubPage({Key? key}) : super(key: key);

  @override
  State<AddProductImageSubPage> createState() => _AddProductImageSubPageState();
}

class _AddProductImageSubPageState extends State<AddProductImageSubPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  ScrollController scrollController = ScrollController();
  final ImagePicker imagePicker = ImagePicker();

  void selectImages() async {
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage();

    final List<File> selectedImages =
        pickedFiles.map<File>((xfile) => File(xfile.path)).toList();

    if (selectedImages.isNotEmpty) {
      Provider.of<MenuPageProvider>(context, listen: false)
          .updateSelectedImageFilesList(selectedImages);
    }
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: 1,
              color: themeMode ? AppTheme.white21 : AppTheme.black28,
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    'Add Product Image'.tr,
                    style: TextStyle(
                      fontFamily: AppTheme.appFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                    ),
                  ),
                  SizedBox(height: 41),
                  MaterialButton(
                      minWidth: deviceWidth,
                      height: 52,
                      elevation: 0,
                      color: AppTheme.blue2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: EdgeInsets.fromLTRB(56, 43, 56, 38),
                      child: Column(
                        children: [
                          Text(
                            'Add Product Image Info-1'.tr,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.white1),
                          ),
                          const SizedBox(height: 28),
                          Image.asset(
                            "assets/icons/mdi_cloud-upload-outline.png",
                            width: 116,
                            height: 116,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 28),
                          Text(
                            'Add Product Image Info-2'.tr,
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.white1),
                          ),
                        ],
                      ),
                      onPressed: () {
                        selectImages();
                      }),
                  SizedBox(height: 21),
                  Consumer<MenuPageProvider>(
                    builder: (context, menuPageProvider, child) {
                      return Visibility(
                        visible: menuPageProvider.imageFilesList!.isNotEmpty,
                        child: ListView.separated(
                          controller: scrollController,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: menuPageProvider.imageFilesList!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 11);
                          },
                          itemBuilder: ((context, index) {
                            var image = menuPageProvider.imageFilesList![index];

                            String imageName =
                                path.basename(image.path).substring(12);

                            final file = File(image.path);
                            String imageSize =
                                formatBytes(file.lengthSync(), 2);

                            return Container(
                              width: deviceWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  width: 1,
                                  color: themeMode
                                      ? AppTheme.white10
                                      : AppTheme.black28,
                                ),
                                color: themeMode
                                    ? AppTheme.white5
                                    : Colors.transparent,
                              ),
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    color: AppTheme.white10,
                                    child: Center(
                                      child: Image.file(
                                        File(image.path),
                                        width: 59,
                                        height: 59,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          imageName,
                                          style: TextStyle(
                                            fontFamily: AppTheme.appFontFamily,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            color: themeMode
                                                ? AppTheme.blue3
                                                : AppTheme.white1,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        imageSize,
                                        style: TextStyle(
                                          fontFamily: AppTheme.appFontFamily,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.white15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    splashRadius: 24,
                                    icon: Image.asset(
                                      'assets/icons/tabler_trash.png',
                                      width: 24,
                                      height: 24,
                                      color: themeMode
                                          ? AppTheme.blue2
                                          : AppTheme.white15,
                                    ),
                                    onPressed: () {
                                      menuPageProvider
                                          .deleteSelectedImage(image);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 28),
                  MaterialButton(
                      minWidth: deviceWidth,
                      height: 52,
                      elevation: 0,
                      color: AppTheme.green1,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        'Add Product'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white1),
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
