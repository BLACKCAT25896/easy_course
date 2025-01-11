
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/common/widget/custom_app_bar.dart';
import 'package:easy_course/common/widget/custom_button.dart';
import 'package:easy_course/common/widget/custom_contaner.dart';
import 'package:easy_course/common/widget/custom_snackbar.dart';
import 'package:easy_course/common/widget/custom_text_field.dart';
import 'package:easy_course/feature/feed/controller/feed_controller.dart';
import 'package:easy_course/feature/feed/domain/models/feed_body.dart';

import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/styles.dart';

class CreateNewFeedScreen extends StatefulWidget {
  const CreateNewFeedScreen({super.key});

  @override
  State<CreateNewFeedScreen> createState() => _CreateNewFeedScreenState();
}

class _CreateNewFeedScreenState extends State<CreateNewFeedScreen> {
  TextEditingController nameController = TextEditingController();

   bool update = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFF1F1F2),
      appBar: CustomAppBar(showBakButton: false, titleWidget: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(onTap: ()=> Get.back(),
            child: Text("Close", style: textRegular.copyWith(color:Theme.of(context).hintColor),)),
        Text("Create Post", style: textRegular.copyWith(color :Colors.white),),
        GetBuilder<FeedController>(
          builder: (feedController) {
            return TextButton(onPressed: () {
              String feedText = nameController.text.trim();
              if(feedText.isEmpty){
                showCustomSnackBar("write something");
              }else{
                FeedBody body = FeedBody(
                  feedTxt: feedText,
                  communityId: 2914,
                  spaceId: 5883,
                  uploadType: "text",
                  activityType: "group",
                  isBackground: 0
                );

                feedController.createNewFeed(body);

              }
            },
            child: Text("Create", style: textRegular.copyWith(color :const Color(0xFF6561FE)),));
          }
        ),
      ],) ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: GetBuilder<FeedController>(
              builder: (categoryController) {
                return Column(mainAxisSize: MainAxisSize.min, children: [



                  CustomTextField(
                    controller: nameController,
                    inputAction: TextInputAction.newline,
                    minLines: 7,maxLines: 20,
                    inputTextColor: Colors.black,
                    inputType: TextInputType.multiline,
                    hintText: "What's on your mind?"),

                  


                ],);
              }
          ),
        ))
      ],),
    );
  }
}
