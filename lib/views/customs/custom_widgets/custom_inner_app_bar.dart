import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomInnerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomInnerAppBar({Key? key}) : super(key: key);

  @override
  State<CustomInnerAppBar> createState() => _CustomInnerAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomInnerAppBarState extends State<CustomInnerAppBar> {
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

    return defaultAppBar(themeMode);
  }

  PreferredSizeWidget defaultAppBar(themeMode) {
    return AppBar(
      toolbarHeight: 68,
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          splashRadius: 24,
          icon: Image.asset(
            'assets/icons/back-2.png',
            width: 23,
            height: 17,
            color: AppTheme.white15,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: SizedBox(
          width: 103.74,
          height: 14.0,
          child: themeMode
              ? Image.asset('assets/images/b2geta_logo_light.png')
              : Image.asset('assets/images/b2geta_logo_dark.png')),
    );
  }
}
