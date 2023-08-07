import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/home_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_reels_page_view_widget.dart';

class HomeReelsSubPage extends StatefulWidget {
  const HomeReelsSubPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeReelsSubPage> createState() => _HomeReelsSubPageState();
}

class _HomeReelsSubPageState extends State<HomeReelsSubPage> {
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
    Provider.of<HomePageProvider>(context, listen: false).getReels();
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<HomePageProvider>(
      builder: (context, homeProvider, child) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 128.0,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
          ),
          delegate: SliverChildBuilderDelegate(
              childCount: homeProvider.reelsList.length, (context, index) {
            if (index < homeProvider.reelsList.length) {
              return Container(
                width: 128,
                height: 128,
                color: themeMode ? AppTheme.white4 : AppTheme.black3,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              CustomReelsPageViewWidget(
                            reelsList: homeProvider.reelsList,
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
                    child: (homeProvider.reelsList[index].videos!.isNotEmpty &&
                            homeProvider.reelsList[index].videos![0] != null)
                        ? Image.network(
                            homeProvider.reelsList[index].videos![0]!.image ??
                                'assets/images/image_not_found.jpg',
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/image_not_found.jpg',
                              width: 128,
                              height: 256,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Image.asset(
                            'assets/images/image_not_found.jpg',
                            width: 128,
                            height: 256,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
        );
      },
    );
  }
}
