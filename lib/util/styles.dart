import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/common/controller/theme_controller.dart';

const sfProLight = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w300,
);

const textRegular = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w400,
);
const hintTextRegular = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w400,
  color: Color(0xFF6B7280)
);

const textHint = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w400,
    fontSize: 12,
    color: Color(0xFF979797)
);

const textMedium = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w500,
);

const textSemiBold = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w600,
);

const textBold = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w700,
);

const textHeavy = TextStyle(
  fontFamily: 'Instrument Sans',
  fontWeight: FontWeight.w900,
);
class ThemeShadow {
  static List <BoxShadow> getShadow() {
    List<BoxShadow> boxShadow =  [BoxShadow(color: Get.find<ThemeController>().darkTheme? Colors.black26:
    Theme.of(Get.context!).hintColor.withValues(alpha:.25), blurRadius: 1,spreadRadius: 1,offset: const Offset(0,1))];
    return boxShadow;
  }

  static BoxDecoration? getDecoration(context, {bool profile = false}) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [Theme.of(context).primaryColor,
          Theme.of(context).primaryColor,
          if(!profile)
          Theme.of(context).primaryColor,
          Theme.of(context).cardColor,
          Theme.of(context).cardColor,
          Theme.of(context).cardColor,
          Theme.of(context).cardColor,
          if(profile)...[
            Theme.of(context).cardColor,
            Theme.of(context).cardColor
          ]

        ],
        begin: profile? Alignment.topCenter : Alignment.topLeft,
        end: profile? Alignment.bottomCenter : Alignment.bottomRight,
      ),
    );
  }

}