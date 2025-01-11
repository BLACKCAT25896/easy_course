import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:test_project/api_handle/api_client.dart';
import 'package:test_project/feature/feed/domain/models/feed_body.dart';
import 'package:test_project/util/app_constants.dart';

class FeedRepository{
  final ApiClient apiClient;
  FeedRepository({required this.apiClient});


  Future<Response?> getFeedList() async {
    return await apiClient.postData(AppConstants.feedList,{
      "community_id":"2914",
      "space_id":"5883"
    });
  }

  Future<Response?> createNewFeed(FeedBody body) async {
    return await apiClient.postData(AppConstants.uploadFeed,body.toJson());
  }

}