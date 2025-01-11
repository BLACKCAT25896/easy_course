class FeedModel {
  int? id;
  int? schoolId;
  int? userId;
  int? courseId;
  int? communityId;
  int? groupId;
  String? feedTxt;
  String? status;
  String? slug;
  String? title;
  String? activityType;
  int? isPinned;
  String? fileType;
  List<dynamic>? files;
  int? likeCount;
  int? commentCount;
  int? shareCount;
  int? shareId;
  String? createdAt;
  String? updatedAt;
  String? feedPrivacy;
  int? isBackground;
  String? bgColor;
  int? pollId;
  int? lessonId;
  int? spaceId;
  int? videoId;
  int? streamId;
  int? blogId;
  String? scheduleDate;
  String? timezone;
  bool? isAnonymous;
  int? meetingId;
  int? sellerId;
  String? publishDate;
  bool? isFeedEdit;
  String? name;
  String? pic;
  int? uid;
  int? isPrivateChat;
  User? user;
  dynamic group;
  dynamic poll;
  dynamic like;
  dynamic follow;
  List<dynamic>? likeType;
  dynamic savedPosts;
  List<dynamic>? comments;

  FeedModel({
    this.id,
    this.schoolId,
    this.userId,
    this.courseId,
    this.communityId,
    this.groupId,
    this.feedTxt,
    this.status,
    this.slug,
    this.title,
    this.activityType,
    this.isPinned,
    this.fileType,
    this.files,
    this.likeCount,
    this.commentCount,
    this.shareCount,
    this.shareId,
    this.createdAt,
    this.updatedAt,
    this.feedPrivacy,
    this.isBackground,
    this.bgColor,
    this.pollId,
    this.lessonId,
    this.spaceId,
    this.videoId,
    this.streamId,
    this.blogId,
    this.scheduleDate,
    this.timezone,
    this.isAnonymous,
    this.meetingId,
    this.sellerId,
    this.publishDate,
    this.isFeedEdit,
    this.name,
    this.pic,
    this.uid,
    this.isPrivateChat,
    this.user,
    this.group,
    this.poll,
    this.like,
    this.follow,
    this.likeType,
    this.savedPosts,
    this.comments,
  });

  FeedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolId = json['school_id'];
    userId = json['user_id'];
    courseId = json['course_id'];
    communityId = json['community_id'];
    groupId = json['group_id'];
    feedTxt = json['feed_txt'];
    status = json['status'];
    slug = json['slug'];
    title = json['title'];
    activityType = json['activity_type'];
    isPinned = json['is_pinned'];
    fileType = json['file_type'];
    files = json['files'] ?? [];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    shareCount = json['share_count'];
    shareId = json['share_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    feedPrivacy = json['feed_privacy'];
    isBackground = json['is_background'];
    bgColor = json['bg_color'];
    pollId = json['poll_id'];
    lessonId = json['lesson_id'];
    spaceId = json['space_id'];
    videoId = json['video_id'];
    streamId = json['stream_id'];
    blogId = json['blog_id'];
    scheduleDate = json['schedule_date'];
    timezone = json['timezone'];
    isAnonymous = json['is_anonymous'];
    meetingId = json['meeting_id'];
    sellerId = json['seller_id'];
    publishDate = json['publish_date'];
    isFeedEdit = json['is_feed_edit'];
    name = json['name'];
    pic = json['pic'];
    uid = json['uid'];
    isPrivateChat = json['is_private_chat'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    group = json['group'];
    poll = json['poll'];
    like = json['like'];
    follow = json['follow'];
    likeType = json['likeType'] ?? [];
    savedPosts = json['savedPosts'];
    comments = json['comments'] ?? [];
  }
}

class User {
  int? id;
  String? fullName;
  String? profilePic;
  int? isPrivateChat;
  String? expireDate;
  String? status;
  String? pauseDate;
  String? userType;

  User({
    this.id,
    this.fullName,
    this.profilePic,
    this.isPrivateChat,
    this.expireDate,
    this.status,
    this.pauseDate,
    this.userType,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    profilePic = json['profile_pic'];
    isPrivateChat = json['is_private_chat'];
    expireDate = json['expire_date'];
    status = json['status'];
    pauseDate = json['pause_date'];
    userType = json['user_type'];
  }
}
