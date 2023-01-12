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
  // TabController _tabController =TabController(length: 2, vsync: vsync)

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
      backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black24,
      body: Column(
        children: [
          Container(
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
                      // ignore: prefer_const_constructors
                      SizedBox(
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
                const Divider(),
              ],
            ),
          ),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  color: themeMode ? AppTheme.white1 : AppTheme.black5,
                  width: deviceWidth,
                  height: 48,
                  child: TabBar(
                      indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide.none),
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/icons/posts.png"),
                              const SizedBox(
                                width: 8.5,
                              ),
                              Text(
                                "Postlar",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: themeMode
                                      ? AppTheme.blue2
                                      : AppTheme.white1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Tab(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/icons/reels.png"),
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
                            ),
                          ],
                        )),
                      ]),
                ),
                // TabBarView(children: [])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
