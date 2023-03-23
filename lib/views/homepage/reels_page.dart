import 'package:b2geta_mobile/models/social/feed_model.dart';
import 'package:b2geta_mobile/views/homepage/widget/reels_item_widget.dart';
import 'package:flutter/material.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({
    Key? key,
    required this.reelsList,
    required this.videoUrlIndex,
  }) : super(key: key);
  final List<FeedModel> reelsList;
  final int videoUrlIndex;

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late double deviceWidth;
  late double deviceHeight;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.videoUrlIndex);
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      width: deviceWidth,
      height: deviceHeight,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.reelsList.length,
        itemBuilder: (context, index) {
          return ReelsItemWidget(
              reelsModel: widget.reelsList[index],
              reelsUrl: widget.reelsList[index].videos!.isNotEmpty
                  ? widget.reelsList[index].videos![0]!.url!
                  : "http://videoftp.b2geta.com/reels/2023/02/reels_11022023123709-1676119029.mp4");
        },
      ),
    ));
  }
}
