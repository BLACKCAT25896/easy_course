import 'package:flutter/material.dart';

class PriceConverter {

  static String convertPrice(BuildContext context, double price, {double? discount, String? discountType}) {
    String decimal =  '2';
    String symbol = "";
    String finalResult;
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price - discount;
      }else if(discountType == 'percent') {
        price = price - ((discount / 100) * price);
      }
    }
    finalResult = '$symbol ''${(price).toStringAsFixed(int.parse(decimal)).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
    return finalResult;
  }

  static double convertWithDiscount(BuildContext context, double price, double discount, String discountType) {
    if(discountType == 'amount') {
      price = price - discount;
    }else if(discountType == 'percent') {
      price = price - ((discount / 100) * price);
    }
    return price;
  }

  static double taxCalculate(double price, double taxAmount) {

    price = ((taxAmount / 100) * price);
    return price;
  }

  static double calculation(double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(BuildContext context, String price, String discount, String discountType) {
    return '$discount${discountType == 'percent' ? '%' : '\$'} OFF';
  }
  static double parseAmount(dynamic amount) {
    if (amount != null) {
      try {
        return amount.toDouble();
      } catch (e) {
        return double.parse(amount.toString());
      }
    }
    return 0.0;
  }
  static int parseInt(dynamic number) {
    if (number != null) {
      try {
        return number.toInt();
      } catch (e) {
        return int.parse(number.toString());
      }
    }
    return 0;
  }

}