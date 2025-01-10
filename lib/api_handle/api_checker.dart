
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_snackbar.dart';
import 'package:test_project/feature/authentication/logic/authentication_controller.dart';


class ApiChecker {
  static Future<void> checkApi(Response response) async {
    if (response.statusCode == 401) {
      Get.find<AuthenticationController>().clearSharedData();
    } else {
      if (response.body != null && response.body['message'] != null) {
        showCustomSnackBar(response.body['message']!);
      }
    }
  }
}
