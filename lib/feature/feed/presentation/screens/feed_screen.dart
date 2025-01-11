
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/common/widget/custom_app_bar.dart';
import 'package:easy_course/common/widget/custom_search.dart';
import 'package:easy_course/feature/feed/controller/feed_controller.dart';
import 'package:easy_course/feature/feed/presentation/screens/create_new_feed_screen.dart';
import 'package:easy_course/feature/feed/presentation/widgets/feed_item_widget.dart';
import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/images.dart';
import 'package:easy_course/util/styles.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    Get.find<FeedController>().getFeedList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBakButton: false, titleWidget: Row(children: [
        SizedBox(width: 30, child: Image.asset(Images.menu)),
        const SizedBox(width: Dimensions.paddingSizeSmall),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Python Developer Community", style: textSemiBold.copyWith(fontSize: 18, color: Colors.white),),

          Text("#General", style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Colors.white))
        ]))
      ])),

      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<FeedController>().getFeedList();
        },
        child: CustomScrollView(controller: scrollController, slivers: [
          SliverToBoxAdapter(child: GetBuilder<FeedController>(
              builder: (feedController) {
                return Column(children: [

                  CustomSearch(hintText: 'Write something here', searchController: searchController,
                    onSearch: () async {
                    Get.to(()=> const CreateNewFeedScreen());
                    },),

                  feedController.feedList != null? (feedController.feedList!.isNotEmpty )?
                  ListView.builder(
                      itemCount: feedController.feedList?.length??0,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return FeedItemRepository(index: index, feedModel: feedController.feedList?[index],);
                      }) :

                  Padding(padding: EdgeInsets.only(top: Get.height/4), child: const SizedBox()):

                  Padding(padding: EdgeInsets.only(top: Get.height / 4), child: const CircularProgressIndicator()),
                ],);
              }
          ),)
        ],),
      ),

    );
  }
}



