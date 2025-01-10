import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerController extends GetxController implements GetxService{

  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime selectedToDate = DateTime.now();
  String formatedToDate = "${DateTime.now().year.toString()}-${DateTime.now().month.toString().padLeft(2,'0')}-${DateTime.now().day.toString().padLeft(2,'0')}";
  String formatedFromDate = "${DateTime.now().subtract(const Duration(days: 30)).year.toString()}-${DateTime.now().subtract(const Duration(days: 30)).month.toString().padLeft(2,'0')}-${DateTime.now().subtract(const Duration(days: 30)).day.toString().padLeft(2,'0')}";
  Future<void> setSelectDate(BuildContext context, {bool fromDate = false}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {

      if(fromDate){
        selectedDate = picked;
        formatedFromDate = "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2,'0')}-${selectedDate.day.toString().padLeft(2,'0')}";
      }else{
        selectedToDate = picked;
        formatedToDate = "${selectedToDate.year.toString()}-${selectedToDate.month.toString().padLeft(2,'0')}-${selectedToDate.day.toString().padLeft(2,'0')}";
      }

      log("message=== $selectedDate");
    }
    update();
  }
}