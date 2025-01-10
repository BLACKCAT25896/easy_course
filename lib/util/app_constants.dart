import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:flutter/services.dart';
import 'package:test_project/localization/language_model.dart';
import 'package:test_project/util/images.dart';


class AppConstants {
  static const String version = '2.0.40'; //Flutter version 3.24.3
  static const int versionCode = 60;
  static const String whatsUpdate = "Fixing Price related problems for sales and purchase";
  static const String appName = 'AppifyLab';

  static const String baseUrl = 'https://ezycourse.com';
  static const String loginUri = '/api/app/student/auth/login';
  static const String feedList = '/api/app/teacher/community/getFeed?status=feed';
  static const String uploadFeed = '/api/app/teacher/community/createFeedWithUpload';
  static const String likeFeed = '/api/app/teacher/community/createLike';
  static const String reactionList = '/api/app/teacher/community/getAllReactionType?feed_id';
  static const String comment = '/api/app/student/comment/createComment';
  static const String replyList = '/api/app/student/comment/getReply/61231?more=null';
  static const String logout = '/api/app/student/auth/logout';
  static const String profile = '/api/profile';






  // Shared Key
  static const String theme = 'theme';
  static const String token = 'token';
  static const String useId = 'userId';
  static const String deviceToken = 'deviceToken';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cartList = 'cart_list';
  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String searchAddress = 'search_address';
  static const String localization = 'X-Localization';
  static const String topic = 'notify';
  static const String zoneId = 'zoneId';
  static const String skipOnboard = 'skip-onboard';

  static const whatsApp = "https://wa.me/+8801894955494?text=";
  static const phoneNumber = "+8801894955494";
  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.bangladesh, languageName: 'Bengali', countryCode: 'BD', languageCode: 'bn'),
    LanguageModel(imageUrl: Images.unitedKingdom, languageName: 'English', countryCode: 'US', languageCode: 'en'),


  ];

  static const int limitOfPickedIdentityImageNumber = 2;
  static const double limitOfPickedImageSizeInMB = 2;
  static const double completionArea = 500;


  static String formatedDate = "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";

  static bool getDemo() {
    bool demo = false;
    assert(demo = true);
    return demo;
  }
  static final facebookAppEvents = FacebookAppEvents();
  static final phoneNumberFormat = FilteringTextInputFormatter.digitsOnly;
  static final numberFormat = FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$'));

  static void pixel (String title){
    facebookAppEvents.logEvent(
      name: title,
      parameters: {
        'button_id': title,
      },
    );
    AppConstants.facebookAppEvents.setAdvertiserTracking(enabled: true);
  }


}
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
