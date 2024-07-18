import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_fast_food.dart';

// ignore: must_be_immutable
class Popular_fastfood_widget extends StatelessWidget {
  Popular_fastfood_widget({super.key, required this.fooddata});
  Popular_fastfood_model fooddata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                padding:
                    EdgeInsets.only(top: 55, bottom: 10, left: 15, right: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 16,
                          spreadRadius: 5,
                          color: AppColors.grey10)
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.whiteColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fooddata.namepizza,
                      style: GetTextTheme.fs14_bold,
                    ),
                    Appservices.addheight(5),
                    Text(
                      fooddata.Resipename,
                      style: GetTextTheme.fs13_regular,
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                child: Image.asset(
                  fooddata.fastfoodimg,
                  scale: 1,
                ),
              )
            ]),
      ],
    );
  }
}
