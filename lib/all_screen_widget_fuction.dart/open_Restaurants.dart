import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/food_scrren_all/Restaurant_view.dart';

import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/Restaurants_model/Open_Restaurants.dart';

// ignore: must_be_immutable
class Open_Restaurants_tile extends StatelessWidget {
  Open_Restaurants_tile({super.key, required this.restaurantsdata});
  Restaurants_model restaurantsdata;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Appservices.pushto(context, Restaurant_view(data: restaurantsdata));
      },
      child: Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  restaurantsdata.foodimg,
                  fit: BoxFit.cover,
                ),
              ),
              Appservices.addheight(10),
              Text(
                restaurantsdata.Restaurantname,
                style: GetTextTheme.fs20_regular,
              ),
              Appservices.addheight(5),
              Text(
                restaurantsdata.types,
                style: GetTextTheme.fs14_regular,
              ),
              Appservices.addheight(5),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.orange,
                  ),
                  Text(
                    restaurantsdata.rating,
                    style: GetTextTheme.fs16_bold,
                  ),
                  Appservices.addWidth(20),
                  Icon(
                    Icons.fire_truck,
                    color: AppColors.orange,
                  ),
                  Appservices.addWidth(5),
                  Text(
                    restaurantsdata.dilivery,
                    style: GetTextTheme.fs14_regular,
                  ),
                  Appservices.addWidth(20),
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.orange,
                  ),
                  Appservices.addWidth(5),
                  Text(
                    restaurantsdata.time,
                    style: GetTextTheme.fs14_regular,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
