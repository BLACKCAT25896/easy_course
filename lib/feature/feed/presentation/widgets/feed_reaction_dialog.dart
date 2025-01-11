import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/util/images.dart';

class FeedReactionDialog extends StatelessWidget {
  const FeedReactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double ration = 11, spacing = 6.2;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ration)),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            CustomImage(image: Images.likeImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),
            CustomImage(image: Images.loveImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),
            CustomImage(image: Images.thinkingImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),
            CustomImage(image: Images.loughImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),
            CustomImage(image: Images.wowImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),
            CustomImage(image: Images.sadImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),
            CustomImage(image: Images.angryImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,),
             SizedBox(width: spacing,),

              ]),
        ));
  }
}
