import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/txt_btn_dummydata.dart';

class Filter_dailog extends StatefulWidget {
  const Filter_dailog({super.key});

  @override
  State<Filter_dailog> createState() => _Filter_dailogState();
}

class _Filter_dailogState extends State<Filter_dailog> {
  int btnindexoffers = 0;
  int btnindexdilverstime = 0;
  int btnindexpeckings = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter your search",
                  style: GetTextTheme.fs18_regular,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.containergry),
                  child: IconButton(
                      onPressed: () {
                        Appservices.goback(context);
                      },
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      )),
                ),
              ],
            ),
            Appservices.addheight(15),
            Text(
              "OFFERS",
              style: GetTextTheme.fs13_regular,
            ),
            Appservices.addheight(10),
            AspectRatio(
              aspectRatio: 6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dummydata.Offers_list.length,
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
                                  color: btnindexoffers == index
                                      ? AppColors.orange
                                      : AppColors.greyColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(40)),
                          backgroundColor: btnindexoffers == index
                              ? AppColors.orange
                              : AppColors.tranceparent,
                        ),
                        onPressed: () {
                          setState(() {
                            btnindexoffers = index;
                          });
                        },
                        child: Text(
                          dummydata.Offers_list[index],
                          style: GetTextTheme.fs12_regular.copyWith(
                              color: btnindexoffers == index
                                  ? AppColors.lightgrey
                                  : AppColors.blackColor),
                        )),
                  );
                },
              ),
            ),
            Appservices.addheight(20),
            Text(
              "DELIVER TIME",
              style: GetTextTheme.fs13_regular,
            ),
            Appservices.addheight(10),
            AspectRatio(
              aspectRatio: 6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dummydata.DeliverTimelist.length,
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
                                  color: btnindexdilverstime == index
                                      ? AppColors.orange
                                      : AppColors.greyColor,
                                  width: 1),
                              borderRadius: BorderRadius.circular(40)),
                          backgroundColor: btnindexdilverstime == index
                              ? AppColors.orange
                              : AppColors.tranceparent,
                        ),
                        onPressed: () {
                          setState(() {
                            btnindexdilverstime = index;
                          });
                        },
                        child: Text(
                          dummydata.DeliverTimelist[index],
                          style: GetTextTheme.fs12_regular.copyWith(
                              color: btnindexdilverstime == index
                                  ? AppColors.lightgrey
                                  : AppColors.blackColor),
                        )),
                  );
                },
              ),
            ),
            Appservices.addheight(20),
            Text(
              "PACKING",
              style: GetTextTheme.fs13_regular,
            ),
            Appservices.addheight(10),
            AspectRatio(
              aspectRatio: 6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dummydata.peckinglist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            btnindexpeckings = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: btnindexpeckings == index
                                ? AppColors.orange
                                : AppColors.tranceparent,
                          ),
                          child: Center(
                            child: Text(
                              dummydata.peckinglist[index],
                              style: GetTextTheme.fs16_regular.copyWith(
                                  color: btnindexpeckings == index
                                      ? AppColors.lightgrey
                                      : AppColors.blackColor),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            Appservices.addheight(20),
            Text(
              "RATING",
              style: GetTextTheme.fs13_regular,
            ),
            Appservices.addheight(10),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, _) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: AppColors.lightgrey,
                      width: 0.1,
                    )),
                child: Icon(
                  Icons.star,
                  color: AppColors.orange,
                  size: 10,
                ),
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Appservices.addheight(25),
            CustomElevatedButton(
              peddingv: 18,
              btnName: "FILTER",
              onTap: () {},
              foreground_clr: AppColors.whiteColor,
              color: AppColors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
