import 'package:b2geta_mobile/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CustomGalleryWidget extends StatefulWidget {
  final List<String> urlImages;

  const CustomGalleryWidget({super.key, required this.urlImages});

  @override
  State<CustomGalleryWidget> createState() => _CustomGalleryWidgetState();
}

class _CustomGalleryWidgetState extends State<CustomGalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PhotoViewGallery.builder(
      loadingBuilder: (context, progress) => Container(
        color: Colors.black,
        child: Center(
            child: CupertinoActivityIndicator(
          color: AppTheme.white1,
          radius: 12,
        )),
      ),
      itemCount: widget.urlImages.length,
      builder: (context, index) {
        final urlImage = widget.urlImages[index];

        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(urlImage),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.contained * 4,
        );
      },
    ));
  }
}
