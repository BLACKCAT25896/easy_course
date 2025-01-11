import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/common/widget/custom_contaner.dart';
import 'package:easy_course/common/widget/custom_image.dart';
import 'package:easy_course/feature/feed/domain/models/feed_model.dart';
import 'package:easy_course/feature/feed/presentation/widgets/comment_bottom_sheet.dart';
import 'package:easy_course/feature/feed/presentation/widgets/feed_reaction_dialog.dart';
import 'package:easy_course/helper/date_converter.dart';
import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/images.dart';
import 'package:easy_course/util/styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedItemRepository extends StatelessWidget {
  final FeedModel? feedModel;
  final int index;
  const FeedItemRepository({super.key,  required this.index, this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [



          Row(children: [
            ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
              child: CustomImage(width: Dimensions.imageSize, height: Dimensions.imageSize,
                  image: "${feedModel?.user?.profilePic}",)),

              const SizedBox(width: Dimensions.paddingSizeSmall),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${feedModel?.name}", style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
                  Text(timeago.format(DateTime.parse(feedModel?.createdAt??DateTime.now().toString())),
                    style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                ],
              )),
            const Icon(Icons.more_vert_outlined)

            ],
          ),
        const Divider(thickness: .125, ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("${feedModel?.feedTxt}",maxLines: 4,overflow: TextOverflow.ellipsis,
            style: textRegular.copyWith(),),
        ),
        ClipRRect(borderRadius: BorderRadius.circular(5),
            child: CustomImage(width: Get.width, height: Get.width/2.4, image: feedModel?.pic)),

         Padding(
           padding: const EdgeInsets.symmetric(vertical: 10),
           child: Row(children: [
            SizedBox(width: 40,
              child: Stack(clipBehavior: Clip.none, children: [

                Positioned(left: 17,child: InkWell(onTap: (){},
                    child: const CustomImage(image: Images.love, width: 20, height: 20, localAsset: true,))),
                InkWell(onTap: (){},child: const CustomImage(image: Images.like, width: 20, height: 20, localAsset: true,)),
              ],),
            ),
             Expanded(child: Text("You and ${feedModel?.likeCount} others", style: textRegular.copyWith(),)),
              const SizedBox(width: 10),

             const CustomImage(image: Images.commentOutline, width: 20, height: 20, localAsset: true,),
             const SizedBox(width: 5),
              Text("${feedModel?.commentCount} Comments", style: textRegular,)
           ],),
         ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(children: [

            InkWell(onTap: ()=> Get.dialog(const FeedReactionDialog()),
                child: const CustomImage(image: Images.thumb, width: 20, height: 20, localAsset: true,)),
            const SizedBox(width: 5),
            Expanded(child: Text("Like", style: textRegular.copyWith(),)),
            const SizedBox(width: 10),

           InkWell(onTap: ()=> showModalBottomSheet(isScrollControlled: true, context: context, builder: (_)=> CommentBottomSheet(), ),
             child: Row(children: [
               const CustomImage(image: Images.commentFill, width: 20, height: 20, localAsset: true,),
               const SizedBox(width: 5),
               const Text("Comment", style: textRegular,)
             ]),
           )
          ],),
        ),



      ],
      ),
      );
    }
  }