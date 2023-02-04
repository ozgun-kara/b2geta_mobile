import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late double deviceWidth;
  late double deviceHeight;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            widget.imageUrl,
            fit: BoxFit.cover,
            width: deviceWidth,
            height: deviceHeight,
          ),
          Positioned(
            top: 22,
            left: 21,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/icons/close.png",
                width: 19,
                height: 19,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 21,
            child: Row(children: [
              ClipOval(
                child: Image.asset(
                  "assets/images/dummy_images/post_profile.png",
                  width: 43,
                  height: 43,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 189,
                    child: Text(
                      "SİLVERLİNE ENDÜSTRİ VE TİCARET A. Ş",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1,
                        fontSize: 13,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "İstanbul, Türkiye",
                    style: TextStyle(
                      height: 1,
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.white15,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
