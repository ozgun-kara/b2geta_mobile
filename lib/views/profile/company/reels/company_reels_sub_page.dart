import 'dart:io';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/feed_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/views/homepage/reels_page.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CompanyReelsSubPage extends StatefulWidget {
  const CompanyReelsSubPage({Key? key}) : super(key: key);

  @override
  State<CompanyReelsSubPage> createState() => _CompanyReelsSubPageState();
}

class _CompanyReelsSubPageState extends State<CompanyReelsSubPage> {
  ScrollController scrollController = ScrollController();
  final SocialServices _socialServices = SocialServices();
  List<FeedModel> reelsList = [];
  List<String?> reelsImageList = [];
  String? _thumbnailUrl;

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
    await _socialServices.getAllReelsCall(
      queryParameters: {"offset": "0", "limit": "12", "type": "reels"},
    ).then((feedList) async {
      reelsList = feedList;
      for (var element in reelsList) {
        await generateThumbnail(
                url: element.videos!.isNotEmpty
                    ? element.videos![0]!.url!
                    : 'http://videoftp.b2geta.com/reels/2023/02/reels_11022023123709-1676119029.mp4')
            .then((value) => reelsImageList.add(value));
      }
      setState(() {});
    });
  }

  Future<String?> generateThumbnail({required String url}) async {
    _thumbnailUrl = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: (await getTemporaryDirectory()).path,
    );
    return _thumbnailUrl;
  }

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
                  MaterialPageRoute(
                    builder: (context) => ReelsPage(
                      reelsList: reelsList,
                      videoUrlIndex: index,
                    ),
                  ));
            },
            child: reelsImageList.length == reelsList.length
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(
                        File(reelsImageList[index]!),
                        width: 128,
                        height: 128,
                        fit: BoxFit.cover,
                      ),
                      const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.black45,
                        child: Icon(
                          Icons.play_arrow,
                          size: 12,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                : Center(
                    child: CupertinoActivityIndicator(
                      color: AppTheme.black1,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
