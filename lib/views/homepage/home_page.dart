import 'dart:io';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/enums/user_enum.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/providers/home_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_post_page.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_gallery_widget.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_comment_page.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_reels_page.dart';
import 'package:b2geta_mobile/views/homepage/sub_pages/story_add_sub_page.dart';
import 'package:b2geta_mobile/views/homepage/sub_pages/upload_steps_sub_page.dart';
import 'package:b2geta_mobile/views/homepage/sub_pages/story_sub_page.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:b2geta_mobile/views/profile/personal/personal_profile_page.dart';
import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

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

  Map<String?, List<FeedModel>> groupStories = {};

  final TextEditingController _postTextController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    Provider.of<HomePageProvider>(context, listen: false).getFeeds();
    getStories();
    Provider.of<HomePageProvider>(context, listen: false).getReels();
    super.initState();
  }

  Future<void> _getFromGallery() async {
    await _picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((pickedFile) {
      if (pickedFile != null) {
        var image = File(pickedFile.path);

        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => StoryAddSubPage(imageFile: image),
              transitionDuration: const Duration(milliseconds: 0),
              reverseTransitionDuration: const Duration(milliseconds: 0),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ));
      }
    });
  }

  void getStories() async {
    await _socialServices.getAllStoryCall(
      queryParameters: {"offset": "0", "limit": "35", "type": "story"},
    ).then((feedList) {
      groupStories = groupStoryByUser(feedList);
      setState(() {});
    });
  }

  Map<String?, List<FeedModel>> groupStoryByUser(List<FeedModel> stories) {
    final groups = groupBy(stories, (FeedModel story) {
      return story.user!.id;
    });

    return groups;
  }

  List<String> reelsImageList = [
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
                expandedHeight: 200,
                pinned: true,
                centerTitle: false,
                leading: const SizedBox(),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(0),
                  expandedTitleScale: 1,
                  title: SizedBox(
                    width: deviceWidth,
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
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Image.asset(
                                          'assets/icons/post.png',
                                          width: 18,
                                          height: 18,
                                          color: themeMode
                                              ? tabIndex == 0
                                                  ? AppTheme.blue2
                                                  : AppTheme.white15
                                              : tabIndex == 0
                                                  ? AppTheme.white1
                                                  : AppTheme.white15,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        'Posts'.tr,
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
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: Image.asset(
                                          'assets/icons/star2.png',
                                          width: 18,
                                          height: 18,
                                          color: themeMode
                                              ? tabIndex == 1
                                                  ? AppTheme.blue2
                                                  : AppTheme.white15
                                              : tabIndex == 1
                                                  ? AppTheme.white1
                                                  : AppTheme.white15,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        // 'Reels'.tr,
                                        'Play'.tr,
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
                          height: 70,
                          width: deviceWidth,
                          margin: const EdgeInsets.only(top: 8.0, bottom: 11.0),
                          color: themeMode ? AppTheme.white1 : AppTheme.black5,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 11.0),
                                child: Column(
                                  children: [
                                    Container(
                                        width: 50,
                                        height: 50,
                                        margin: const EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            _getFromGallery();
                                          },
                                          child: DottedBorder(
                                            color: AppTheme.blue2,
                                            borderType: BorderType.Circle,
                                            dashPattern: const [6, 6],
                                            child: Center(
                                                child: Image.asset(
                                              "assets/icons/add.png",
                                              width: 14.0,
                                              height: 14.0,
                                            )),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: groupStories.keys.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return (groupStories.isNotEmpty)
                                          ? GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    PageRouteBuilder(
                                                      pageBuilder:
                                                          (_, __, ___) =>
                                                              StorySubPage(
                                                        stories: groupStories
                                                            .values
                                                            .toList(),
                                                        index: index,
                                                      ),
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      reverseTransitionDuration:
                                                          const Duration(
                                                              milliseconds: 0),
                                                      transitionsBuilder:
                                                          (_, a, __, c) =>
                                                              FadeTransition(
                                                                  opacity: a,
                                                                  child: c),
                                                    ));
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      right: 10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: const Color(
                                                            0XFF29B7D6),
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: (groupStories.values
                                                                .toList()[index]
                                                                    [0]
                                                                .user!
                                                                .photo!
                                                                .length >
                                                            3)
                                                        ? ClipOval(
                                                            child:
                                                                Image.network(
                                                              width: 50,
                                                              height: 50,
                                                              fit: BoxFit.cover,
                                                              groupStories
                                                                  .values
                                                                  .toList()[
                                                                      index][0]
                                                                  .user!
                                                                  .photo!,
                                                              errorBuilder: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                "assets/images/dummy_images/user_profile.png",
                                                                width: 50,
                                                                height: 50,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          )
                                                        : ClipOval(
                                                            child: Image.asset(
                                                              width: 50,
                                                              height: 50,
                                                              fit: BoxFit.cover,
                                                              "assets/images/dummy_images/user_profile.png",
                                                            ),
                                                          ),
                                                  ),
                                                  groupStories.values
                                                          .toList()[index][0]
                                                          .user!
                                                          .username!
                                                          .isNotEmpty
                                                      ? Text(
                                                          groupStories.values
                                                              .toList()[index]
                                                                  [0]
                                                              .user!
                                                              .username!,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 11,
                                                          ))
                                                      : const Text("User Name",
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                          )),
                                                ],
                                              ),
                                            )
                                          : const SizedBox();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.white1,
                                  ),
                                  child: (Provider.of<UserProvider>(context)
                                                  .getUser
                                                  .avatar !=
                                              null &&
                                          Provider.of<UserProvider>(context)
                                              .getUser
                                              .avatar!
                                              .isNotEmpty)
                                      ? Image.network(
                                          'https://api.businessucces.com/${context.watch<UserProvider>().getUser.avatar}',
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              "assets/images/dummy_images/user_profile.png",
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                      : Image.asset(
                                          "assets/images/dummy_images/user_profile.png",
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              const SizedBox(
                                width: 17.0,
                              ),
                              Expanded(
                                  child: SizedBox(
                                height: 40.0,
                                child: TextField(
                                  readOnly: true,
                                  controller: _postTextController,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppTheme.appFontFamily,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white13,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                    filled: true,
                                    fillColor: themeMode
                                        ? AppTheme.white3
                                        : AppTheme.black7,
                                    hintText: 'Homepage Share-1'.tr,
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontFamily: AppTheme.appFontFamily,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.white13,
                                    ),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              const UploadStepsSubPage(),
                                          transitionDuration:
                                              const Duration(milliseconds: 0),
                                          reverseTransitionDuration:
                                              const Duration(milliseconds: 0),
                                          transitionsBuilder: (_, a, __, c) =>
                                              FadeTransition(
                                                  opacity: a, child: c),
                                        ));
                                  },
                                  onSubmitted: (value) async {
                                    /*  if (_postTextController.text.isNotEmpty) {
                                      await _socialServices
                                          .shareCall(
                                        type: 'feed',
                                        content:
                                            _postTextController.text.trim(),
                                      )
                                          .then((value) {
                                        if (value) {
                                          _postTextController.clear();

                                          homePageProvider.getFeeds();
                                        }
                                      });
                                    } */
                                  },
                                ),
                              )),
                              /*  const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UploadStepsSubPage(),
                                      ));
                                },
                                child: Image.asset(
                                  "assets/icons/post_image_add.png",
                                  width: 20,
                                  height: 20,
                                  color: themeMode
                                      ? AppTheme.white15
                                      : AppTheme.white1,
                                ),
                              ), */
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
                          childCount: homePageProvider.reelsList.length,
                          (context, index) {
                        return SizedBox(
                          width: 128,
                          height: 128,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        CustomReelsPage(
                                      reelsList: homePageProvider.reelsList,
                                      videoUrlIndex: index,
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 0),
                                    reverseTransitionDuration:
                                        const Duration(milliseconds: 0),
                                    transitionsBuilder: (_, a, __, c) =>
                                        FadeTransition(opacity: a, child: c),
                                  ));
                            },
                            child: Image.asset(reelsImageList[index]),
                          ),
                        );
                      }),
                    )
                  : const CustomPostPage(userId: ''),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                ),
              )
            ]);
          },
        ));
  }

  Shimmer get getShimmerStoryItem => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(
            right: 10,
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      );
}
