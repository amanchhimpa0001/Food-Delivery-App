import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/SuggestedRestaurants.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/popular_fast_food_widget.dart';
import 'package:food_delivery_new_project/componants/custom_textfield.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/Restaurants_model/dummydata.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_food_dummydata.dart';
import 'package:food_delivery_new_project/model/txt_btn_dummydata.dart';

class Serach_food extends StatefulWidget {
  const Serach_food({super.key});

  @override
  State<Serach_food> createState() => _Serach_foodState();
}

class _Serach_foodState extends State<Serach_food> {
  int btnindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(alignment: Alignment.topRight, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.blackColor),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.card_travel_outlined,
                    color: AppColors.whiteColor,
                  )),
            ),
            Container(
              padding: EdgeInsets.only(left: 7, right: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.orange),
              child: Text(
                '2',
                style: GetTextTheme.fs14_medium
                    .copyWith(color: AppColors.whiteColor),
              ),
            )
          ]),
          Appservices.addWidth(15)
        ],
        title: Text(
          'Search',
          style: GetTextTheme.fs20_regular,
        ),
        forceMaterialTransparency: true,
        leadingWidth: 66,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          height: 45,
          width: 45,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appservices.addheight(10),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: CustomTextField(
                      icontraling: Icons.close,
                      ontap: () {},
                      icon: Icons.search,
                      hide: false,
                      hintext: "Seraching........"),
                ),
                Appservices.addheight(10),
                Text(
                  'Recent Keywords',
                  style: GetTextTheme.fs20_regular,
                ),
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
                Appservices.addheight(20),
                Text(
                  'Suggested Restaurants',
                  style: GetTextTheme.fs20_regular,
                ),
                Appservices.addheight(30),
                ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                        ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Open_Restaurants.Open_Restaurantslist.length,
                    itemBuilder: (context, index) => Suggested_Restaurants_tile(
                          Suggested_Restaurantdata:
                              Open_Restaurants.Open_Restaurantslist[index],
                        )),
                Divider(),
                Appservices.addheight(20),
                Text(
                  'Popular Fast Food',
                  style: GetTextTheme.fs20_regular,
                ),
                Appservices.addheight(10),
                AspectRatio(
                  aspectRatio: 2.6,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 25,
                    ),
                    itemCount: Popular_food.Popular_food_list.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Popular_fastfood_widget(
                        fooddata: Popular_food.Popular_food_list[index]),
                  ),
                ),
                Appservices.addheight(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
