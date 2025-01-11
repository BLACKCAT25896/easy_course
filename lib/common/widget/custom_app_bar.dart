import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/styles.dart';

class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool centerTitle;
  final IconData? backIcon;
  final double toolbarHeight;
  final bool showBakButton;
  final List<Widget>? actions;
  final Function()? onBackPress;
  const CustomAppBar({
    super.key, this.title, this.titleWidget, this.toolbarHeight = 70, this.showBakButton = true,
    this.onBackPress, this.actions, this.centerTitle = true, this.backIcon});

  @override
  Widget build(BuildContext context) {
    bool isRouteTreeEmpty = Navigator.of(context).canPop();
    return Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor),

        child: AppBar(title: titleWidget?? Text( title??"",style: textMedium.copyWith(
            fontSize: Dimensions.fontSizeExtraLarge, color: Colors.white),) ,
          surfaceTintColor: Theme.of(context).cardColor,

          leading: (showBakButton && isRouteTreeEmpty)? IconButton(onPressed: () => onBackPress != null ? onBackPress?.call() : Get.back(),
              icon: Icon(backIcon?? Icons.arrow_back,color: Colors.white,)): null,
          actions: actions, centerTitle: centerTitle, backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false, elevation: 0));
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
