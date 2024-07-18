import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/orders_screen/tracker_scrren.dart';

import '../../helpers/all_image.dart';

class ongoing_orders extends StatelessWidget {
  const ongoing_orders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appservices.addheight(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "food",
                style: GetTextTheme.fs14_regular,
              ),
            ),
            Divider(),
            Appservices.addheight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 61,
                      width: 61,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Getimage.CafenioCoffeeClubimg,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Appservices.addWidth(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Appservices.addheight(2),
                      Text(
                        "Pizza Hut",
                        style: GetTextTheme.fs18_regular,
                      ),
                      Row(
                        children: [
                          Text("\$35.25", style: GetTextTheme.fs16_bold),
                          Appservices.addWidth(10),
                          Container(
                            height: 30,
                            width: 1,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor,
                            ),
                          ),
                          Appservices.addWidth(10),
                          Text(
                            "  01 Items",
                            style: GetTextTheme.fs12_regular
                                .copyWith(color: AppColors.greyColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    "#162432",
                    style: GetTextTheme.fs12_regular
                        .copyWith(color: AppColors.greyColor),
                  )
                ],
              ),
            ),
            Appservices.addheight(20),
            Row(
              children: [
                CustomElevatedButton(
                  isExpanded: true,
                  btnName: "Track Order",
                  foreground_clr: AppColors.whiteColor,
                  onTap: () {
                    Appservices.pushto(context, Tracker_page());
                  },
                  peddingv: 15,
                  color: AppColors.orange,
                ),
                CustomElevatedButton(
                  isExpanded: true,
                  foreground_clr: AppColors.orange,
                  btnName: "Cancal",
                  onTap: () {},
                  peddingv: 15,
                  bordercolor: AppColors.orange,
                  color: AppColors.whiteColor,
                )
              ],
            ),

            // CustomElevatedButton(
            //     btnName: "ajhmca",
            //     onTap: () {
            //       Appservices.pushto(context, Tracker_page());
            //     })
          ],
        ),
      ),
    );
  }
}
