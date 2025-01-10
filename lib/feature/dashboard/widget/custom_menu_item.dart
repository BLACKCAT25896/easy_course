
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/theme_controller.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class CustomMenuItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String activeIcon;
  final String inActiveIcon;
  final VoidCallback onTap;

  const CustomMenuItem({
    super.key, required this.isSelected, required this.name, required this.activeIcon,
    required this.inActiveIcon, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool darkTheme = Get.find<ThemeController>().darkTheme;
    return InkWell(highlightColor: Colors.transparent, hoverColor: Colors.transparent, onTap: onTap,
      child: SizedBox(width: isSelected ? 90 : 50, child: Column(mainAxisSize: MainAxisSize.min, children: [

           if(isSelected)
          Container(width: 50, height: 3, decoration: BoxDecoration(color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(120)))),

         Padding(padding: const EdgeInsets.all(8.0),
           child: Column(children: [
             Image.asset(activeIcon , color: !isSelected? Theme.of(context).hintColor : darkTheme? Colors.white : Colors.black,
               width: Dimensions.menuIconSize, height: Dimensions.menuIconSize,),

             Text(name.tr, maxLines: 1, overflow: TextOverflow.ellipsis,
                 style: textRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                   color: !isSelected? Theme.of(context).hintColor :  darkTheme? Colors.white : Colors.black,)),

           ],),
         )
        ],
      )),
    );
  }

}