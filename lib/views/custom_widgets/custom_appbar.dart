import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/providers/navigation_page_provider.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/views/messages/messages_page.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    return Provider.of<NavigationPageProvider>(context).searchState
        ? searchAppBar(themeMode)
        : defaultAppBar(themeMode);
  }

  void navigateToMessagePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MessagesPage()));
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
        actions: [
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/search.png',
              width: 19,
              height: 19,
              color: AppTheme.white15,
            ),
            onPressed: () {
              Provider.of<NavigationPageProvider>(context, listen: false)
                  .updateSearchState();
            },
          ),
          IconButton(
            splashRadius: 24,
            icon: Image.asset(
              'assets/icons/bell.png',
              width: 16.0,
              height: 18.0,
              color: AppTheme.white15,
            ),
            onPressed: () {},
          ),
          IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/message.png',
                width: 19.0,
                height: 16.0,
                color: AppTheme.white15,
              ),
              onPressed: () {
                navigateToMessagePage(context);
              }),
        ]);
  }

  PreferredSizeWidget searchAppBar(themeMode) {
    return AppBar(
      toolbarHeight: 68,
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          splashRadius: 24,
          icon: Image.asset(
            'assets/icons/close.png',
            width: 14,
            height: 12,
            color: AppTheme.white15,
          ),
          onPressed: () {
            Provider.of<NavigationPageProvider>(context, listen: false)
                .updateSearchState();
          },
        ),
      ),
      leadingWidth: 45,
      centerTitle: true,
      title: SizedBox(
        height: 39,
        child: TextFormField(
          controller: searchController,
          style: TextStyle(
              fontSize: 14,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w500,
              color: themeMode
                  ? AppTheme.black11
                  : AppTheme.white1), // WHILE WRITING
          maxLines: 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            filled: true,
            fillColor: themeMode ? AppTheme.white3 : AppTheme.black7,
            hintText: 'AppBar Search'.tr,
            hintStyle: TextStyle(
              fontSize: 11,
              fontFamily: AppTheme.appFontFamily,
              fontWeight: FontWeight.w600,
              color: AppTheme.white13,
            ),
            prefixIcon: IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: SizedBox(
                width: 19,
                height: 19,
                child: Image.asset(
                  'assets/icons/search.png',
                  width: 19,
                  height: 19,
                  color: AppTheme.white15,
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(41),
                borderSide: BorderSide(
                  color: themeMode ? AppTheme.white10 : AppTheme.black14,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(41),
                borderSide: BorderSide(
                  color: themeMode ? AppTheme.white10 : AppTheme.black14,
                  width: 1,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(41),
              borderSide: BorderSide(
                color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
