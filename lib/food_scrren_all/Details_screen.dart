import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/food_scrren_all/my_cart.dart';

import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_fast_food.dart';

// ignore: must_be_immutable
class Details_food_page extends StatefulWidget {
  Details_food_page({super.key, required this.modeldata});
  Popular_fastfood_model modeldata;
  @override
  State<Details_food_page> createState() => _Details_food_pageState();
}

class _Details_food_pageState extends State<Details_food_page> {
  int addvalue = 1;
  bool chekvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
          forceMaterialTransparency: true,
          leadingWidth: 65,
          title: Text(
            'Burger',
            style: GetTextTheme.fs20_regular,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appservices.addheight(20),
                  Stack(alignment: Alignment.bottomRight, children: [
                    Container(
                        height: AppConfig.screenHeight / 4.3,
                        decoration: BoxDecoration(
                            boxShadow: [],
                            borderRadius: BorderRadius.circular(50)),
                        width: AppConfig.screenWidth,
                        child: Image.asset(
                          widget.modeldata.fastfoodimg,
                          fit: BoxFit.fitHeight,
                        )),
                    Positioned(
                        bottom: 40,
                        right: 40,
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.lightred,
                        ))
                  ]),
                  Appservices.addheight(20),
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightgrey),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/house.png",
                        ),
                        Appservices.addWidth(10),
                        Text(
                          widget.modeldata.Resipename,
                          style: GetTextTheme.fs16_regular,
                        )
                      ],
                    ),
                  ),
                  Appservices.addheight(20),
                  Text(
                    widget.modeldata.namepizza,
                    style: GetTextTheme.fs20_bold,
                  ),
                  Text(
                    widget.modeldata.discription,
                    style: GetTextTheme.fs14_regular
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Appservices.addheight(10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.orange,
                      ),
                      Text(
                        widget.modeldata.rating,
                        style: GetTextTheme.fs16_bold,
                      ),
                      Appservices.addWidth(30),
                      Icon(
                        Icons.fire_truck,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(5),
                      Text(
                        widget.modeldata.diliverycharge,
                        style: GetTextTheme.fs14_regular,
                      ),
                      Appservices.addWidth(30),
                      Icon(
                        Icons.watch_later_outlined,
                        color: AppColors.orange,
                      ),
                      Appservices.addWidth(5),
                      Text(
                        widget.modeldata.mints,
                        style: GetTextTheme.fs14_regular,
                      ),
                    ],
                  ),
                  Appservices.addheight(15),
                  Row(
                    children: [
                      Text(
                        "Size:",
                        style: GetTextTheme.fs16_regular
                            .copyWith(color: AppColors.greyColor),
                      ),
                      Appservices.addWidth(5),
                      ...List.generate(
                          widget.modeldata.size.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    chekvalue = !chekvalue;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: chekvalue
                                          ? AppColors.orange
                                          : AppColors.lightgrey),
                                  child: Text(
                                    widget.modeldata.size[index],
                                    style: GetTextTheme.fs16_medium.copyWith(
                                        color: chekvalue
                                            ? AppColors.whiteColor
                                            : AppColors.blackColor),
                                  ),
                                ),
                              ))
                    ],
                  ),
                  Appservices.addheight(20),
                  Text(
                    "INGRIDENTS",
                    style: GetTextTheme.fs13_regular,
                  ),
                  Appservices.addheight(15),
                  Appservices.addheight(10),
                  GridView.builder(
                    itemCount: widget.modeldata.ingredients.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (context, index) => Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: AppColors.lightred),
                          child: Image.asset(widget
                              .modeldata.ingredients[index]["img"]
                              .toString()),
                        ),
                        Appservices.addheight(10),
                        Text(
                          widget.modeldata.ingredients[index]["title"],
                          style: GetTextTheme.fs12_regular,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: SizedBox(
          height: 180,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightgrey),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appservices.addheight(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   "₹${addvalue * double.parse(widget.modeldata.foodprice)}",
                        //   style: GetTextTheme.fs22_medium
                        //       .copyWith(color: AppColors.whiteColor),
                        // ),
                        Text(
                          widget.modeldata.foodprice,
                          style: GetTextTheme.fs24_bold,
                        ),
                        Appservices.addheight(20),
                        Row(
                          children: [
                            Appservices.addWidth(20),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.blackColor,
                                  borderRadius: BorderRadius.circular(70),
                                  border:
                                      Border.all(color: AppColors.whiteColor)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            addvalue == 0
                                                ? SizedBox()
                                                : addvalue--;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          color: AppColors.whiteColor,
                                        )),
                                    Text(
                                      addvalue.toString(),
                                      style: GetTextTheme.fs21_extrabold
                                          .copyWith(
                                              color: AppColors.whiteColor),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            addvalue++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: AppColors.whiteColor,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Appservices.addheight(25),
                    CustomElevatedButton(
                      peddingv: 18,
                      btnName: "ADD TO CART",
                      onTap: () {
                        Appservices.pushto(
                            context,
                            My_cart(
                              data: widget.modeldata,
                            ));
                      },
                      foreground_clr: AppColors.whiteColor,
                      color: AppColors.orange,
                    ),
                  ]),
            ),
          ),
        ));
  }
}
