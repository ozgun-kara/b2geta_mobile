import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

import 'package:b2geta_mobile/app_theme.dart';

class ReelsItemWidget extends StatefulWidget {
  const ReelsItemWidget({
    Key? key,
    required this.reelsUrl,
  }) : super(key: key);
  final String reelsUrl;
  @override
  State<ReelsItemWidget> createState() => _ReelsItemWidgetState();
}

class _ReelsItemWidgetState extends State<ReelsItemWidget> {
  late double deviceWidth;
  late double deviceHeight;

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
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
          left: 21,
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
          left: 21,
          child: Row(children: [
            ClipOval(
              child: Image.asset(
                "assets/images/dummy_images/post_profile.png",
                width: 43,
                height: 43,
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
                    "SİLVERLİNE ENDÜSTRİ VE TİCARET A. Ş",
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
      ],
    );
  }
}
