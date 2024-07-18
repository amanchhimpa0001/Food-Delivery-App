import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/sliders_funtion.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Sliders_page extends StatefulWidget {
  const Sliders_page({super.key});

  @override
  State<Sliders_page> createState() => _Sliders_pageState();
}

class _Sliders_pageState extends State<Sliders_page> {
  List<Widget> slider = [
    Sliderfunction(
        salonimage: Getimage.slidersimg1, description: "All your favorites"),
    Sliderfunction(
        salonimage: Getimage.slidersimg2,
        description: "Order from choosen chef"),
    Sliderfunction(
        salonimage: Getimage.slidersimg3, description: "Free delivery offers"),
  ];
  int index = 0;
  CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Appservices.addheight(40),
                CarouselSlider(
                    carouselController: _carouselController,
                    items: slider,
                    options: CarouselOptions(
                      onPageChanged: (i, _) {
                        setState(() {
                          index = i;
                        });
                      },
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      aspectRatio: 0.66,
                      initialPage: 3,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(slider.length, (i) {
                    return Container(
                      margin: EdgeInsets.only(right: 5, bottom: 50),
                      height: 6,
                      width: index == i ? 5 : 5,
                      decoration: BoxDecoration(
                          color: i == index
                              ? AppColors.darkred
                              : AppColors.lightred,
                          borderRadius: BorderRadius.circular(50.r)),
                    );
                  }),
                ),
                CustomElevatedButton(
                    peddingv: 20,
                    style: GetTextTheme.fs16_medium,
                    color: AppColors.yellow,
                    foreground_clr: AppColors.whiteColor,
                    btnName: "Next",
                    onTap: () {
                      index == slider.length - 1
                          ? Navigator.pushNamed(context, Routsname.Login_Page)
                          : _carouselController.nextPage();
                    }),
                Appservices.addheight(30),
                index != 2
                    ? TextButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.only(bottom: 15.h))),
                        onPressed: () {
                          _carouselController.nextPage();
                        },
                        child: Text(
                          "Skip",
                          style: GetTextTheme.fs14_medium
                              .copyWith(color: AppColors.grey),
                        ))
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
