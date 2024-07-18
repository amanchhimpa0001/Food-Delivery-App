import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/open_Restaurants.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/popular_burger.dart';

import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/Restaurants_model/dummydata.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_food_dummydata.dart';

class Food_screen extends StatelessWidget {
  Food_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Popular_fastfood_model data;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.blackColor),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.whiteColor,
                )),
          ),
          Appservices.addWidth(10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.lightgrey),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.graphic_eq_outlined,
                  color: AppColors.blackColor,
                )),
          ),
          Appservices.addWidth(15),
        ],
        forceMaterialTransparency: true,
        leadingWidth: 65,
        title: Container(
          height: 45,
          width: 90,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.greyColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Burger',
                style: GetTextTheme.fs12_bold,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.orange,
              )
            ],
          ),
        ),
        leading: Container(
          margin: EdgeInsets.all(5).copyWith(left: 15),
          // height: 45,
          // width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.lightgrey),
          child: IconButton(
              onPressed: () {
                Appservices.goback(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 20,
              )),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  "Popular Burgers",
                  style: GetTextTheme.fs20_regular,
                ),
              ),
              Appservices.addheight(10),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                itemCount: Popular_food.Popular_food_list.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) => Popular_burger_widget(
                    data: Popular_food.Popular_food_list[index]),
              ),
              Appservices.addheight(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  "Open Resturants",
                  style: GetTextTheme.fs20_regular,
                ),
              ),
              Appservices.addheight(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Open_Restaurants.Open_Restaurantslist.length,
                    itemBuilder: (context, index) => Open_Restaurants_tile(
                          restaurantsdata:
                              Open_Restaurants.Open_Restaurantslist[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
