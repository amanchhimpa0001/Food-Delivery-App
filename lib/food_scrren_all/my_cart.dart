import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/peymants_screen/peymant_screen.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/popular_fast_food/popular_fast_food.dart';

// ignore: must_be_immutable
class My_cart extends StatefulWidget {
  Popular_fastfood_model data;
  My_cart({super.key, required this.data});

  @override
  State<My_cart> createState() => _My_cartState();
}

class _My_cartState extends State<My_cart> {
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
            'Cart',
            style: GetTextTheme.fs20_regular,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black12),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  color: AppColors.grey10)
                            ]),
                        width: 136,
                        height: 117,
                        child: Image.asset(
                          (widget.data.fastfoodimg),
                          fit: BoxFit.cover,
                          width: AppConfig.screenWidth,
                        )),
                    Appservices.addWidth(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.namepizza,
                          style: GetTextTheme.fs18_regular,
                        ),
                        // Chip(
                        //     backgroundColor: AppColors.darkred,
                        //     shape: CircleBorder(
                        //         side: BorderSide(color: AppColors.darkred)),
                        //     label: Icon(
                        //       Icons.close,
                        //       color: AppColors.whiteColor,
                        //     )),
                        Text(
                          widget.data.foodprice,
                          style: GetTextTheme.fs20_bold,
                        ),
                        Appservices.addheight(25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addvalue == 0 ? SizedBox() : addvalue--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.blackColor,
                                  )),
                              Text(
                                addvalue.toString(),
                                style: GetTextTheme.fs21_extrabold
                                    .copyWith(color: AppColors.blackColor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      addvalue++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.blackColor,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                    Appservices.addWidth(10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.orange),
                      child: IconButton(
                          onPressed: () {
                            Appservices.goback(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: AppColors.whiteColor,
                            size: 20,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomSheet: SizedBox(
          height: AppConfig.screenHeight / 3,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightgrey),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appservices.addheight(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Address',
                          style: GetTextTheme.fs14_regular
                              .copyWith(color: AppColors.grey),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Text(
                              'EDIT',
                              style: GetTextTheme.fs14_regular
                                  .copyWith(color: AppColors.orange),
                            ))
                      ],
                    ),
                    Appservices.addheight(10),
                    Text(
                      '2118 Thornridge Cir. Syracuse',
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.grey),
                    ),
                    Appservices.addheight(10),
                    Row(
                      children: [
                        Text(
                          'TOTAL: ',
                          style: GetTextTheme.fs14_regular
                              .copyWith(color: AppColors.grey),
                        ),
                        Text('\$10', style: GetTextTheme.fs30_regular),
                        Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {},
                            icon: Text(
                              'Breakdown	⪢',
                              style: GetTextTheme.fs14_regular
                                  .copyWith(color: AppColors.orange),
                            ))
                      ],
                    ),
                    Appservices.addheight(25),
                    CustomElevatedButton(
                      peddingv: 18,
                      btnName: "PLACE ORDER",
                      onTap: () {
                        Appservices.pushto(context, Peymant_page());
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
