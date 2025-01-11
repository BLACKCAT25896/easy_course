
import 'dart:developer';

import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:easy_course/api_handle/api_checker.dart';
import 'package:easy_course/common/repository/splash_repository.dart';
import 'package:easy_course/common/widget/custom_snackbar.dart';

class SplashController extends GetxController implements GetxService{
  final SplashRepository splashRepo;
  SplashController({required this.splashRepo});
  bool _firstTimeConnectionCheck = true;
  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;

  Future<void> getConfigData() async {
    Response response = await splashRepo.getConfigData();
    if(response.hasError) {
      ApiChecker.checkApi(response);
    }else {
      showCustomSnackBar("${response.body}'");
    }
  }

  Future<bool> initSharedData() {
    return splashRepo.initSharedData();
  }

  Future<bool> removeSharedData() {
    return splashRepo.removeSharedData();
  }


  String? version;
  Future<void> printAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;

  }


  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  bool updateAvailable = false;

  Future<void> checkForUpdate() async {
    log('checking for Update');
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        log('update available');
        updateApp();
        updateAvailable = true;
      }else{
        log('No update available');
        updateAvailable = false;
      }
     update();
    }).catchError((e) {
      log(e.toString());
    });
  }



  void updateApp() async {
    log('Updating');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) {
      log(e.toString());
    });
  }


}
