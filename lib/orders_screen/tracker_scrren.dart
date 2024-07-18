import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/textformfield.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/orders_screen/Tracker_orders.dart';

class Tracker_page extends StatelessWidget {
  const Tracker_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(Getimage.trackoders),
          Appservices.addheight(20),
          Text(
            "TRACK YOUR ORDER",
            style: GetTextTheme.fs28_bold,
          ),
          Appservices.addheight(10),
          Text(
            "Enter your tracking number below",
            style: GetTextTheme.fs14_regular,
          ),
          Appservices.addheight(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Customtextformfilled(
              style: GetTextTheme.fs12_regular,
              hintText: 'Tracking number',
              fillcolor: AppColors.lightgrey,
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CustomElevatedButton(
              peddingv: 18,
              btnName: "PAY & CONFIRM",
              onTap: () {
                Appservices.pushto(context, Tracker_orders());
              },
              foreground_clr: AppColors.whiteColor,
              color: AppColors.orange,
            ),
          ),
          Appservices.addheight(20),
        ],
      ),
    );
  }
}
