import 'package:flutter/material.dart';

import 'package:b2geta_mobile/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    required this.text,
    this.textSize,
    required this.onPressed,
  }) : super(key: key);
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final String text;
  final double? textSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: width ?? double.infinity,
      height: height ?? 52,
      child: MaterialButton(
          elevation: 10,
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 16)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: textSize ?? 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w700,
              color: AppTheme.white1,
            ),
          )),
    );
  }
}
