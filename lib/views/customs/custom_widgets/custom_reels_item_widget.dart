import 'package:b2geta_mobile/services/social_services/social_services.dart';
import 'package:b2geta_mobile/views/customs/custom_pages/custom_comment_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/social/feed_model.dart';

class CustomReelsItemWidget extends StatefulWidget {
  const CustomReelsItemWidget({
    Key? key,
    required this.reelsModel,
    required this.reelsUrl,
  }) : super(key: key);
  final FeedModel reelsModel;
  final String reelsUrl;
  @override
  State<CustomReelsItemWidget> createState() => _CustomReelsItemWidgetState();
}

class _CustomReelsItemWidgetState extends State<CustomReelsItemWidget> {
  late double deviceWidth;
  late double deviceHeight;

  VideoPlayerController? _controller;

  final SocialServices _socialServices = SocialServices();
  late bool isLike;

  @override
  void initState() {
    super.initState();
    isLike = widget.reelsModel.likeStatus!;
    initializePlayer(widget.reelsUrl);
  }

  void initializePlayer(String url) async {
    final fileInfo = await checkCacheFor(url);
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(url);
      _controller!.initialize().then((value) {
        setState(() {
          _controller!.play();
        });
        _controller!.setLooping(true);
        _controller!.setVolume(100.0);
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
      _controller!.initialize().then((value) {
        cachedForUrl(url);
        setState(() {
          _controller!.play();
        });
        _controller!.setLooping(true);
        _controller!.setVolume(100.0);
      });
    }
  }

  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.pause();
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        (_controller == null)
            ? Container(
                width: deviceWidth,
                height: deviceHeight,
                color: Colors.black,
                child: Center(
                  child: CupertinoActivityIndicator(
                    color: AppTheme.white1,
                  ),
                ),
              )
            : ((_controller!.value.isInitialized)
                ? VideoPlayer(_controller!)
                : Container(
                    width: deviceWidth,
                    height: deviceHeight,
                    color: Colors.black,
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: AppTheme.white1,
                      ),
                    ),
                  )),
        Positioned(
          top: 22,
          right: 21,
          child: IconButton(
            onPressed: () {
              if (_controller != null) {
                _controller!.pause();
              }
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/icons/close.png",
              width: 19,
              height: 19,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 12,
          child: Row(children: [
            ClipOval(
              child: Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.white1,
                ),
                child: widget.reelsModel.user!.photo!.isNotEmpty
                    ? Image.network(
                        widget.reelsModel.user!.photo!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
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
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 189,
                  child: Text(
                    widget.reelsModel.user!.name ?? "User Name",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: AppTheme.appFontFamily,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.white1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "İstanbul, Türkiye",
                  style: TextStyle(
                    height: 1,
                    fontSize: 12,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white15,
                  ),
                ),
              ],
            ),
          ]),
        ),
        Positioned(
          bottom: 15,
          right: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () async {
                    if (isLike == true) {
                      await _socialServices
                          .feedUnLikeCall(feedId: widget.reelsModel.id!)
                          .then((value) {
                        if (value) {
                          setState(() {
                            isLike = false;
                          });
                        }
                      });
                    } else if (isLike == false) {
                      await _socialServices
                          .feedLikeCall(feedId: widget.reelsModel.id!)
                          .then((value) {
                        if (value) {
                          setState(() {
                            isLike = true;
                          });
                        }
                      });
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isLike ? Colors.red : Colors.grey,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => CustomCommentPage(
                              feedId: widget.reelsModel.id!,
                              user: widget.reelsModel.user!,
                              content: widget.reelsModel.content!),
                          transitionDuration: const Duration(milliseconds: 0),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 0),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ));
                  },
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.grey,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
