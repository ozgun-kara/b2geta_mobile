import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryWidget extends StatefulWidget {
  final List<String> urlImages;

  const GalleryWidget({super.key, required this.urlImages});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PhotoViewGallery.builder(
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
