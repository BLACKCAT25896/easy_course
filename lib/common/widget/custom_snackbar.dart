import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_project/util/dimensions.dart';

void showCustomSnackBar(String? message, {bool isError = true, double margin = Dimensions.paddingSizeSmall}) {
  if(message != null && message.isNotEmpty) {

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}