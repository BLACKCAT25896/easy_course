
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/animated_custom_dialog.dart';
import 'package:test_project/common/widget/confirmation_dialog_widget.dart';
import 'package:test_project/feature/authentication/logic/authentication_controller.dart';
import 'package:test_project/feature/dashboard/model/navigation_model.dart';
import 'package:test_project/feature/feed/presentation/screens/feed_screen.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/images.dart';

class DashboardController extends GetxController implements GetxService{
  int _currentTab = 0;
  int get currentTab => _currentTab;

  void resetNavBar() {
    _currentTab = 0;
  }

  void setTabIndex(int index) {
    if(index == 1){
      showAnimatedDialog(Get.context!,  ConfirmationDialogWidget(icon: Images.logo,
        title: 'exit_app'.tr,
        description: 'do_you_want_to_exit_the_app'.tr, onYesPressed: (){
        Get.find<AuthenticationController>().clearSharedData();
         Get.offAllNamed(RouteHelper.getOnboardingRoute());
        },),isFlip: true);
    }else{
      _currentTab = index;
      update();
    }

  }

  final ScrollController scrollController = ScrollController();

  final List<NavigationModel> item = [
    NavigationModel(name: 'Community', activeIcon: Images.community, inactiveIcon: Images.logo, screen: const FeedScreen()),
    NavigationModel(name: 'Logout', activeIcon: Images.logout, inactiveIcon: Images.logo, screen: const SizedBox()),
  ];
}
