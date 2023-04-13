import 'package:b2geta_mobile/providers/user_provider.dart';
import 'package:b2geta_mobile/views/customs/custom_widgets/custom_inner_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:b2geta_mobile/app_theme.dart';
import 'package:b2geta_mobile/models/messages/message_details_model.dart';
import 'package:b2geta_mobile/providers/theme_provider.dart';
import 'package:b2geta_mobile/services/messages/messages_services.dart';

class MessageDetailsSubPage extends StatefulWidget {
  const MessageDetailsSubPage({
    Key? key,
    required this.messageId,
    required this.toId,
    required this.fromId,
  }) : super(key: key);
  final String messageId;
  final String toId;
  final String fromId;
  @override
  State<MessageDetailsSubPage> createState() => _MessageDetailsSubPageState();
}

class _MessageDetailsSubPageState extends State<MessageDetailsSubPage> {
  late double deviceTopPadding;
  late double deviceWidth;
  late double deviceHeight;
  late bool themeMode;

  final TextEditingController _messageController = TextEditingController();

  final MessagesServices _messagesServices = MessagesServices();
  List<MessageDetailsModel> _messagesList = [];
  @override
  void initState() {
    super.initState();
    getMessageDetailsList();
  }

  getMessageDetailsList() async {
    int total = await getTotal();
    _messagesList =
        await _messagesServices.getMessageDetailCall(queryParameters: {
      "offset": "0",
      "limit": total.toString(),
    }, messageId: widget.messageId);
    setState(() {});
  }

  Future<int> getTotal() async {
    return await _messagesServices.getTotalMessageCall(
        messageId: widget.messageId);
  }

  @override
  Widget build(BuildContext context) {
    deviceTopPadding = MediaQuery.of(context).padding.top;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    themeMode = Provider.of<ThemeProvider>(context).themeMode == "light";
    return Scaffold(
      backgroundColor: themeMode ? AppTheme.white1 : AppTheme.black7,
      appBar: const CustomInnerAppBar(),
      body: Column(
        children: [
          // Container(
          //   width: deviceWidth,
          //   height: 32,
          //   decoration: BoxDecoration(
          //     color: AppTheme.blue2,
          //   ),
          //   child: MaterialButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     elevation: 0,
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 13),
          //       child: Row(
          //         children: [
          //           Image.asset(
          //             "assets/icons/back.png",
          //             width: 7,
          //             height: 5,
          //             color: const Color(0xFFC2C2C2),
          //           ),
          //           const SizedBox(
          //             width: 6.0,
          //           ),
          //           Text(
          //             'Back to Messages'.tr,
          //             style: TextStyle(
          //               fontSize: 11,
          //               fontFamily: AppTheme.appFontFamily,
          //               fontWeight: FontWeight.w600,
          //               color: AppTheme.white24,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
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
                _messagesList.isNotEmpty
                    ? ClipOval(
                        child: _messagesList[0].toAvatar!.isNotEmpty
                            ? Image.network(
                                width: 43,
                                height: 43,
                                fit: BoxFit.cover,
                                _messagesList[0].toId !=
                                        Provider.of<UserProvider>(context,
                                                listen: false)
                                            .getUser
                                            .id
                                    ? _messagesList[0].toAvatar!
                                    : _messagesList[0].fromAvatar!,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  "assets/images/dummy_images/user_profile.png",
                                ),
                              )
                            : Image.asset(
                                "assets/images/dummy_images/user_profile.png",
                                width: 43,
                                height: 43,
                                fit: BoxFit.cover,
                              ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 13,
                ),
                Expanded(
                  child: Container(
                    width: 189,
                    padding: const EdgeInsets.only(
                      top: 11,
                    ),
                    child: _messagesList.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _messagesList[0].toFullname != null
                                    ? _messagesList[0].toId !=
                                            Provider.of<UserProvider>(context,
                                                    listen: false)
                                                .getUser
                                                .id
                                        ? _messagesList[0].toFullname!
                                        : _messagesList[0].fromFullname!
                                    : "User Name",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: AppTheme.appFontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: themeMode
                                      ? AppTheme.black19
                                      : AppTheme.white1,
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
                          )
                        : const SizedBox(),
                  ),
                ),
                /*   const SizedBox(
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
               */
              ],
            ),
          ),
          Expanded(
            child: _messagesList.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                        color: themeMode ? AppTheme.white1 : AppTheme.black7),
                    child: GroupedListView<MessageDetailsModel, DateTime>(
                        reverse: true,
                        order: GroupedListOrder.DESC,
                        useStickyGroupSeparators: true,
                        floatingHeader: true,
                        padding: const EdgeInsets.all(8.0),
                        elements: _messagesList,
                        groupBy: ((message) {
                          var dateTime = DateTime.parse(message.createDate!);
                          return dateTime;
                        }),
                        groupHeaderBuilder: (message) => const SizedBox(),
                        itemBuilder: (context, message) {
                          var fromId = _messagesList[0].toId !=
                                  Provider.of<UserProvider>(context,
                                          listen: false)
                                      .getUser
                                      .id
                              ? _messagesList[0].fromId
                              : _messagesList[0].toId;
                          return Align(
                            alignment: message.fromId == fromId
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: message.fromId == fromId
                                  ? const EdgeInsets.only(left: 25.0)
                                  : const EdgeInsets.only(right: 25.0),
                              child: Card(
                                shape: message.fromId == fromId
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
                                color: message.fromId == fromId
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
                                    message.message ?? "",
                                    style: TextStyle(
                                      fontFamily: AppTheme.appFontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                      color: themeMode
                                          ? AppTheme.black19
                                          : AppTheme.white1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : const CupertinoActivityIndicator(),
          ),
          Container(
            width: deviceWidth,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                color: themeMode ? AppTheme.white1 : AppTheme.black7),
            child: TextFormField(
              controller: _messageController,
              minLines: 1,
              maxLines: 8,
              style: TextStyle(
                height: 1,
                fontSize: 14,
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
                      color: themeMode ? AppTheme.white21 : AppTheme.white1),
                ),
                contentPadding: const EdgeInsets.fromLTRB(20, 17, 20, 17),
                hintText: 'Write something'.tr,
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
                      onPressed: () async {
                        await _messagesServices
                            .sendMessageCall(
                                toId: _messagesList[0].toId !=
                                        Provider.of<UserProvider>(context,
                                                listen: false)
                                            .getUser
                                            .id
                                    ? widget.toId.toString()
                                    : widget.fromId.toString(),
                                message: _messageController.text.trim())
                            .then((value) async {
                          if (value) {
                            _messageController.clear();
                            getMessageDetailsList();
                          }
                        });
                      },
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
