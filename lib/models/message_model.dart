class MessageModel {
  String text;
  DateTime date;
  bool isSentByMe;
  MessageModel({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
