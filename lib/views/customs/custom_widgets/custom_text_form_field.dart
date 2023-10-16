import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    this.validator,
    required this.controller,
    required this.titleText,
    this.hintText,
    this.suffixText,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.color,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String titleText;
  final String? hintText;
  final String? suffixText;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final Color? color;

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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.titleText,
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
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines,
          style: TextStyle(
              fontSize: 14,
              height: 1.5,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode
                  ? AppTheme.blue3
                  : AppTheme.white1), // WHILE WRITING
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
            suffixIcon: widget.suffixText != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 10.0),
                    child: Text(widget.suffixText.toString()),
                  )
                : null,
            suffixStyle: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w400,
              color: themeMode ? AppTheme.white17 : AppTheme.white14,
            ),
            filled: true,
            fillColor: widget.color ??
                (themeMode ? AppTheme.white39 : AppTheme.black18),
            hintText: widget.hintText ?? "",
            hintStyle: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w400,
              color: themeMode ? AppTheme.white17 : AppTheme.white14,
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
