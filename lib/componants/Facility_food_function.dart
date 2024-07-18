import 'package:flutter/material.dart';

import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

// ignore: must_be_immutable
class Facility_food_function extends StatelessWidget {
  String img, tittle;
  bool isExpanded;

  Facility_food_function({
    super.key,
    required this.img,
    required this.tittle,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final btn = Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColors.orange),
      child: Row(
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: AppColors.whiteColor),
            child: Image.asset(
              img,
              scale: 3,
            ),
          ),
          Appservices.addWidth(15),
          Text(
            tittle,
            style: GetTextTheme.fs14_medium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    return isExpanded ? Expanded(child: btn) : btn;
  }
}
