import 'package:flutter/material.dart';

import '../../app_theme.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.size,
    required this.imageUrl,
    this.navigationPage,
  }) : super(key: key);
  final double size;
  final String imageUrl;
  final Widget? navigationPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigationPage != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => navigationPage!,
            ),
          );
        }
      },
      child: ClipOval(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.white1,
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              "assets/images/dummy_images/user_profile.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
