import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/my_account_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_reels_page_view_widget.dart';

class MyAccountReelsPage extends StatefulWidget {
  const MyAccountReelsPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;

  @override
  State<MyAccountReelsPage> createState() => _MyAccountReelsPageState();
}

class _MyAccountReelsPageState extends State<MyAccountReelsPage> {
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
    Provider.of<MyAccountPageProvider>(context, listen: false)
        .getReels(userId: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Consumer<MyAccountPageProvider>(
      builder: (context, socialProvider, child) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 128.0,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
          ),
          delegate: SliverChildBuilderDelegate(
              childCount: socialProvider.reelsList.length, (context, index) {
            return Container(
              width: 128,
              height: 128,
              color: themeMode ? AppTheme.white4 : AppTheme.black3,
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
                  child: (socialProvider.reelsList[index].videos!.isNotEmpty &&
                          socialProvider.reelsList[index].videos![0] != null &&
                          socialProvider
                              .reelsList[index].videos![0]!.image!.isNotEmpty)
                      ? Image.network(
                          // socialProvider.reelsList[index].videos![0]!.image!,
                          'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
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
          }),
        );
      },
    );
  }
}
