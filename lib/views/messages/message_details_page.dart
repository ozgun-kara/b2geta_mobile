import 'package:b2geta_mobile/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../models/message_model.dart';
import '../../providers/theme_provider.dart';

class MessageDetailsPage extends StatefulWidget {
  const MessageDetailsPage({Key? key}) : super(key: key);

  @override
  State<MessageDetailsPage> createState() => _MessageDetailsPageState();
}

List<MessageModel> messages = [
  MessageModel(
      text: "Merhaba",
      date: DateTime.now().subtract(const Duration(days: 11, minutes: 10)),
      isSentByMe: true),
  MessageModel(
      text: "Nasıl sın ? ",
      date: DateTime.now().subtract(const Duration(days: 11, minutes: 9)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba, iyiyim sen nasıl sın? ",
      date: DateTime.now().subtract(const Duration(days: 11, minutes: 8)),
      isSentByMe: false),
  MessageModel(
      text: "İyiyim bende sağ ol ",
      date: DateTime.now().subtract(const Duration(days: 11, minutes: 7)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba",
      date: DateTime.now().subtract(const Duration(days: 10, minutes: 10)),
      isSentByMe: true),
  MessageModel(
      text: "Nasıl sın ? ",
      date: DateTime.now().subtract(const Duration(days: 10, minutes: 9)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba, iyiyim sen nasıl sın? ",
      date: DateTime.now().subtract(const Duration(days: 10, minutes: 8)),
      isSentByMe: false),
  MessageModel(
      text: "İyiyim bende sağ ol ",
      date: DateTime.now().subtract(const Duration(days: 10, minutes: 7)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba",
      date: DateTime.now().subtract(const Duration(days: 5, minutes: 10)),
      isSentByMe: true),
  MessageModel(
      text: "Nasıl sın ? ",
      date: DateTime.now().subtract(const Duration(days: 5, minutes: 9)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba, iyiyim sen nasıl sın? ",
      date: DateTime.now().subtract(const Duration(days: 5, minutes: 8)),
      isSentByMe: false),
  MessageModel(
      text: "İyiyim bende sağ ol ",
      date: DateTime.now().subtract(const Duration(days: 5, minutes: 7)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba",
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 10)),
      isSentByMe: true),
  MessageModel(
      text: "Nasıl sın ? ",
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 9)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba, iyiyim sen nasıl sın? ",
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 8)),
      isSentByMe: false),
  MessageModel(
      text: "İyiyim bende sağ ol ",
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 7)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba",
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 10)),
      isSentByMe: true),
  MessageModel(
      text: "Nasıl sın ? ",
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 9)),
      isSentByMe: true),
  MessageModel(
      text: "Merhaba, iyiyim sen nasıl sın? ",
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 8)),
      isSentByMe: false),
  MessageModel(
      text: "İyiyim bende sağ ol ",
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 7)),
      isSentByMe: true),
];

TextEditingController _messageController = TextEditingController();

class _MessageDetailsPageState extends State<MessageDetailsPage> {
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
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black7,
      appBar: AppBar(
          toolbarHeight: 68,
          backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black5,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              splashRadius: 24,
              icon: Image.asset(
                'assets/icons/menu.png',
                width: 23,
                height: 17,
                color: AppTheme.white15,
              ),
              onPressed: () {},
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
                if (themeMode) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setDarkMode();
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode();
                }
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
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: [
          Container(
            width: deviceWidth,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.blue2,
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/back.png",
                      width: 7,
                      height: 5,
                      color: const Color(0xFFC2C2C2),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      "Mesajlara geri dön",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: AppTheme.appFontFamily,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.white24,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: deviceWidth,
            height: 63,
            padding: const EdgeInsets.only(left: 10, right: 20.47),
            decoration: BoxDecoration(
              color: themeMode ? AppTheme.white2 : AppTheme.black18,
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: themeMode
                      ? const Color(0xFFD7DAEC)
                      : const Color(0xFF565A85),
                ),
                vertical: BorderSide.none,
              ),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/dummy_images/post_profile.png",
                    width: 43,
                    height: 43,
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    width: 189,
                    padding: const EdgeInsets.only(
                      top: 11,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SİLVERLİNE ENDÜSTRİ VE TİCARET A.Ş",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: AppTheme.appFontFamily,
                            fontWeight: FontWeight.w600,
                            color:
                                themeMode ? AppTheme.black19 : AppTheme.white1,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "İstanbul, Türkiye",
                          overflow: TextOverflow.ellipsis,
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
                  ),
                ),
                const SizedBox(
                  width: 58.0,
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Image.asset(
                      "assets/icons/trash.png",
                      width: 18,
                      height: 20,
                      color: themeMode ? AppTheme.black19 : AppTheme.white1,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 19.47,
                ),
                Material(
                  child: InkWell(
                    onTap: () {},
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Image.asset(
                      "assets/icons/warning.png",
                      color: AppTheme.white15,
                      width: 19.06,
                      height: 17.01,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: themeMode ? AppTheme.white1 : AppTheme.black7),
              child: GroupedListView<MessageModel, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                padding: const EdgeInsets.all(8.0),
                elements: messages,
                groupBy: ((message) => DateTime(
                      message.date.year,
                      message.date.month,
                      message.date.day,
                    )),
                groupHeaderBuilder: (message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: AppTheme.white24,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 7.0),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: TextStyle(
                              color: AppTheme.white1,
                              height: 1,
                              fontFamily: AppTheme.appFontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Padding(
                    padding: message.isSentByMe
                        ? const EdgeInsets.only(left: 25.0)
                        : const EdgeInsets.only(right: 25.0),
                    child: Card(
                      shape: message.isSentByMe
                          ? const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              bottomLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ))
                          : const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                              topLeft: Radius.circular(12.0),
                            )),
                      color: message.isSentByMe
                          ? themeMode
                              ? AppTheme.blue11
                              : AppTheme.green8
                          : themeMode
                              ? AppTheme.white34
                              : AppTheme.black25,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 18,
                          right: 20,
                          top: 14,
                          bottom: 13,
                        ),
                        child: Text(
                          message.text,
                          style: TextStyle(
                            fontFamily: AppTheme.appFontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1,
                            color:
                                themeMode ? AppTheme.black19 : AppTheme.white1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: deviceWidth,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black7),
            child: TextField(
              controller: _messageController,
              onSubmitted: ((value) {
                final message = MessageModel(
                    text: value, date: DateTime.now(), isSentByMe: true);
                _messageController.clear();
                setState(() {
                  messages.add(message);
                });
              }),
              style: TextStyle(
                height: 1,
                fontSize: 12,
                fontFamily: AppTheme.appFontFamily,
                fontWeight: FontWeight.w600,
                color: AppTheme.white15,
              ),
              decoration: InputDecoration(
                fillColor: themeMode ? AppTheme.white5 : AppTheme.black7,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      color: themeMode
                          ? AppTheme.white10
                          : const Color(0xFF666985)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      color: themeMode ? AppTheme.white21 : AppTheme.black18),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(26),
                  borderSide: BorderSide(
                      color: themeMode ? AppTheme.white21 : AppTheme.black18),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 20.0, top: 17.0, bottom: 17.0),
                hintText: "Bir şeyler yaz",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.white13,
                ),
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 23, minWidth: 23),
                suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 22.82),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/send.png",
                        width: 23,
                        height: 23,
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
