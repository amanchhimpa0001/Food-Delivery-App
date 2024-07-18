import 'package:flutter/material.dart';

import 'package:food_delivery_new_project/food_scrren_all/Details_screen.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_fast_food.dart';

// ignore: must_be_immutable
class Popular_burger_widget extends StatelessWidget {
  Popular_burger_widget({super.key, required this.data});
  Popular_fastfood_model data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, Routsname.Details_food_page);
        Appservices.pushto(context, Details_food_page(modeldata: data));
      },
      child: Column(
        children: [
          Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding:
                      EdgeInsets.only(top: 55, bottom: 10, left: 15, right: 10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.namepizza,
                        style: GetTextTheme.fs14_bold,
                      ),
                      Appservices.addheight(5),
                      Text(
                        data.Resipename,
                        style: GetTextTheme.fs13_regular,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.foodprice),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.orange),
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  child: Image.asset(
                    data.fastfoodimg,
                    scale: 1,
                  ),
                )
              ]),
        ],
      ),
    );
  }
}
