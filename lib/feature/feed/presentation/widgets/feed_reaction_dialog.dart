import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/common/widget/custom_image.dart';
import 'package:easy_course/util/images.dart';

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
            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.likeImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),

            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.loveImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),

            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.thinkingImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),

            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.loughImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),

            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.wowImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),


            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.sadImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),

            InkWell(onTap: ()=> Get.back(),
                child: CustomImage(image: Images.angryImo,width: Get.width/ ration, height: Get.width/ ration, localAsset: true,)),
             SizedBox(width: spacing,),

              ]),
        ));
  }
}

