// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:io';

// import 'package:b2geta_mobile/services/social_services/social_services.dart';
// import 'package:b2geta_mobile/views/customs/custom_pages/custom_comment_page.dart';
// import 'package:b2geta_mobile/views/customs/custom_widgets/custom_gallery_widget.dart';
// import 'package:b2geta_mobile/views/customs/custom_widgets/custom_reels_page_view_widget.dart';
// import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
// import 'package:b2geta_mobile/views/profile/personal/personal_profile_page.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:collection/collection.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/extensions/internacionalization.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';

// import 'package:b2geta_mobile/app_theme.dart';
// import 'package:b2geta_mobile/models/social/feed_model.dart';
// import 'package:b2geta_mobile/providers/home_page_provider.dart';
// import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
// import 'package:b2geta_mobile/providers/theme_provider.dart';
// import 'package:b2geta_mobile/providers/user_provider.dart';
// import 'package:b2geta_mobile/views/customs/custom_pages/custom_story_page.dart';
// import 'package:b2geta_mobile/views/homepage/post/home_post_sub_page.dart';
// import 'package:b2geta_mobile/views/homepage/reels/home_reels_sub_page.dart';
// import 'package:b2geta_mobile/views/homepage/sub_pages/story_add_sub_page.dart';
// import 'package:b2geta_mobile/views/homepage/sub_pages/upload_steps_sub_page.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   late double deviceTopPadding;
//   late double deviceWidth;
//   late double deviceHeight;
//   late bool themeMode;

//   bool isList = false;
//   final ScrollController _storyScrollController = ScrollController();
//   Map<String?, List<FeedModel>> groupStories = {};
//   final TextEditingController _postTextController = TextEditingController();

//   late TabController _tabController;

//   final ImagePicker _picker = ImagePicker();
//   final SocialServices _socialServices = SocialServices();

//   @override
//   void initState() {
//     super.initState();
//     getStories();
//     _tabController = TabController(vsync: this, length: 2);
//     Provider.of<HomePageProvider>(context, listen: false).getFeeds(
//         queryParameters: {
//           "offset": 0.toString(),
//           "limit": 20.toString(),
//           "type": "feed"
//         });

//     Provider.of<HomePageProvider>(context, listen: false).getReels();
//   }

//   Future<void> _getFromGallery() async {
//     await _picker
//         .pickImage(
//       source: ImageSource.gallery,
//     )
//         .then((pickedFile) {
//       if (pickedFile != null) {
//         var image = File(pickedFile.path);

//         Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => StoryAddSubPage(imageFile: image),
//               transitionDuration: const Duration(milliseconds: 0),
//               reverseTransitionDuration: const Duration(milliseconds: 0),
//               transitionsBuilder: (_, a, __, c) =>
//                   FadeTransition(opacity: a, child: c),
//             ));
//       }
//     });
//   }

//   void getStories() async {
//     await Provider.of<HomePageProvider>(context, listen: false).getStory();
//     groupStories = groupStoryByUser();
//   }

//   Map<String?, List<FeedModel>> groupStoryByUser() {
//     var groups =
//         groupBy(Provider.of<HomePageProvider>(context, listen: false).storyList,
//             (FeedModel story) {
//       return story.user!.id;
//     });
//     return groups;
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     deviceTopPadding = MediaQuery.of(context).padding.top;
//     deviceWidth = MediaQuery.of(context).size.width;
//     deviceHeight = MediaQuery.of(context).size.height;
//     themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

//     return Scaffold(
//         backgroundColor: themeMode ? AppTheme.white2 : AppTheme.black12,
//         body: Consumer<HomePageProvider>(
//             builder: (context, HomePageProvider homeProvider, child) {
//           var tabIndex = homeProvider.tabIndex;
//           return DefaultTabController(
//             length: 2,
//             child: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) {
//                 return [
//                   SliverAppBar(
//                     collapsedHeight: 150,
//                     expandedHeight: 150,
//                     flexibleSpace: FlexibleSpaceBar(
//                       background: Container(
//                         color: themeMode ? AppTheme.white1 : AppTheme.black5,
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 70,
//                               width: deviceWidth,
//                               margin:
//                                   const EdgeInsets.only(top: 8.0, bottom: 11.0),
//                               color:
//                                   themeMode ? AppTheme.white1 : AppTheme.black5,
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 11.0),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                             width: 50,
//                                             height: 50,
//                                             margin: const EdgeInsets.only(
//                                               right: 10,
//                                             ),
//                                             child: GestureDetector(
//                                               onTap: () {
//                                                 _getFromGallery();
//                                               },
//                                               child: DottedBorder(
//                                                 color: AppTheme.blue2,
//                                                 borderType: BorderType.Circle,
//                                                 dashPattern: const [6, 6],
//                                                 child: Center(
//                                                     child: Image.asset(
//                                                   "assets/icons/add.png",
//                                                   width: 14.0,
//                                                   height: 14.0,
//                                                 )),
//                                               ),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: SizedBox(
//                                       child: ListView.builder(
//                                         controller: _storyScrollController,
//                                         itemCount: groupStories.keys.length,
//                                         scrollDirection: Axis.horizontal,
//                                         itemBuilder: (context, index) {
//                                           return (groupStories.isNotEmpty)
//                                               ? GestureDetector(
//                                                   onTap: () {
//                                                     Navigator.push(
//                                                         context,
//                                                         PageRouteBuilder(
//                                                           pageBuilder: (_, __,
//                                                                   ___) =>
//                                                               CustomStoryPage(
//                                                             stories:
//                                                                 groupStories
//                                                                     .values
//                                                                     .toList(),
//                                                             index: index,
//                                                           ),
//                                                           transitionDuration:
//                                                               const Duration(
//                                                                   milliseconds:
//                                                                       0),
//                                                           reverseTransitionDuration:
//                                                               const Duration(
//                                                                   milliseconds:
//                                                                       0),
//                                                           transitionsBuilder: (_,
//                                                                   a, __, c) =>
//                                                               FadeTransition(
//                                                                   opacity: a,
//                                                                   child: c),
//                                                         ));
//                                                   },
//                                                   child: Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Container(
//                                                         width: 50,
//                                                         height: 50,
//                                                         margin: const EdgeInsets
//                                                             .only(
//                                                           right: 10,
//                                                         ),
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           border: Border.all(
//                                                             color: const Color(
//                                                                 0XFF29B7D6),
//                                                             width: 2,
//                                                           ),
//                                                         ),
//                                                         child: (groupStories
//                                                                     .values
//                                                                     .toList()[
//                                                                         index]
//                                                                         [0]
//                                                                     .user!
//                                                                     .photo!
//                                                                     .length >
//                                                                 3)
//                                                             ? ClipOval(
//                                                                 child:
//                                                                     CachedNetworkImage(
//                                                                   width: 50,
//                                                                   height: 50,
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                   imageUrl: groupStories
//                                                                       .values
//                                                                       .toList()[
//                                                                           index]
//                                                                           [0]
//                                                                       .user!
//                                                                       .photo!,
//                                                                   errorWidget: (context,
//                                                                           error,
//                                                                           stackTrace) =>
//                                                                       Image
//                                                                           .asset(
//                                                                     "assets/images/dummy_images/user_profile.png",
//                                                                     width: 50,
//                                                                     height: 50,
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                             : ClipOval(
//                                                                 child:
//                                                                     Image.asset(
//                                                                   width: 50,
//                                                                   height: 50,
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                   "assets/images/dummy_images/user_profile.png",
//                                                                 ),
//                                                               ),
//                                                       ),
//                                                       /*   groupStories.values
//                                                               .toList()[index][0]
//                                                               .user!
//                                                               .username!
//                                                               .isNotEmpty
//                                                           ? Text(
//                                                               groupStories.values
//                                                                   .toList()[index]
//                                                                       [0]
//                                                                   .user!
//                                                                   .username!,
//                                                               style: TextStyle(
//                                                                 fontSize: 11,
//                                                                 color: themeMode
//                                                                     ? AppTheme
//                                                                         .black1
//                                                                     : AppTheme
//                                                                         .white1,
//                                                               ))
//                                                           : Text("User Name",
//                                                               style: TextStyle(
//                                                                 fontSize: 11,
//                                                                 color: themeMode
//                                                                     ? AppTheme
//                                                                         .black1
//                                                                     : AppTheme
//                                                                         .white1,
//                                                               )), */
//                                                     ],
//                                                   ),
//                                                 )
//                                               : const SizedBox();
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ), // STORY PANEL
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 13.0),
//                               child: Row(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       context
//                                           .read<NavigationPageProvider>()
//                                           .updateCurrentTabIndex(3);
//                                     },
//                                     child: ClipOval(
//                                       child: Container(
//                                         width: 40,
//                                         height: 40,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: AppTheme.white1,
//                                         ),
//                                         child:
//                                             (Provider.of<UserProvider>(context)
//                                                             .getUser
//                                                             .avatar !=
//                                                         null &&
//                                                     Provider.of<UserProvider>(
//                                                             context)
//                                                         .getUser
//                                                         .avatar!
//                                                         .isNotEmpty)
//                                                 ? CachedNetworkImage(
//                                                     imageUrl:
//                                                         '${context.watch<UserProvider>().getUser.avatar}',
//                                                     fit: BoxFit.cover,
//                                                     errorWidget: (context,
//                                                         error, stackTrace) {
//                                                       return Image.asset(
//                                                         "assets/images/dummy_images/user_profile.png",
//                                                         fit: BoxFit.cover,
//                                                       );
//                                                     },
//                                                   )
//                                                 : Image.asset(
//                                                     "assets/images/dummy_images/user_profile.png",
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 17.0,
//                                   ),
//                                   Expanded(
//                                       child: SizedBox(
//                                     height: 40.0,
//                                     child: TextField(
//                                       readOnly: true,
//                                       controller: _postTextController,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         fontFamily: AppTheme.appFontFamily,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppTheme.white13,
//                                       ),
//                                       decoration: InputDecoration(
//                                         contentPadding:
//                                             const EdgeInsets.fromLTRB(
//                                                 16, 0, 0, 0),
//                                         filled: true,
//                                         fillColor: themeMode
//                                             ? AppTheme.white3
//                                             : AppTheme.black7,
//                                         hintText: 'Homepage Share-1'.tr,
//                                         hintStyle: TextStyle(
//                                           fontSize: 12,
//                                           fontFamily: AppTheme.appFontFamily,
//                                           fontWeight: FontWeight.w600,
//                                           color: AppTheme.white13,
//                                         ),
//                                         floatingLabelBehavior:
//                                             FloatingLabelBehavior.never,
//                                         border: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(41.0),
//                                           borderSide: BorderSide(
//                                               color: themeMode
//                                                   ? AppTheme.white10
//                                                   : AppTheme.black7),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(41.0),
//                                           borderSide: BorderSide(
//                                               color: themeMode
//                                                   ? AppTheme.white10
//                                                   : AppTheme.black7),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(41.0),
//                                           borderSide: BorderSide(
//                                               color: themeMode
//                                                   ? AppTheme.white10
//                                                   : AppTheme.black7),
//                                         ),
//                                       ),
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             PageRouteBuilder(
//                                               pageBuilder: (_, __, ___) =>
//                                                   const UploadStepsSubPage(),
//                                               transitionDuration:
//                                                   const Duration(
//                                                       milliseconds: 0),
//                                               reverseTransitionDuration:
//                                                   const Duration(
//                                                       milliseconds: 0),
//                                               transitionsBuilder:
//                                                   (_, a, __, c) =>
//                                                       FadeTransition(
//                                                           opacity: a, child: c),
//                                             )).then((_) {
//                                           Provider.of<HomePageProvider>(context,
//                                                   listen: false)
//                                               .getFeeds(queryParameters: {
//                                             "offset": "0",
//                                             "limit": "99",
//                                             "type": "feed"
//                                           });
//                                         });
//                                       },
//                                       onSubmitted: (value) async {
//                                         /*  if (_postTextController.text.isNotEmpty) {
//                                           await _socialServices
//                                               .shareCall(
//                                             type: 'feed',
//                                             content:
//                                                 _postTextController.text.trim(),
//                                           )
//                                               .then((value) {
//                                             if (value) {
//                                               _postTextController.clear();
              
//                                               homePageProvider.getFeeds();
//                                             }
//                                           });
//                                         } */
//                                       },
//                                     ),
//                                   )),
//                                   /*  const SizedBox(
//                                     width: 10,
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const UploadStepsSubPage(),
//                                           ));
//                                     },
//                                     child: Image.asset(
//                                       "assets/icons/post_image_add.png",
//                                       width: 20,
//                                       height: 20,
//                                       color: themeMode
//                                           ? AppTheme.white15
//                                           : AppTheme.white1,
//                                     ),
//                                   ), */
//                                 ],
//                               ),
//                             ), // SHARING PANEL
//                             const SizedBox(
//                               height: 14.0,
//                             ),
//                             const Divider(height: 1),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SliverPersistentHeader(
//                     floating: true,
//                     pinned: true,
//                     delegate: MyDelegate(
//                         tabBar: TabBar(
//                             controller: _tabController,
//                             indicatorColor: Colors.transparent,
//                             tabs: [
//                           Tab(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 3),
//                                   child: Image.asset(
//                                     'assets/icons/post.png',
//                                     width: 18,
//                                     height: 18,
//                                     color: themeMode
//                                         ? tabIndex == 0
//                                             ? AppTheme.blue2
//                                             : AppTheme.white15
//                                         : tabIndex == 0
//                                             ? AppTheme.white1
//                                             : AppTheme.white15,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 7,
//                                 ),
//                                 Text(
//                                   'Posts'.tr,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily: AppTheme.appFontFamily,
//                                     fontWeight: FontWeight.w600,
//                                     color: themeMode
//                                         ? tabIndex == 0
//                                             ? AppTheme.blue2
//                                             : AppTheme.white15
//                                         : tabIndex == 0
//                                             ? AppTheme.white1
//                                             : AppTheme.white15,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Tab(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(bottom: 3),
//                                   child: Image.asset(
//                                     'assets/icons/star2.png',
//                                     width: 18,
//                                     height: 18,
//                                     color: themeMode
//                                         ? tabIndex == 1
//                                             ? AppTheme.blue2
//                                             : AppTheme.white15
//                                         : tabIndex == 1
//                                             ? AppTheme.white1
//                                             : AppTheme.white15,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 7,
//                                 ),
//                                 Text(
//                                   // 'Reels'.tr,
//                                   'Play'.tr,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily: AppTheme.appFontFamily,
//                                     fontWeight: FontWeight.w600,
//                                     color: themeMode
//                                         ? tabIndex == 1
//                                             ? AppTheme.blue2
//                                             : AppTheme.white15
//                                         : tabIndex == 1
//                                             ? AppTheme.white1
//                                             : AppTheme.white15,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ])),
//                   )
//                 ];
//               },
//               body: TabBarView(children: [
//                 ListView.builder(
//                   key: const PageStorageKey('key1'),
//                   itemCount: homeProvider.isLoadMore
//                       ? homeProvider.feedsList.length + 1
//                       : homeProvider.feedsList.length,
//                   itemBuilder: (context, index) {
//                     var feed = homeProvider.feedsList[index];
//                     if (homeProvider.feedsList.isNotEmpty) {
//                       if (index == homeProvider.feedsList.length - 1 &&
//                           !homeProvider.isFinished) {
//                         return const Center(
//                           child: CupertinoActivityIndicator(),
//                         );
//                       } else {
//                         return Column(
//                           children: [
//                             Container(
//                               width: deviceWidth,
//                               color:
//                                   themeMode ? AppTheme.white1 : AppTheme.black7,
//                               margin: const EdgeInsets.symmetric(vertical: 6.5),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: 8.0),
//                                   Container(
//                                     width: deviceWidth,
//                                     height: 40,
//                                     margin: const EdgeInsets.only(
//                                         left: 10, top: 10),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               if (Provider.of<UserProvider>(
//                                                           context,
//                                                           listen: false)
//                                                       .getUser
//                                                       .id ==
//                                                   (feed.user!.id ?? '')) {
//                                                 context
//                                                     .read<
//                                                         NavigationPageProvider>()
//                                                     .updateCurrentTabIndex(4);
//                                               } else {
//                                                 Navigator.push(
//                                                     context,
//                                                     PageRouteBuilder(
//                                                       pageBuilder: (_, __, ___) => feed
//                                                                   .user!.type !=
//                                                               'company'
//                                                           ? PersonalProfilePage(
//                                                               userId: feed.user!
//                                                                       .id ??
//                                                                   '')
//                                                           : CompanyProfilePage(
//                                                               userId: feed.user!
//                                                                       .id ??
//                                                                   ''),
//                                                       transitionDuration:
//                                                           const Duration(
//                                                               milliseconds: 0),
//                                                       reverseTransitionDuration:
//                                                           const Duration(
//                                                               milliseconds: 0),
//                                                       transitionsBuilder:
//                                                           (_, a, __, c) =>
//                                                               FadeTransition(
//                                                                   opacity: a,
//                                                                   child: c),
//                                                     ));
//                                               }
//                                             },
//                                             child: Row(
//                                               children: [
//                                                 feed.user!.photo!.isNotEmpty
//                                                     ? ClipOval(
//                                                         child:
//                                                             CachedNetworkImage(
//                                                           width: 40,
//                                                           height: 40,
//                                                           fit: BoxFit.cover,
//                                                           imageUrl:
//                                                               feed.user!.photo!,
//                                                           errorWidget: (context,
//                                                                   error,
//                                                                   stackTrace) =>
//                                                               Image.asset(
//                                                             "assets/images/dummy_images/user_profile.png",
//                                                             width: 40,
//                                                             height: 40,
//                                                             fit: BoxFit.cover,
//                                                           ),
//                                                         ),
//                                                       )
//                                                     : ClipOval(
//                                                         child: Image.asset(
//                                                           width: 40,
//                                                           height: 40,
//                                                           fit: BoxFit.cover,
//                                                           "assets/images/dummy_images/user_profile.png",
//                                                         ),
//                                                       ),
//                                                 const SizedBox(
//                                                   width: 10.0,
//                                                 ),
//                                                 Flexible(
//                                                   flex: 3,
//                                                   child: Text(
//                                                     feed.user!.name ?? "",
//                                                     style: TextStyle(
//                                                       fontSize: 11,
//                                                       fontFamily: AppTheme
//                                                           .appFontFamily,
//                                                       fontWeight:
//                                                           FontWeight.w800,
//                                                       color: themeMode
//                                                           ? AppTheme.blue3
//                                                           : AppTheme.white1,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   ' ${'Homepage Share-2'.tr}',
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                     fontFamily:
//                                                         AppTheme.appFontFamily,
//                                                     fontWeight: FontWeight.w400,
//                                                     color: AppTheme.white15,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         // IconButton(
//                                         //   onPressed: () {},
//                                         //   icon: Image.asset(
//                                         //     "assets/icons/post_menu.png",
//                                         //     color: themeMode
//                                         //         ? AppTheme.blue3
//                                         //         : AppTheme.white12,
//                                         //   ),
//                                         // )
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       left: 14,
//                                       top: 10,
//                                       right: 36,
//                                     ),
//                                     child: Text(
//                                       feed.content!.length > 1
//                                           ? feed.content.toString()
//                                           : "",
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontFamily: AppTheme.appFontFamily,
//                                         fontWeight: FontWeight.w400,
//                                         color: themeMode
//                                             ? AppTheme.black9
//                                             : AppTheme.white9,
//                                       ),
//                                     ),
//                                   ),
//                                   if (feed.images!.isNotEmpty)
//                                     Column(
//                                       children: [
//                                         const SizedBox(
//                                           height: 5.0,
//                                         ),
//                                         SizedBox(
//                                           width: deviceWidth,
//                                           height: 279,
//                                           child: Stack(
//                                             children: [
//                                               InkWell(
//                                                 onTap: () {
//                                                   List<String> imgList = [];

//                                                   for (var i in feed.images!) {
//                                                     imgList
//                                                         .add(i!.url.toString());
//                                                   }

//                                                   Navigator.push(
//                                                       context,
//                                                       PageRouteBuilder(
//                                                         pageBuilder: (_, __,
//                                                                 ___) =>
//                                                             CustomGalleryWidget(
//                                                           urlImages: imgList,
//                                                         ),
//                                                         transitionDuration:
//                                                             const Duration(
//                                                                 milliseconds:
//                                                                     0),
//                                                         reverseTransitionDuration:
//                                                             const Duration(
//                                                                 milliseconds:
//                                                                     0),
//                                                         transitionsBuilder:
//                                                             (_, a, __, c) =>
//                                                                 FadeTransition(
//                                                                     opacity: a,
//                                                                     child: c),
//                                                       ));
//                                                 },
//                                                 child: CachedNetworkImage(
//                                                   imageUrl: feed.images![0]!.url
//                                                       .toString(),
//                                                   width: deviceWidth,
//                                                   fit: BoxFit.cover,
//                                                   errorWidget: (context, error,
//                                                           stackTrace) =>
//                                                       Image.asset(
//                                                     "assets/images/dummy_images/image_not_found.jpg",
//                                                     width: deviceWidth,
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                               Visibility(
//                                                 visible: feed.images!.length > 1
//                                                     ? true
//                                                     : false,
//                                                 child: Positioned(
//                                                   top: 231,
//                                                   right: 20,
//                                                   child: IgnorePointer(
//                                                     child: Container(
//                                                       width: 59,
//                                                       height: 37,
//                                                       decoration: BoxDecoration(
//                                                         color: const Color(
//                                                                 0xFF2F2F2F)
//                                                             .withOpacity(.66),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(13.0),
//                                                       ),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Image.asset(
//                                                             "assets/icons/post_image_add.png",
//                                                             width: 18,
//                                                             height: 18,
//                                                           ),
//                                                           const SizedBox(
//                                                             width: 8,
//                                                           ),
//                                                           Text(
//                                                             (feed.images!
//                                                                         .length -
//                                                                     1)
//                                                                 .toString(),
//                                                             style: TextStyle(
//                                                               fontSize: 12,
//                                                               fontFamily: AppTheme
//                                                                   .appFontFamily,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600,
//                                                               color: AppTheme
//                                                                   .white1,
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   else
//                                     const SizedBox(),
//                                   Container(
//                                     height: 49,
//                                     padding: const EdgeInsets.only(left: 15),
//                                     child: FittedBox(
//                                       fit: BoxFit.none,
//                                       child: Row(
//                                         children: [
//                                           TextButton(
//                                               onPressed: () async {
//                                                 if (feed.likeStatus!) {
//                                                   await _socialServices
//                                                       .feedUnLikeCall(
//                                                           feedId: feed.id!)
//                                                       .then((value) {
//                                                     if (value) {
//                                                       Provider.of<HomePageProvider>(
//                                                               context,
//                                                               listen: false)
//                                                           .getFeeds(
//                                                               queryParameters: {
//                                                             "offset":
//                                                                 0.toString(),
//                                                             "limit":
//                                                                 20.toString(),
//                                                             "type": "feed"
//                                                           });
//                                                     }
//                                                   });
//                                                 } else if (!feed.likeStatus!) {
//                                                   await _socialServices
//                                                       .feedLikeCall(
//                                                           feedId: feed.id!)
//                                                       .then((value) {
//                                                     if (value) {
//                                                       Provider.of<HomePageProvider>(
//                                                               context,
//                                                               listen: false)
//                                                           .getFeeds(
//                                                               queryParameters: {
//                                                             "offset":
//                                                                 0.toString(),
//                                                             "limit":
//                                                                 20.toString(),
//                                                             "type": "feed"
//                                                           });
//                                                     }
//                                                   });
//                                                   setState(() {});
//                                                 }
//                                               },
//                                               child: SizedBox(
//                                                 child: Row(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/icons/like.png",
//                                                       width: 15,
//                                                       height: 15,
//                                                     ),
//                                                     const SizedBox(
//                                                       width: 4.0,
//                                                     ),
//                                                     Text(
//                                                       feed.likeStatus!
//                                                           ? 'Like-2'.tr
//                                                           : 'Like-1'.tr,
//                                                       style: TextStyle(
//                                                         fontSize: 11,
//                                                         fontFamily: AppTheme
//                                                             .appFontFamily,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         color: AppTheme.white15,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )),
//                                           TextButton(
//                                               style: TextButton.styleFrom(),
//                                               onPressed: () {
//                                                 Navigator.push(
//                                                     context,
//                                                     PageRouteBuilder(
//                                                       pageBuilder:
//                                                           (_, __, ___) =>
//                                                               CustomCommentPage(
//                                                         feedId: feed.id!,
//                                                         user: feed.user!,
//                                                         content: feed.content!,
//                                                       ),
//                                                       transitionDuration:
//                                                           const Duration(
//                                                               milliseconds: 0),
//                                                       reverseTransitionDuration:
//                                                           const Duration(
//                                                               milliseconds: 0),
//                                                       transitionsBuilder:
//                                                           (_, a, __, c) =>
//                                                               FadeTransition(
//                                                                   opacity: a,
//                                                                   child: c),
//                                                     ));
//                                               },
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Image.asset(
//                                                     "assets/icons/comment2.png",
//                                                     width: 17.5,
//                                                     height: 17.5,
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 4.0,
//                                                   ),
//                                                   Text(
//                                                     'Comment-1'.tr,
//                                                     style: TextStyle(
//                                                       fontSize: 11,
//                                                       fontFamily: AppTheme
//                                                           .appFontFamily,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       color: AppTheme.white15,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )),
//                                           TextButton(
//                                               onPressed: () {},
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Image.asset(
//                                                     "assets/icons/share.png",
//                                                     width: 18,
//                                                     height: 15,
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 4.0,
//                                                   ),
//                                                   Text(
//                                                     'Homepage Share-3'.tr,
//                                                     style: TextStyle(
//                                                       fontSize: 11,
//                                                       fontFamily: AppTheme
//                                                           .appFontFamily,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       color: AppTheme.white15,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               )),
//                                           TextButton(
//                                               onPressed: () {},
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Image.asset(
//                                                     "assets/icons/save.png",
//                                                     width: 12,
//                                                     height: 15,
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 4.0,
//                                                   ),
//                                                   Text(
//                                                     'Save'.tr,
//                                                     style: TextStyle(
//                                                       fontSize: 11,
//                                                       fontFamily: AppTheme
//                                                           .appFontFamily,
//                                                       fontWeight:
//                                                           FontWeight.w700,
//                                                       color: AppTheme.white15,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ))
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   const Divider(height: 1),
//                                   Container(
//                                     width: deviceWidth,
//                                     padding: const EdgeInsets.only(
//                                         left: 14,
//                                         top: 11,
//                                         bottom: 7,
//                                         right: 11),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             RichText(
//                                               text: TextSpan(
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                     fontFamily:
//                                                         AppTheme.appFontFamily,
//                                                     color: AppTheme.white15,
//                                                   ),
//                                                   children: [
//                                                     TextSpan(
//                                                       text: feed.likes!
//                                                           .toString(),
//                                                       style: const TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                       ),
//                                                     ),
//                                                     TextSpan(
//                                                       text: ' ${'Like-3'.tr}',
//                                                       style: const TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                       ),
//                                                     ),
//                                                   ]),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             RichText(
//                                               text: TextSpan(
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                     fontFamily:
//                                                         AppTheme.appFontFamily,
//                                                     color: AppTheme.white15,
//                                                   ),
//                                                   children: [
//                                                     TextSpan(
//                                                       text: feed
//                                                           .comments!.total!
//                                                           .toString(),
//                                                       style: const TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                       ),
//                                                     ),
//                                                     TextSpan(
//                                                       text:
//                                                           ' ${'Comment-2'.tr}',
//                                                       style: const TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                       ),
//                                                     ),
//                                                   ]),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             RichText(
//                                               text: TextSpan(
//                                                   style: TextStyle(
//                                                     fontSize: 11,
//                                                     fontFamily:
//                                                         AppTheme.appFontFamily,
//                                                     color: AppTheme.white15,
//                                                   ),
//                                                   children: [
//                                                     const TextSpan(
//                                                       text: '0',
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                       ),
//                                                     ),
//                                                     TextSpan(
//                                                       text:
//                                                           ' ${'Homepage Share-4'.tr}',
//                                                       style: const TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w400,
//                                                       ),
//                                                     ),
//                                                   ]),
//                                             ),
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "4s",
//                                               style: TextStyle(
//                                                 fontSize: 11,
//                                                 fontFamily:
//                                                     AppTheme.appFontFamily,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: AppTheme.white15,
//                                               ),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 12.0),
//                                     child: Row(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             context
//                                                 .read<NavigationPageProvider>()
//                                                 .updateCurrentTabIndex(3);
//                                           },
//                                           child: ClipOval(
//                                             child: Container(
//                                               width: 32,
//                                               height: 32,
//                                               decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: AppTheme.white1,
//                                               ),
//                                               child: (Provider.of<UserProvider>(
//                                                                   context)
//                                                               .getUser
//                                                               .avatar !=
//                                                           null &&
//                                                       Provider.of<UserProvider>(
//                                                               context)
//                                                           .getUser
//                                                           .avatar!
//                                                           .isNotEmpty)
//                                                   ? CachedNetworkImage(
//                                                       imageUrl:
//                                                           '${context.watch<UserProvider>().getUser.avatar}',
//                                                       fit: BoxFit.cover,
//                                                       errorWidget: (context,
//                                                           error, stackTrace) {
//                                                         return Image.asset(
//                                                           "assets/images/dummy_images/user_profile.png",
//                                                           fit: BoxFit.cover,
//                                                         );
//                                                       },
//                                                     )
//                                                   : Image.asset(
//                                                       "assets/images/dummy_images/user_profile.png",
//                                                       fit: BoxFit.cover,
//                                                     ),
//                                             ),
//                                           ),
//                                         ),
//                                         const SizedBox(
//                                           width: 11.0,
//                                         ),
//                                         Expanded(
//                                             child: SizedBox(
//                                           height: 32.0,
//                                           child: TextField(
//                                             readOnly: true,
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               fontFamily:
//                                                   AppTheme.appFontFamily,
//                                               fontWeight: FontWeight.w600,
//                                               color: AppTheme.blue3,
//                                             ),
//                                             decoration: InputDecoration(
//                                               contentPadding:
//                                                   const EdgeInsets.fromLTRB(
//                                                       16, 0, 0, 0),
//                                               filled: true,
//                                               fillColor: themeMode
//                                                   ? AppTheme.white3
//                                                   : AppTheme.black7,
//                                               hintText: 'Comment-3'.tr,
//                                               hintStyle: TextStyle(
//                                                 fontSize: 12,
//                                                 fontFamily:
//                                                     AppTheme.appFontFamily,
//                                                 fontWeight: FontWeight.w600,
//                                                 color: themeMode
//                                                     ? AppTheme.blue3
//                                                     : AppTheme.white1,
//                                               ),
//                                               floatingLabelBehavior:
//                                                   FloatingLabelBehavior.never,
//                                               border: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(41.0),
//                                                 borderSide: BorderSide(
//                                                     color: AppTheme.white15),
//                                               ),
//                                               focusedBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(41.0),
//                                                 borderSide: BorderSide(
//                                                     color: AppTheme.white15),
//                                               ),
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(41.0),
//                                                 borderSide: BorderSide(
//                                                     color: AppTheme.white15),
//                                               ),
//                                             ),
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   PageRouteBuilder(
//                                                     pageBuilder: (_, __, ___) =>
//                                                         CustomCommentPage(
//                                                       feedId: feed.id!,
//                                                       user: feed.user!,
//                                                       content: feed.content!,
//                                                     ),
//                                                     transitionDuration:
//                                                         const Duration(
//                                                             milliseconds: 0),
//                                                     reverseTransitionDuration:
//                                                         const Duration(
//                                                             milliseconds: 0),
//                                                     transitionsBuilder:
//                                                         (_, a, __, c) =>
//                                                             FadeTransition(
//                                                                 opacity: a,
//                                                                 child: c),
//                                                   ));
//                                             },
//                                           ),
//                                         )),
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 18.0),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       }
//                     } else {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//                 GridView.builder(
//                   key: const PageStorageKey('key2'),
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 128.0,
//                     mainAxisSpacing: 3.0,
//                     crossAxisSpacing: 3.0,
//                   ),
//                   itemBuilder: (context, index) {
//                     if (index < homeProvider.reelsList.length) {
//                       return Container(
//                         width: 128,
//                         height: 128,
//                         color: themeMode ? AppTheme.white4 : AppTheme.black3,
//                         child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   PageRouteBuilder(
//                                     pageBuilder: (_, __, ___) =>
//                                         CustomReelsPageViewWidget(
//                                       reelsList: homeProvider.reelsList,
//                                       videoUrlIndex: index,
//                                     ),
//                                     transitionDuration:
//                                         const Duration(milliseconds: 0),
//                                     reverseTransitionDuration:
//                                         const Duration(milliseconds: 0),
//                                     transitionsBuilder: (_, a, __, c) =>
//                                         FadeTransition(opacity: a, child: c),
//                                   ));
//                             },
//                             child: CircleAvatar(
//                               child: Text(index.toString()),
//                             )),
//                       );
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 ),
//               ]),
//             ),
//           );
//         }));
//   }

//   Shimmer get getShimmerStoryItem => Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade100,
//         child: Container(
//           width: 50,
//           height: 50,
//           margin: const EdgeInsets.only(
//             right: 10,
//           ),
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//         ),
//       );
// }

// class MyDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar tabBar;
//   MyDelegate({
//     required this.tabBar,
//   });
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//         color: Provider.of<ThemeProvider>(context).themeMode == "light"
//             ? AppTheme.white1
//             : AppTheme.black5,
//         child: tabBar);
//   }

//   @override
//   double get maxExtent => tabBar.preferredSize.height;

//   @override
//   double get minExtent => tabBar.preferredSize.height;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
