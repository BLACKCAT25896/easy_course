import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_contaner.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/common/widget/custom_search.dart';
import 'package:test_project/common/widget/write_comment_widget.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';

class CommentBottomSheet extends StatefulWidget {
  const  CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Get.height * .9,
      child: CustomContainer(
        child: Column(children: [
          const Row(children: [
            Icon(Icons.favorite, color: Colors.red,),
            Text("You and 2 others")
          ],),

          const SizedBox(height: Dimensions.paddingSizeDefault),

          Expanded(
            child: ListView.builder(itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
              return  Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: index == 0? 0: 50),
                    child: Row(children: [
                        const CustomImage(width: 50, image: Images.profile,localAsset: true),
                        const SizedBox(width: 15,),
                        Expanded(
                          child: CustomContainer(showShadow: false, verticalPadding: 15, color: Theme.of(context).highlightColor.withValues(alpha: .125),
                            child: const Row(children: [
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              Text("IAP Testing"),
                              Text("4 cup tcake Testing"),
                            ])),

                            Icon(Icons.more_vert_outlined)
                          ],),),
                        ),
                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.fromLTRB(index == 0? 70 : 120, 15,15,15),
                    child: const Row(children: [
                      Expanded(
                        child: Row(children: [
                          Text("29d"),
                          SizedBox(width: 15,),
                          Text("Like"),
                          SizedBox(width: 15,),
                          Text("Reply"),
                        ],),
                      ),
                      Text("1"),
                      SizedBox(width: Dimensions.paddingSizeExtraSmall,),
                      CustomImage(width: 15, image: Images.likeImo, localAsset: true),
                    ],),
                  )
                ],
              );
            }),
          ),

          WriteCommentWidget(hintText: "Write Comment", searchController:  commentController,),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom)
        ]),
      ),
    );
  }
}
