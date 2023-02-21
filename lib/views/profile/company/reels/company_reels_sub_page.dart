import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/views/homepage/reels_page.dart';

class CompanyReelsSubPage extends StatefulWidget {
  const CompanyReelsSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyReelsSubPage> createState() => _CompanyReelsSubPageState();
}

class _CompanyReelsSubPageState extends State<CompanyReelsSubPage> {
  ScrollController scrollController = ScrollController();

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

  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

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
      delegate: SliverChildBuilderDelegate(childCount: reelImage.length,
          (context, index) {
        return SizedBox(
          width: 128,
          height: 128,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReelsPage(
                      imageUrl: reelImage[index],
                    ),
                  ));
            },
            child: Image.asset(reelImage[index]),
          ),
        );
      }),
    );
  }
}
