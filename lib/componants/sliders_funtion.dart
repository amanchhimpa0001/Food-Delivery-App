// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Sliderfunction extends StatelessWidget {
  String salonimage;
  String description;

  Sliderfunction({
    super.key,
    required this.salonimage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(salonimage),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Appservices.addheight(15),
              Text(
                description,
                style: GetTextTheme.fs24_medium,
                textAlign: TextAlign.center,
              ),
              Appservices.addheight(35),
              Text(
                "Get all your loved foods in one once place, you just place the orer we do the rest",
                style: GetTextTheme.fs14_medium.copyWith(color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
