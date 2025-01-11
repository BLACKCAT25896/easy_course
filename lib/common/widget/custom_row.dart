import 'package:flutter/material.dart';
import 'package:easy_course/util/styles.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String details;
  final double? width;
  const CustomRow({super.key, required this.title, required this.details,  this.width});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(width: width,child: Text(title, style: textMedium,)),
      const SizedBox(width: 100),
      Flexible(child: Text(details, style: textMedium,textAlign: TextAlign.end,))
    ],);
  }
}
