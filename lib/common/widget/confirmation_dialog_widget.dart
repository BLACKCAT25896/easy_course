import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/common/widget/custom_button.dart';
import 'package:easy_course/util/dimensions.dart';
import 'package:easy_course/util/styles.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final String icon;
  final String? title;
  final String description;
  final Function onYesPressed;
  final bool isLogOut;
  final bool hasCancel;
   const ConfirmationDialogWidget({super.key, required this.icon, this.title, required this.description, required this.onYesPressed, this.isLogOut = false, this.hasCancel = true});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
      child: Column(mainAxisSize: MainAxisSize.min, children: [


        const SizedBox(height: Dimensions.paddingSizeSmall),
        Padding(padding:  const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Text("Logout", style: textSemiBold.copyWith(fontSize: 26), textAlign: TextAlign.center)),


        Padding(padding:  const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Text(description, style: textRegular.copyWith(fontSize: 20), textAlign: TextAlign.center)),
         const SizedBox(height: Dimensions.paddingSizeSmall),
        Container(width: Get.width, height: 1,color: Theme.of(context).hintColor),

        Row(children: [
           Expanded(child: CustomButton(

            buttonColor: Colors.transparent,
            showBorderOnly: true,

            onTap: () =>  onYesPressed(),
            text:  'Yes' , textColor: Color(0xFF5C5AE8),
          )),
         Container(width: 1, height: 50,color: Theme.of(context).hintColor),

          Expanded(child: CustomButton(
            buttonColor: Colors.transparent,
            text:  'No',
            onTap: () =>  Get.back(),
          )),
        ])

      ]),
    );
  }
}