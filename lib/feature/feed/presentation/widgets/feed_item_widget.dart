import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/widget/custom_contaner.dart';
import 'package:test_project/common/widget/custom_image.dart';
import 'package:test_project/feature/feed/domain/models/feed_model.dart';
import 'package:test_project/feature/feed/presentation/widgets/feed_reaction_dialog.dart';
import 'package:test_project/helper/date_converter.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/images.dart';
import 'package:test_project/util/styles.dart';
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

        Text("${feedModel?.feedTxt}",maxLines: 4,overflow: TextOverflow.ellipsis, style: textMedium.copyWith(fontSize: Dimensions.fontSizeLarge),),
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
             Expanded(child: Text("You and 2 others", style: textRegular.copyWith(),)),
              const SizedBox(width: 10),

             const CustomImage(image: Images.commentOutline, width: 20, height: 20, localAsset: true,),
             const SizedBox(width: 5),
             const Text("12 Comments", style: textRegular,)
           ],),
         ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(children: [

            InkWell(onTap: ()=> Get.dialog(FeedReactionDialog()),
                child: const CustomImage(image: Images.thumb, width: 20, height: 20, localAsset: true,)),
            const SizedBox(width: 5),
            Expanded(child: Text("You and 2 others", style: textRegular.copyWith(),)),
            const SizedBox(width: 10),

            const CustomImage(image: Images.commentFill, width: 20, height: 20, localAsset: true,),
            const SizedBox(width: 5),
            const Text("Comment", style: textRegular,)
          ],),
        ),



      ],
      ),
      );
    }
  }