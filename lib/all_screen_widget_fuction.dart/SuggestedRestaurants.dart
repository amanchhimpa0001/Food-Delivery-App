import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/Restaurants_model/Open_Restaurants.dart';

// ignore: must_be_immutable
class Suggested_Restaurants_tile extends StatefulWidget {
  Suggested_Restaurants_tile(
      {super.key, required this.Suggested_Restaurantdata});
  Restaurants_model Suggested_Restaurantdata;

  @override
  State<Suggested_Restaurants_tile> createState() =>
      _Suggested_Restaurants_tileState();
}

class _Suggested_Restaurants_tileState
    extends State<Suggested_Restaurants_tile> {
  bool ischakvalue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
              height: 51,
              width: 61,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.Suggested_Restaurantdata.foodimg,
                  fit: BoxFit.cover,
                ),
              )),
          Appservices.addWidth(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.Suggested_Restaurantdata.Restaurantname,
                style: GetTextTheme.fs16_regular,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ischakvalue = !ischakvalue;
                      });
                    },
                    child: Icon(Icons.star_border,
                        color: ischakvalue
                            ? AppColors.orange
                            : AppColors.darkgrey),
                  ),
                  Appservices.addWidth(5),
                  Text(
                    widget.Suggested_Restaurantdata.rating,
                    style: GetTextTheme.fs16_regular,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
