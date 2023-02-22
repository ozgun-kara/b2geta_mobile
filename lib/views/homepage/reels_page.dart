import 'package:b2geta_mobile/views/homepage/widget/reels_item_widget.dart';
import 'package:flutter/material.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late double deviceWidth;
  late double deviceHeight;

  final List<String> urls = const [
    "https://b2geta-vod.ercdn.net/videos/reels/2023/02/reels_20022023144330-1676900610.mp4",
    "https://b2geta-vod.ercdn.net/videos/reels/2023/02/reels_19022023174338-1676825018.mp4",
    "https://b2geta-vod.ercdn.net/videos/reels/2023/02/reels_15022023154654-1676472414.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      width: deviceWidth,
      height: deviceHeight,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: urls.length,
        itemBuilder: (context, index) {
          return ReelsItemWidget(
            url: urls[index],
          );
        },
      ),
    ));
  }
}
