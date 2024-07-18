import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/textformfield.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

import 'Payment_successfull.dart';

class Add_card extends StatelessWidget {
  const Add_card({super.key});

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
          'Add Card',
          style: GetTextTheme.fs20_regular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(20),
              Text(
                'CARD HOLDER NAME',
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greyColor),
              ),
              Appservices.addheight(5),
              Customtextformfilled(
                style: GetTextTheme.fs12_regular,
                hintText: 'Aman',
                fillcolor: AppColors.lightgrey,
              ),
              Appservices.addheight(20),
              Text(
                'CARD NUMBER',
                style: GetTextTheme.fs14_regular
                    .copyWith(color: AppColors.greyColor),
              ),
              Appservices.addheight(5),
              Customtextformfilled(
                style: GetTextTheme.fs12_regular,
                hintText: '2134 _ _ _ _ _ _ _ _',
                fillcolor: AppColors.lightgrey,
              ),
              Appservices.addheight(20),
              Row(
                children: [
                  Text(
                    'EXPIRE DATE',
                    style: GetTextTheme.fs14_regular
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Appservices.addWidth(AppConfig.screenWidth / 3.8),
                  Text(
                    'CVC',
                    style: GetTextTheme.fs14_regular
                        .copyWith(color: AppColors.greyColor),
                  ),
                ],
              ),
              Appservices.addheight(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Customtextformfilled(
                      isExpanded: true,
                      fillcolor: AppColors.lightgrey,
                      hintText: 'mm/yyyy',
                      style: GetTextTheme.fs12_regular),
                  Appservices.addWidth(5),
                  Customtextformfilled(
                      fillcolor: AppColors.lightgrey,
                      isExpanded: true,
                      hintText: '***',
                      style: GetTextTheme.fs12_regular),
                ],
              ),
              Expanded(child: SizedBox()),
              CustomElevatedButton(
                peddingv: 18,
                btnName: "ADD & MAKE PAYMENT",
                onTap: () {
                  Appservices.pushto(context, Payment_successfull());
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
