class ProjectDummyModel {
  int? id;
  String? imgUrl;
  int? imgCount;
  String? title;
  String? subTitle;
  String? avatarImgUrl;
  String? subTitle2;
  int? likeCount;
  int? dislikeCount;

  ProjectDummyModel(
      {this.id,
      this.imgUrl,
      this.imgCount,
      this.title,
      this.subTitle,
      this.avatarImgUrl,
      this.subTitle2,
      this.likeCount,
      this.dislikeCount});

  ProjectDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    imgCount = json['imgCount'];
    title = json['title'];
    subTitle = json['subTitle'];
    avatarImgUrl = json['avatarImgUrl'];
    subTitle2 = json['subTitle2'];
    likeCount = json['likeCount'];
    dislikeCount = json['dislikeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imgUrl'] = imgUrl;
    data['imgCount'] = imgCount;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['avatarImgUrl'] = avatarImgUrl;
    data['subTitle2'] = subTitle2;
    data['likeCount'] = likeCount;
    data['dislikeCount'] = dislikeCount;
    return data;
  }
}
