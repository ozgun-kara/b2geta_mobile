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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['imgCount'] = this.imgCount;
    data['title'] = title;
    data['subTitle'] = this.subTitle;
    data['avatarImgUrl'] = this.avatarImgUrl;
    data['subTitle2'] = this.subTitle2;
    data['likeCount'] = this.likeCount;
    data['dislikeCount'] = this.dislikeCount;
    return data;
  }
}
