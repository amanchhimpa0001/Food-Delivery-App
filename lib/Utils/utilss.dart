import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';

class Utils {
  static snakbar(String massage, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.pink, content: Text(massage)));
  }

  static toastmassage(String massage) {
    Fluttertoast.showToast(
        msg: massage,
        backgroundColor: AppColors.orange,
        textColor: Colors.amber);
  }
}
