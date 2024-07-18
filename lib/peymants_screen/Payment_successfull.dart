import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Payment_successfull extends StatefulWidget {
  const Payment_successfull({super.key});

  @override
  State<Payment_successfull> createState() => _Payment_successfullState();
}

class _Payment_successfullState extends State<Payment_successfull> {
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
                Icons.close,
                size: 20,
              )),
        ),
        forceMaterialTransparency: true,
        leadingWidth: 65,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.lightgrey),
                      padding: EdgeInsets.all(20),
                      child: Image.asset(Getimage.congratulations))),
              Appservices.addheight(10),
              Text(
                "Congratulations!",
                style: GetTextTheme.fs24_bold,
              ),
              Appservices.addheight(10),
              Text(
                "You successfully maked a payment, enjoy our service!",
                style: GetTextTheme.fs16_regular
                    .copyWith(color: AppColors.greyColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
