///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class NotificationModelUser {
/*
{
  "id": "5",
  "type": "personal",
  "username": "user_5",
  "name": "Fatih Sönmez",
  "photo": "https://api.businessucces.com/uploads/profile/2023/03/11032023095731-1678525051.png",
  "cover": ""
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  NotificationModelUser({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  NotificationModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class NotificationModelIcon {
/*
{
  "name": "video_encoded",
  "url": "https://api.businessucces.com/assets/my/images/icon/video_encoded.png"
} 
*/

  String? name;
  String? url;

  NotificationModelIcon({
    this.name,
    this.url,
  });
  NotificationModelIcon.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class NotificationModel {
/*
{
  "id": "14",
  "date": "2023-03-27 14:34:20",
  "type": "video_encoded",
  "read": false,
  "content": "Reels gönderin hazır",
  "icon": {
    "name": "video_encoded",
    "url": "https://api.businessucces.com/assets/my/images/icon/video_encoded.png"
  },
  "user": {
    "id": "5",
    "type": "personal",
    "username": "user_5",
    "name": "Fatih Sönmez",
    "photo": "https://api.businessucces.com/uploads/profile/2023/03/11032023095731-1678525051.png",
    "cover": ""
  }
} 
*/

  String? id;
  String? date;
  String? type;
  bool? read;
  String? content;
  NotificationModelIcon? icon;
  NotificationModelUser? user;

  NotificationModel({
    this.id,
    this.date,
    this.type,
    this.read,
    this.content,
    this.icon,
    this.user,
  });
  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    date = json['date']?.toString();
    type = json['type']?.toString();
    read = json['read'];
    content = json['content']?.toString();
    icon = (json['icon'] != null) ? NotificationModelIcon.fromJson(json['icon']) : null;
    user = (json['user'] != null) ? NotificationModelUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['type'] = type;
    data['read'] = read;
    data['content'] = content;
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
