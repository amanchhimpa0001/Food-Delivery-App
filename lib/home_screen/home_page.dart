import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/Categories_widget.dart';
import 'package:food_delivery_new_project/all_screen_widget_fuction.dart/open_Restaurants.dart';
import 'package:food_delivery_new_project/componants/tittle_bar_fuction.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/All_Categories/Categories_duumydata.dart';
import 'package:food_delivery_new_project/model/Restaurants_model/dummydata.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

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
          Appservices.addWidth(10)
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVER TO',
              style: GetTextTheme.fs12_medium.copyWith(color: AppColors.orange),
            ),
            Row(
              children: [
                Text(
                  'Los Angeles, USA',
                  style: GetTextTheme.fs12_regular
                      .copyWith(color: AppColors.greyColor),
                ),
                InkWell(
                    onTap: () {}, child: Icon(Icons.arrow_drop_down_outlined))
              ],
            ),
          ],
        ),
        forceMaterialTransparency: true,
        leadingWidth: 75,
        leading: Container(
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.lightgrey),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu_sharp)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Hey Septa,",
                          style: GetTextTheme.fs16_regular
                              .copyWith(color: AppColors.blackColor)),
                      TextSpan(
                          text: "Good Afternoon!",
                          style: GetTextTheme.fs16_bold.copyWith(
                            color: AppColors.blackColor,
                          )),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Appservices.addheight(10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routsname.Serach_food);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 61,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textformfieldcolor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.grey,
                        ),
                        Appservices.addWidth(10),
                        Text(
                          "What will you like to eat?",
                          style: GetTextTheme.fs16_regular
                              .copyWith(color: AppColors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Appservices.addheight(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: tittlebar(
                    ontap: () {},
                    tittle: "All Categories",
                    btnname: "See All",
                    tittlecolor: AppColors.blackColor),
              ),
              SizedBox(
                height: AppConfig.screenHeight / 4.9,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          Categories_data_Helper.CategoriescallList.length,
                      itemBuilder: (context, index) => CategoryTile(
                            categories_data_helper: Categories_data_Helper
                                .CategoriescallList[index],
                          )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: tittlebar(
                    ontap: () {},
                    tittle: "Open Restaurants",
                    btnname: "See All",
                    tittlecolor: AppColors.blackColor),
              ),
              Appservices.addheight(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
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
