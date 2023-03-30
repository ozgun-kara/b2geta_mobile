// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/messages/message_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/services/messages/messages_services.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_app_bar.dart';
import 'package:b2geta_mobile/views/messages/sub_pages/message_details_sub_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final ScrollController _scrollController = ScrollController();

  final MessagesServices _messagesServices = MessagesServices();
  List<MessageModel> _messageList = [];
  String _total = "0";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getMessageList();
  }

  getMessageList() async {
    await _messagesServices.getMessagesCall(queryParameters: {}).then((value) {
      _messageList = value["messageList"];
      _total = value["total"];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";

    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black4,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* SizedBox(
              height: 14,
            ),
            Container(
              width: deviceWidth,
              height: 49,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.white15,
                ),
                decoration: InputDecoration(
                  fillColor: themeMode ? AppTheme.white1 : AppTheme.black7,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide(
                        color: themeMode ? AppTheme.white21 : AppTheme.black18),
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
                  contentPadding: EdgeInsets.only(left: 25.0, top: 20),
                  hintText: 'Search Message'.tr,
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontFamily: AppTheme.appFontFamily,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.white15,
                  ),
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 16, minWidth: 16),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Image.asset(
                      "assets/icons/search.png",
                      width: 16,
                      height: 16,
                      color: themeMode ? AppTheme.blue2 : AppTheme.white1,
                    ),
                  ),
                ),
              ),
            ),
           */
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                '${'Chats'.tr} ($_total)',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppTheme.appFontFamily,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.white15,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: _messageList.length,
              itemBuilder: (BuildContext context, int index) {
                var message = _messageList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessageDetailsSubPage(
                            messageId: message.id!,
                            toId: message.toId!,
                            fromId: message.fromId!,
                          ),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(
                        bottom: 7,
                      ),
                      width: deviceWidth,
                      height: 79,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22.0),
                          border: Border.all(
                            width: int.parse(message.isRead!) == 1 ? 2 : 1,
                            color: int.parse(message.isRead!) == 1
                                ? AppTheme.blue2
                                : themeMode
                                    ? AppTheme.white21
                                    : AppTheme.black7,
                          ),
                          color: int.parse(message.isRead!) == 1
                              ? AppTheme.blue2
                              : themeMode
                                  ? AppTheme.white1
                                  : AppTheme.black7),
                      child: Row(
                        children: [
                          ClipOval(
                            child: message.toAvatar!.isNotEmpty
                                ? Image.network(
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    message.toId !=
                                            Provider.of<UserProvider>(context,
                                                    listen: false)
                                                .getUser
                                                .id
                                        ? message.toAvatar!
                                        : message.fromAvatar!,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      "assets/images/dummy_images/user_profile.png",
                                    ),
                                  )
                                : Image.asset(
                                    "assets/images/dummy_images/user_profile.png",
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.toFullname != null
                                    ? message.toId !=
                                            Provider.of<UserProvider>(context,
                                                    listen: false)
                                                .getUser
                                                .id
                                        ? message.toFullname!
                                        : message.fromFullname!
                                    : "User Name",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: int.parse(message.isRead!) == 1
                                      ? AppTheme.white1
                                      : themeMode
                                          ? AppTheme.black19
                                          : AppTheme.white1,
                                ),
                              ),
                              Text(
                                "İstanbul, Türkiye",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.white15,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
