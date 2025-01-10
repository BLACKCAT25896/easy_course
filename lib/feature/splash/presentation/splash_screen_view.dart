import 'package:flutter/material.dart';
import 'package:test_project/common/controller/splash_controller.dart';
import 'package:test_project/feature/authentication/logic/authentication_controller.dart';
import 'package:test_project/helper/route_helper.dart';
import 'package:test_project/util/app_constants.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:get/get.dart';
import 'package:test_project/util/styles.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>  with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _route();
    _controller = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuint);
    _controller.forward();
    _controller.addStatusListener((status) {

    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  late AnimationController _controller;
  late Animation<double> _animation;


  Future<void> _route() async {
    if(Get.find<AuthenticationController>().isLoggedIn()){
      Future.delayed(const Duration(seconds: 2),() => Get.offAllNamed(RouteHelper.getDashboardRoute()),);
    }else{
      Future.delayed(const Duration(seconds: 2),() => Get.offAllNamed(RouteHelper.getOnboardingRoute()),);

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Theme.of(context).primaryColor,
      body: GetBuilder<SplashController>(
        builder: (splashController) {
          return Stack(children: [
              Center(child: Padding(padding: const EdgeInsets.all(50.0),
                child: ScaleTransition(scale: _animation,
                    child: Center(child: Hero(tag: "logo", child: Image.asset(Images.logo)))))),

            Align(alignment: Alignment.bottomCenter,
              child: Padding(padding: const EdgeInsets.only(bottom: 50.0),
                child: Text("${AppConstants.appName} ${"version".tr} : ${AppConstants.version}",
                  style: textRegular.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeSmall)))),
            ],
          );
        }
      ));
  }
}
