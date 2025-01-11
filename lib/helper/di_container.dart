import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:test_project/api_handle/api_client.dart';
import 'package:test_project/common/controller/date_picker_controller.dart';
import 'package:test_project/common/controller/splash_controller.dart';
import 'package:test_project/common/controller/theme_controller.dart';
import 'package:test_project/common/repository/splash_repository.dart';
import 'package:test_project/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:test_project/feature/authentication/logic/authentication_controller.dart';
import 'package:test_project/feature/dashboard/controller/dashboard_controller.dart';
import 'package:test_project/feature/feed/controller/feed_controller.dart';
import 'package:test_project/feature/feed/domain/repository/feed_repository.dart';
import 'package:test_project/localization/language_model.dart';
import 'package:test_project/localization/localization_controller.dart';
import 'package:test_project/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(() => SplashRepository(apiClient : Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthenticationRepository(apiClient : Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => FeedRepository(apiClient : Get.find()));







  // Controller
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthenticationController(authenticationRepository: Get.find()));
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => DatePickerController());
  Get.lazyPut(() => FeedController(feedRepository: Get.find()));





  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for(LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues =  await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    Map<String, String> languageJson = {};
    mappedJson.forEach((key, value) {
      languageJson[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = languageJson;
  }
  return languages;
}
