import 'dart:io';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryAddSubPage extends StatefulWidget {
  const StoryAddSubPage({
    Key? key,
    required this.imageFile,
  }) : super(key: key);
  final File imageFile;

  @override
  State<StoryAddSubPage> createState() => _StoryAddSubPageState();
}

class _StoryAddSubPageState extends State<StoryAddSubPage> {
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
                  await _socialServices.shareCall(
                      type: 'story',
                      // images: widget.imageFile

                      images: [widget.imageFile]).then((value) {
                    if (value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const NavigationPage(),
                            transitionDuration: const Duration(milliseconds: 0),
                            reverseTransitionDuration:
                                const Duration(milliseconds: 0),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
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
