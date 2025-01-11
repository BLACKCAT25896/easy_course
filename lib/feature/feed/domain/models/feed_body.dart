class FeedBody {
  String? feedTxt;
  int? communityId;
  int? spaceId;
  String? uploadType;
  String? activityType;
  int? isBackground;

  FeedBody(
      {this.feedTxt,
        this.communityId,
        this.spaceId,
        this.uploadType,
        this.activityType,
        this.isBackground});

  FeedBody.fromJson(Map<String, dynamic> json) {
    feedTxt = json['feed_txt'];
    communityId = json['community_id'];
    spaceId = json['space_id'];
    uploadType = json['uploadType'];
    activityType = json['activity_type'];
    isBackground = json['is_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feed_txt'] = feedTxt;
    data['community_id'] = communityId;
    data['space_id'] = spaceId;
    data['uploadType'] = uploadType;
    data['activity_type'] = activityType;
    data['is_background'] = isBackground;
    return data;
  }
}
