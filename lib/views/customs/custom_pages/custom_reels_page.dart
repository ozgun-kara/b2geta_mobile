import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/providers/social_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_reels_page_view_widget.dart';

class CustomReelsPage extends StatefulWidget {
  const CustomReelsPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  State<CustomReelsPage> createState() => _CustomReelsPageState();
}

class _CustomReelsPageState extends State<CustomReelsPage> {
  ScrollController scrollController = ScrollController();

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
    Provider.of<SocialProvider>(context, listen: false)
        .getReels(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<SocialProvider>(
      builder: (context, socialProvider, child) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 128.0,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
          ),
          delegate: SliverChildBuilderDelegate(
              childCount: socialProvider.reelsList.length, (context, index) {
            return SizedBox(
              width: 128,
              height: 128,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => CustomReelsPageViewWidget(
                          reelsList: socialProvider.reelsList,
                          videoUrlIndex: index,
                        ),
                        transitionDuration: const Duration(milliseconds: 0),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 0),
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
      },
    );
  }
}
