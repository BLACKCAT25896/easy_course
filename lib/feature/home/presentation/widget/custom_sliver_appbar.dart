import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/common/widget/custom_circular_icon_button.dart';
import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/styles.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String? title;
  final bool showAction;
  final bool centerTitle;
  final bool pined;
  final Widget? widget;
  const CustomSliverAppbar({super.key, this.title, this.showAction = true, this.centerTitle = false,  this.pined = false, this.widget});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(floating: true, elevation: 1,
        centerTitle: centerTitle,
        pinned: pined,
        automaticallyImplyLeading: pined, backgroundColor:  Theme.of(context).primaryColor,
        toolbarHeight: 70,
        leading: centerTitle ? CustomCircularIconButton(iconData: CupertinoIcons.arrow_left, onTap: ()=> Get.back()) : null,


        title: title != null? Text("${title?.tr}", style: textMedium.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeDefault)) :const SizedBox());
  }
}
