import 'package:b2geta_mobile/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../app_theme.dart';
import '../../providers/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  List<Map<String, Object>> storeImage = [
    {
      "isOpen": false,
      "image_name": "",
    },
    {
      "isOpen": false,
      "image_name": "assets/images/dummy_images/store_image_1.png",
    },
    {
      "isOpen": false,
      "image_name": "assets/images/dummy_images/store_image_2.png",
    },
    {
      "isOpen": false,
      "image_name": "assets/images/dummy_images/store_image_3.png",
    },
    {
      "isOpen": true,
      "image_name": "assets/images/dummy_images/store_image_4.png",
    },
    {
      "isOpen": true,
      "image_name": "assets/images/dummy_images/store_image_1.png",
    },
    {
      "isOpen": true,
      "image_name": "assets/images/dummy_images/store_image_2.png",
    },
    {
      "isOpen": true,
      "image_name": "assets/images/dummy_images/store_image_3.png",
    },
    {
      "isOpen": true,
      "image_name": "assets/images/dummy_images/store_image_4.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white33 : AppTheme.black24,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          expandedHeight: 166,
          pinned: true,
          centerTitle: false,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.all(0),
            expandedTitleScale: 1,
            title: Container(
              width: deviceWidth,
              color: Colors.amber,
              child: Container(
                color: themeMode ? AppTheme.white1 : AppTheme.black5,
                width: deviceWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonTheme(
                        height: 43,
                        child: MaterialButton(
                            elevation: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  fit: BoxFit.none,
                                  child: Image.asset(
                                    'assets/icons/post.png',
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.5,
                                ),
                                Text(
                                  "Postlar",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.blue2,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    Expanded(
                      child: ButtonTheme(
                        height: 43,
                        child: MaterialButton(
                            elevation: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FittedBox(
                                  fit: BoxFit.none,
                                  child: Image.asset(
                                    'assets/icons/star2.png',
                                    width: 15,
                                    height: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.5,
                                ),
                                Text(
                                  "Reels",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white15,
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            background: Container(
              color: themeMode ? AppTheme.white1 : AppTheme.black5,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.only(top: 8.0, bottom: 11.0),
                    color: themeMode ? AppTheme.white1 : AppTheme.black5,
                    child: ListView.builder(
                      itemCount: storeImage.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return index == 0
                            ? Padding(
                                padding: const EdgeInsets.only(left: 11.0),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                  ),
                                  child: DottedBorder(
                                    color: AppTheme.blue2,
                                    borderType: BorderType.Circle,
                                    dashPattern: const [6, 6],
                                    child: Center(
                                      child: Image.asset(
                                        "assets/icons/add.png",
                                        width: 14.0,
                                        height: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 50,
                                height: 50,
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: storeImage[index]["isOpen"] as bool
                                        ? AppTheme.white1
                                        : const Color(0XFF29B7D6),
                                    width: 2,
                                  ),
                                ),
                                child: Image.asset(
                                  storeImage[index]["image_name"].toString(),
                                  fit: BoxFit.contain,
                                ),
                              );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
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
                        const SizedBox(
                          width: 17.0,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 40.0,
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 11,
                                fontFamily: AppTheme.appFontFamily,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.white13),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(15),
                              filled: true,
                              fillColor:
                                  themeMode ? AppTheme.white3 : AppTheme.black7,
                              hintText:
                                  "Firman hakkında takipçilerinle bir şeyler paylaş.",
                              hintStyle: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.white13),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(41.0),
                                borderSide: BorderSide(
                                    color: themeMode
                                        ? AppTheme.white10
                                        : AppTheme.black7),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(41.0),
                                borderSide: BorderSide(
                                    color: themeMode
                                        ? AppTheme.white10
                                        : AppTheme.black7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(41.0),
                                borderSide: BorderSide(
                                    color: themeMode
                                        ? AppTheme.white10
                                        : AppTheme.black7),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  const Divider(height: 1),
                ],
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 10,
          (context, index) {
            return Container(
              width: deviceWidth,
              color: themeMode ? AppTheme.white1 : AppTheme.black7,
              child: Column(
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    width: deviceWidth,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                "assets/images/dummy_images/post_profile.png",
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Özturanlar Mobilya',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white1,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' gönderi paylaştı.',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppTheme.white15,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/post_menu.png",
                            color:
                                themeMode ? AppTheme.blue3 : AppTheme.white12,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      top: 10,
                      right: 36,
                    ),
                    child: Text(
                      "Build secure apps on top of ANY database or API faster t",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w400,
                        color: themeMode ? AppTheme.black9 : AppTheme.white9,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    width: deviceWidth,
                    height: 279,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/dummy_images/post_image_1.png",
                          fit: BoxFit.cover,
                          height: 279,
                        ),
                        Positioned(
                          top: 220,
                          left: deviceWidth - 80.0,
                          child: Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2F2F2F).withOpacity(.66),
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/post_image_add.png",
                                  width: 18,
                                  height: 18,
                                ),
                                Text(
                                  "8",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 49,
                    margin: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/like.png",
                                  width: 15,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "Beğen",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.white15,
                                  ),
                                ),
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/comment2.png",
                                  width: 17.5,
                                  height: 17.5,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "Yorum yap",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.white15,
                                  ),
                                ),
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/share.png",
                                  width: 18,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "Paylaş",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.white15,
                                  ),
                                ),
                              ],
                            )),
                        TextButton(
                            onPressed: () {},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/icons/save.png",
                                  width: 12,
                                  height: 15,
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "Kaydet",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.white15,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Container(
                      width: deviceWidth,
                      padding: const EdgeInsets.only(
                          left: 14, top: 11, bottom: 7, right: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      color: AppTheme.white15,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: '1.741',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Beğeni',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      color: AppTheme.white15,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: '48',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Yorum',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      color: AppTheme.white15,
                                    ),
                                    children: const [
                                      TextSpan(
                                        text: '93',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Paylaşım',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "4s",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.white15,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                  Container(
                    width: deviceWidth,
                    padding: const EdgeInsets.only(left: 14, top: 11),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/icons/read-more.png",
                          width: 14.58,
                          height: 16.58,
                          color: const Color(
                            0xFFB3BDCB,
                          ),
                        ),
                        const SizedBox(
                          width: 9.42,
                        ),
                        Text(
                          "Önceki yorumları gör",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w700,
                            color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: deviceWidth,
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.white1,
                              ),
                              child: Image.asset(
                                  "assets/icons/comment-profile.png"),
                            ),
                            const SizedBox(
                              width: 11.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 13,
                                  top: 13,
                                  bottom: 9,
                                ),
                                margin: const EdgeInsets.only(right: 13),
                                decoration: BoxDecoration(
                                  color: themeMode
                                      ? const Color(0xFFF4FBFC)
                                      : const Color(0xFF575B7D),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Say Reklamcılık",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w700,
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white1,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Text(
                                      "2005 yılında Tuzla’da temeli atılan",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: AppTheme.appFontFamily,
                                        fontWeight: FontWeight.w400,
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9.0,
                        ),
                        Container(
                          width: deviceWidth,
                          padding: const EdgeInsets.only(left: 71, right: 23),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Beğen",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Yanıtla",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white15,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "4s",
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w400,
                                      color: themeMode
                                          ? AppTheme.blue3
                                          : AppTheme.white15,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/like.png",
                                    width: 11,
                                    height: 10,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "1.741",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.white15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.white1,
                          ),
                          child: Image.asset("assets/icons/profile.png"),
                        ),
                        const SizedBox(
                          width: 11.0,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 32.0,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.white13),
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 14, top: 11),
                                filled: true,
                                fillColor: themeMode
                                    ? const Color(0XFFFAFBFE)
                                    : AppTheme.black7,
                                hintText: "Yorum yaz",
                                hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: themeMode
                                        ? AppTheme.blue3
                                        : AppTheme.white1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(41.0),
                                  borderSide: BorderSide(
                                    color: themeMode
                                        ? const Color(0xFFE2E7F8)
                                        : const Color(0xFF65688A),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(41.0),
                                  borderSide: BorderSide(
                                    color: themeMode
                                        ? const Color(0xFFE2E7F8)
                                        : const Color(0xFF65688A),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(41.0),
                                  borderSide: BorderSide(
                                    color: themeMode
                                        ? const Color(0xFFE2E7F8)
                                        : const Color(0xFF65688A),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  )
                ],
              ),
            );
          },
        ))
      ]),
    );
  }
}
