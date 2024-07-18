import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/txt_btn_dummydata.dart';
import 'package:food_delivery_new_project/peymants_screen/Add_card.dart';

class Peymant_page extends StatefulWidget {
  const Peymant_page({super.key});

  @override
  State<Peymant_page> createState() => _Peymant_pageState();
}

class _Peymant_pageState extends State<Peymant_page> {
  int btnindex = 0;
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
          'Payment',
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 3,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  shrinkWrap: true,
                  itemCount: dummydata.cardlist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              btnindex = index;
                            });
                          },
                          child: btnindex == index
                              ? Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topRight,
                                  children: [
                                      Container(
                                        height: 72,
                                        width: 85,
                                        margin: EdgeInsets.only(top: 20),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: btnindex == index
                                                    ? AppColors.orange
                                                    : AppColors.tranceparent,
                                                width: 2),
                                            shape: BoxShape.rectangle,
                                            color: AppColors.lightgrey),
                                        child: Image.asset(
                                            dummydata.cardlist[index]["image"]),
                                      ),
                                      Positioned(
                                        bottom: 60,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: AppColors.orange),
                                          child: Icon(
                                            Icons.check_sharp,
                                            size: 20,
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      )
                                    ])
                              : Container(
                                  height: 72,
                                  width: 85,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: btnindex == index
                                              ? AppColors.orange
                                              : AppColors.tranceparent,
                                          width: 2),
                                      shape: BoxShape.rectangle,
                                      color: AppColors.lightgrey),
                                  child: Image.asset(
                                      dummydata.cardlist[index]["image"]),
                                ),
                        ),
                        Appservices.addheight(2),
                        Text(
                          dummydata.cardlist[index]["cardname"],
                          style: GetTextTheme.fs14_regular,
                        )
                      ],
                    );
                  },
                ),
              ),
              Appservices.addheight(15),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: AppColors.lightgrey),
                  child: Column(
                    children: [
                      Image.asset(Getimage.card),
                      Appservices.addheight(15),
                      Text(
                        "Empty Payment Method",
                        style: GetTextTheme.fs16_bold,
                      ),
                      Appservices.addheight(15),
                      Text(
                        "You can add a mastercard and save it for later",
                        style: GetTextTheme.fs14_regular,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Appservices.addheight(15),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: AppConfig.screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.lightgrey, width: 2)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.orange,
                        ),
                        Appservices.addWidth(10),
                        Text(
                          "ADD NEW",
                          style: GetTextTheme.fs14_bold
                              .copyWith(color: AppColors.orange),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  Text(
                    'TOTAL: ',
                    style: GetTextTheme.fs14_regular
                        .copyWith(color: AppColors.grey),
                  ),
                  Text('\$10', style: GetTextTheme.fs30_regular),
                ],
              ),
              Appservices.addheight(20),
              CustomElevatedButton(
                peddingv: 18,
                btnName: "PAY & CONFIRM",
                onTap: () {
                  Appservices.pushto(context, Add_card());
                },
                foreground_clr: AppColors.whiteColor,
                color: AppColors.orange,
              ),
              Appservices.addheight(20)
            ],
          ),
        ),
      ),
    );
  }
}
