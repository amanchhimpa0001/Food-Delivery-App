import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/All_Categories/All_Categories_model.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.categories_data_helper});
  All_Categories_model categories_data_helper;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routsname.Food_screen);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding:
                      EdgeInsets.only(top: 65, bottom: 10, left: 10, right: 10),
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
                        categories_data_helper.foodname,
                        style: GetTextTheme.fs18_bold,
                      ),
                      Appservices.addheight(5),
                      Row(
                        children: [
                          Text(
                            categories_data_helper.pricetxt,
                            style: GetTextTheme.fs14_regular,
                          ),
                          Appservices.addWidth(25),
                          Text(
                            categories_data_helper.startingprice,
                            style: GetTextTheme.fs16_regular,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
                child: Image.asset(
                  categories_data_helper.image,
                  scale: 1,
                ),
              )
            ]),
      ],
    );
  }
}
