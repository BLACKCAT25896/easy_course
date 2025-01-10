import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/splash_controller.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<SplashController>().checkForUpdate();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    log("height-Width=> ${Get.height}/ ${Get.width}");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    return Scaffold(
      body: Column(),
    );
  }
}


