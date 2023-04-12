import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      this.validator,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.maxLines})
      : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              widget.hintText,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w400,
                color: themeMode ? AppTheme.blue3 : AppTheme.white14,
              ),
            ),
          ),
        ),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          maxLines: widget.maxLines ?? 1,
          style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode
                  ? AppTheme.blue3
                  : AppTheme.white1), // WHILE WRITING
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
            filled: true,
            fillColor: themeMode ? AppTheme.white39 : AppTheme.black18,
            hintText: "",
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w400,
              color: themeMode ? AppTheme.blue3 : AppTheme.white14,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
