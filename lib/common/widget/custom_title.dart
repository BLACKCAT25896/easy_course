import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/util/dimensions.dart';
import 'package:test_project/util/styles.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  const CustomTitle({super.key, required this.title,  this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
        Text(title.tr, style: textRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
        if(isRequired)
          Text('*',style: textSemiBold.copyWith( fontSize: Dimensions.fontSizeDefault),),

      ],
    );
  }
}
class CustomSubTitle extends StatelessWidget {
  final String title;
  const CustomSubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title.tr, style: textMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).textTheme.bodyMedium?.color),);
  }
}