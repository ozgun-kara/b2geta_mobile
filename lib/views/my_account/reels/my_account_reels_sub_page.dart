import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_reels_page_view_widget.dart';

class MyAccountReelsSubPage extends StatefulWidget {
  const MyAccountReelsSubPage({Key? key}) : super(key: key);

  @override
  State<MyAccountReelsSubPage> createState() => _MyAccountReelsSubPageState();
}

class _MyAccountReelsSubPageState extends State<MyAccountReelsSubPage> {
  ScrollController scrollController = ScrollController();
  final SocialServices _socialServices = SocialServices();
  List<FeedModel> reelsList = [];

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  @override
  void initState() {
    super.initState();
    getReels();
  }

  void getReels() async {
    await _socialServices.getReelsCall(
        queryParameters: {"offset": "0", "limit": "12", "type": "reels"},
        userId: context
            .read<UserProvider>()
            .getUser
            .id
            .toString()).then((feedList) async {
      reelsList = feedList;
      setState(() {});
    });
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

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 128.0,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
      ),
      delegate: SliverChildBuilderDelegate(childCount: reelsList.length,
          (context, index) {
        return SizedBox(
          width: 128,
          height: 128,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => CustomReelsPageViewWidget(
                      reelsList: reelsList,
                      videoUrlIndex: index,
                    ),
                    transitionDuration: const Duration(milliseconds: 0),
                    reverseTransitionDuration: const Duration(milliseconds: 0),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ));
            },
            child: Center(
              child: Image.asset(
                width: 50,
                height: 50,
                "assets/images/play.png",
              ),
            ),
          ),
        );
      }),
    );
  }
}
