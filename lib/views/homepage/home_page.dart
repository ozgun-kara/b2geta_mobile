import 'dart:io';

import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:b2geta_mobile/providers/home_page_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/utils.dart';
import 'package:b2geta_mobile/views/homepage/more_stories_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  bool isList = false;

  final SocialServices _socialServices = SocialServices();
  List<FeedModel> feeds = [];
  List<FeedModel> stories = [];

  final TextEditingController _postTextController = TextEditingController();
  final TextEditingController _commentTextController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    getFeeds();
    getStories();
  }

  Future<void> _getFromGallery() async {
    PickedFile? pickedFile = await _picker.getImage(
        source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      setState(() {});
    }
  }

  void getFeeds() async {
    await _socialServices.getAllFeedCall(
        queryParameters: {"offset": "0", "limit": "25", "type": "feed"},
        userId: "57").then((feedList) {
      feeds = feedList;
    });
    setState(() {});
  }

  void getStories() async {
    await _socialServices.getAllFeedCall(
        queryParameters: {"offset": "0", "limit": "9", "type": "story"},
        userId: "408").then((feedList) {
      stories = feedList;
      setState(() {});
    });
  }

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
    {
      "isOpen": true,
      "image_name": "assets/images/dummy_images/store_image_4.png",
    },
  ];
  List reelImage = [
    "assets/images/dummy_images/reels_image_1.png",
    "assets/images/dummy_images/reels_image_2.png",
    "assets/images/dummy_images/reels_image_3.png",
    "assets/images/dummy_images/reels_image_4.png",
    "assets/images/dummy_images/reels_image_5.png",
    "assets/images/dummy_images/reels_image_6.png",
    "assets/images/dummy_images/reels_image_7.png",
    "assets/images/dummy_images/reels_image_8.png",
    "assets/images/dummy_images/reels_image_9.png",
    "assets/images/dummy_images/reels_image_1.png",
    "assets/images/dummy_images/reels_image_2.png",
    "assets/images/dummy_images/reels_image_3.png",
    "assets/images/dummy_images/reels_image_4.png",
    "assets/images/dummy_images/reels_image_5.png",
    "assets/images/dummy_images/reels_image_6.png",
    "assets/images/dummy_images/reels_image_7.png",
    "assets/images/dummy_images/reels_image_8.png",
  ];
  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white33 : AppTheme.black24,
      body: Consumer<HomePageProvider>(
        builder: (context, HomePageProvider homePageProvider, child) {
          var tabIndex = homePageProvider.tabIndex;
          return CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
              expandedHeight: 166,
              pinned: true,
              centerTitle: false,
              leading: const SizedBox(),
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
                                        color: themeMode
                                            ? tabIndex == 0
                                                ? AppTheme.blue2
                                                : AppTheme.white15
                                            : tabIndex == 0
                                                ? AppTheme.white1
                                                : AppTheme.white15,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  homePageProvider.updateTabIndex(0);
                                }),
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
                                        color: themeMode
                                            ? tabIndex == 1
                                                ? AppTheme.blue2
                                                : AppTheme.white15
                                            : tabIndex == 1
                                                ? AppTheme.white1
                                                : AppTheme.white15,
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  homePageProvider.updateTabIndex(1);
                                }),
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
                          itemCount: stories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var story = stories[index];

                            return index == 0
                                ? GestureDetector(
                                    onTap: () {
                                      _getFromGallery();
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 11.0),
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
                                            child: _imageFile == null
                                                ? Image.asset(
                                                    "assets/icons/add.png",
                                                    width: 14.0,
                                                    height: 14.0,
                                                  )
                                                : Image.file(
                                                    _imageFile!,
                                                    width: 14.0,
                                                    height: 14.0,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MoreStories(
                                          stories: stories,
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0XFF29B7D6),
                                          width: 2,
                                        ),
                                      ),
                                      child: story.user!.photo == null
                                          ? ClipOval(
                                              child: Image.network(
                                                width: 40,
                                                height: 40,
                                                story.user!.photo!,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  "assets/images/dummy_images/post_profile.png",
                                                ),
                                              ),
                                            )
                                          : ClipOval(
                                              child: Image.asset(
                                                width: 40,
                                                height: 40,
                                                storeImage[index]["image_name"]
                                                    .toString(),
                                              ),
                                            ),
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
                              child: TextField(
                                controller: _postTextController,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white13),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15),
                                  filled: true,
                                  fillColor: themeMode
                                      ? AppTheme.white3
                                      : AppTheme.black7,
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
                                onSubmitted: (value) async {
                                  if (_postTextController.text.isNotEmpty) {
                                    await _socialServices
                                        .feedShareCall(
                                      content: _postTextController.text.trim(),
                                    )
                                        .then((value) {
                                      if (value) {
                                        _postTextController.clear();
                                        getFeeds();
                                      }
                                    });
                                  }
                                },
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
            tabIndex == 1
                ? SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 128.0,
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 3.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        childCount: reelImage.length, (context, index) {
                      return SizedBox(
                        width: 128,
                        height: 128,
                        child: Image.asset(reelImage[index]),
                      );
                    }),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: feeds.length,
                      (context, index) {
                        var feed = feeds[index];
                        return Container(
                          width: deviceWidth,
                          color: themeMode ? AppTheme.white1 : AppTheme.black7,
                          margin: const EdgeInsets.symmetric(vertical: 6.5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                width: deviceWidth,
                                height: 40,
                                margin:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        feed.user!.photo != null
                                            ? ClipOval(
                                                child: Image.network(
                                                  width: 40,
                                                  height: 40,
                                                  feed.user!.photo!,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    "assets/images/dummy_images/post_profile.png",
                                                  ),
                                                ),
                                              )
                                            : ClipOval(
                                                child: Image.asset(
                                                  width: 40,
                                                  height: 40,
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
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      feed.user!.name ?? "Name",
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
                                        color: themeMode
                                            ? AppTheme.blue3
                                            : AppTheme.white12,
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
                                  feed.content!.length > 1
                                      ? feed.content.toString()
                                      : "TEST POST",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: themeMode
                                        ? AppTheme.black9
                                        : AppTheme.white9,
                                  ),
                                ),
                              ),
                              if (feed.images!.isNotEmpty)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    SizedBox(
                                      width: deviceWidth,
                                      height: 279,
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            feed.images![0]!.url.toString(),
                                            width: deviceWidth,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              "assets/images/dummy_images/post_image_1.png",
                                              width: deviceWidth,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Positioned(
                                            top: 231,
                                            right: 20,
                                            child: Container(
                                              width: 59,
                                              height: 37,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF2F2F2F)
                                                    .withOpacity(.66),
                                                borderRadius:
                                                    BorderRadius.circular(13.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/icons/post_image_add.png",
                                                    width: 18,
                                                    height: 18,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "8",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: AppTheme
                                                          .appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppTheme.white1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              else
                                const SizedBox(),
                              Container(
                                height: 49,
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          if (feed.likeStatus!) {
                                            _socialServices.feedUnLikeCall(
                                                feedId: feed.id!);
                                          } else {
                                            _socialServices.feedLikeCall(
                                                feedId: feed.id!);
                                          }
                                          getFeeds();
                                        },
                                        child: SizedBox(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                feed.likeStatus!
                                                    ? "Beğendin"
                                                    : "Beğen",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily:
                                                      AppTheme.appFontFamily,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppTheme.white15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    TextButton(
                                        style: TextButton.styleFrom(),
                                        onPressed: () {},
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                          ],
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                fontWeight: FontWeight.w700,
                                                color: AppTheme.white15,
                                              ),
                                            ),
                                          ],
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                fontFamily:
                                                    AppTheme.appFontFamily,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontFamily:
                                                    AppTheme.appFontFamily,
                                                color: AppTheme.white15,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: feed.likes!.toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const TextSpan(
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
                                                fontFamily:
                                                    AppTheme.appFontFamily,
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
                                                fontFamily:
                                                    AppTheme.appFontFamily,
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
                                ),
                              ),
                              feed.comments!.comments!.isEmpty
                                  ? _writeComment(feed: feed)
                                  : feed.comments!.comments!.length <= 1
                                      ? Column(
                                          children: [
                                            _comment(feed: feed, index: 0),
                                            _writeComment(feed: feed),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                isList = !isList;

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: deviceWidth,
                                                padding: const EdgeInsets.only(
                                                    left: 14,
                                                    top: 11,
                                                    bottom: 15),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                        fontFamily: AppTheme
                                                            .appFontFamily,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: themeMode
                                                            ? AppTheme.blue2
                                                            : AppTheme.white1,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            _comment(feed: feed, index: 0),
                                            isList
                                                ? SizedBox(
                                                    height: 250,
                                                    child: ListView.builder(
                                                        itemCount: feed
                                                            .comments!
                                                            .comments!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          if (index != 0) {
                                                            return _comment(
                                                                feed: feed,
                                                                index: index);
                                                          }
                                                          return const SizedBox();
                                                        }),
                                                  )
                                                : const SizedBox(),
                                            _writeComment(feed: feed),
                                          ],
                                        ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
              ),
            )
          ]);
        },
      ),
    );
  }

  Widget _writeComment({required FeedModel feed}) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 18.0),
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
              child: TextField(
                controller: _commentTextController,
                style: TextStyle(
                    fontSize: 11,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.white13),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 14, top: 11),
                  filled: true,
                  fillColor:
                      themeMode ? const Color(0XFFFAFBFE) : AppTheme.black7,
                  hintText: "Yorum yaz",
                  hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w600,
                      color: themeMode ? AppTheme.blue3 : AppTheme.white1),
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
                onSubmitted: (value) async {
                  if (_commentTextController.text.isNotEmpty) {
                    await _socialServices
                        .createCommentCall(
                      feedId: feed.id!,
                      content: _commentTextController.text.trim(),
                    )
                        .then((value) {
                      if (value) {
                        _commentTextController.clear();
                        getFeeds();
                      }
                    });
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _comment({required FeedModel feed, required int index}) {
    return Container(
      width: deviceWidth,
      padding: const EdgeInsets.only(left: 12, bottom: 24.0),
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
                child: Image.asset("assets/icons/comment-profile.png"),
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
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        feed.comments!.comments![index]!.content!,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.appFontFamily,
                          fontWeight: FontWeight.w400,
                          color: themeMode ? AppTheme.blue3 : AppTheme.white1,
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
                        color: themeMode ? AppTheme.blue3 : AppTheme.white15,
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
                        color: themeMode ? AppTheme.blue3 : AppTheme.white15,
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
                        color: themeMode ? AppTheme.blue3 : AppTheme.white15,
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
    );
  }
}
