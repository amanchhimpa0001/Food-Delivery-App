import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/popular_burger.dart';
import 'package:food_delivery_new_project/food_scrren_all/filter_dailog.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/Restaurants_model/Open_Restaurants.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_food_dummydata.dart';
import 'package:food_delivery_new_project/model/txt_btn_dummydata.dart';

// ignore: must_be_immutable
class Restaurant_view extends StatefulWidget {
  Restaurants_model data;
  Restaurant_view({super.key, required this.data});

  @override
  State<Restaurant_view> createState() => _Restaurant_viewState();
}

class _Restaurant_viewState extends State<Restaurant_view> {
  int btnindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.lightgrey),
            child: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Filter_dailog(),
                  );
                },
                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: AppColors.blackColor,
                )),
          ),
          Appservices.addWidth(15),
        ],
        forceMaterialTransparency: true,
        leadingWidth: 65,
        title: Text(
          'Restaurant View',
          style: GetTextTheme.fs18_regular,
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
              Appservices.addheight(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.data.foodimg,
                      width: AppConfig.screenWidth,
                      fit: BoxFit.cover,
                    )),
              ),
              Appservices.addheight(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  widget.data.Restaurantname,
                  style: GetTextTheme.fs20_bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  widget.data.discription,
                  style: GetTextTheme.fs14_regular
                      .copyWith(color: AppColors.greyColor),
                ),
              ),
              Appservices.addheight(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.orange,
                    ),
                    Text(
                      widget.data.rating,
                      style: GetTextTheme.fs16_bold,
                    ),
                    Appservices.addWidth(30),
                    Icon(
                      Icons.fire_truck,
                      color: AppColors.orange,
                    ),
                    Appservices.addWidth(5),
                    Text(
                      widget.data.dilivery,
                      style: GetTextTheme.fs14_regular,
                    ),
                    Appservices.addWidth(30),
                    Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.orange,
                    ),
                    Appservices.addWidth(5),
                    Text(
                      widget.data.time,
                      style: GetTextTheme.fs14_regular,
                    ),
                  ],
                ),
              ),
              Appservices.addheight(15),
              AspectRatio(
                aspectRatio: 6,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dummydata.food_button.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 25.w),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: AppColors.lightgrey, width: 2),
                                borderRadius: BorderRadius.circular(40)),
                            backgroundColor: btnindex == index
                                ? AppColors.orange
                                : AppColors.tranceparent,
                          ),
                          onPressed: () {
                            setState(() {
                              Navigator.pushNamed(
                                  context, Routsname.Food_screen);
                              btnindex = index;
                            });
                          },
                          child: Text(
                            dummydata.food_button[index],
                            style: GetTextTheme.fs12_regular.copyWith(
                                color: btnindex == index
                                    ? AppColors.lightgrey
                                    : AppColors.blackColor),
                          )),
                    );
                  },
                ),
              ),
              Appservices.addheight(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text(
                  "Burger (10)",
                  style: GetTextTheme.fs20_regular,
                ),
              ),
              Appservices.addheight(15),
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
            ],
          ),
        ),
      ),
    );
  }
}
