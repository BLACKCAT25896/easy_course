import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_project/api_handle/api_checker.dart';
import 'package:test_project/common/widget/custom_snackbar.dart';
import 'package:test_project/feature/feed/domain/models/feed_body.dart';
import 'package:test_project/feature/feed/domain/models/feed_model.dart';
import 'package:test_project/feature/feed/domain/repository/feed_repository.dart';
import 'package:test_project/helper/image_size_checker.dart';

class FeedController extends GetxController implements GetxService{
  final FeedRepository feedRepository;
  FeedController({required this.feedRepository});



  XFile? thumbnail;
  XFile? pickedImage;
  void pickImage() async {
    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    double imageSizeIs = await ImageSize.getImageSize(pickedImage!);
    log("Here is image size ==> $imageSizeIs");
    if(imageSizeIs > 1){
      showCustomSnackBar("please_choose_image_size_less_than_2_mb".tr);
    }else{
      thumbnail = pickedImage;
    }
    update();
  }


  bool isLoading = false;
  List<FeedModel>? feedList;
  Future<void> getFeedList() async {
    isLoading = true;
    Response? response = await feedRepository.getFeedList();
    if (response?.statusCode == 200) {
      feedList = [];
      response?.body.forEach((feed) => feedList?.add(FeedModel.fromJson(feed)));
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  Future<void> createNewFeed(FeedBody body) async {
    isLoading = true;
    Response? response = await feedRepository.createNewFeed(body);
    if (response?.statusCode == 200) {
      Get.back();
      showCustomSnackBar("Feed created successfully", isError: false);
     getFeedList();
      isLoading = false;
    }else{
      isLoading = false;
      ApiChecker.checkApi(response!);
    }
    update();
  }


  
}