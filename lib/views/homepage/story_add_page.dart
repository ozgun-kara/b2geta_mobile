import 'dart:io';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryAddPage extends StatefulWidget {
  const StoryAddPage({
    Key? key,
    required this.imageFile,
  }) : super(key: key);
  final File imageFile;

  @override
  State<StoryAddPage> createState() => _StoryAddPageState();
}

class _StoryAddPageState extends State<StoryAddPage> {
  final SocialServices _socialServices = SocialServices();

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.imageFile.path.capitalize.toString());
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.file(
              widget.imageFile,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 20,
            top: 35,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                "assets/icons/close.png",
                width: 25,
                height: 25,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 35,
            child: MaterialButton(
                height: 47,
                color: AppTheme.green1,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                elevation: 0,
                child: Text(
                  'Upload'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.white1),
                ),
                onPressed: () async {
                  await _socialServices
                      .shareStoryCall(image: widget.imageFile)
                      .then((value) {
                    if (value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationPage(),
                          ),
                          (route) => false);
                    }
                  });
                }),
          ),
        ],
      ),
    );
  }
}
