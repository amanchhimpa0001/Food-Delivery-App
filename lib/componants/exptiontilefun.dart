import 'package:flutter/material.dart';

import 'package:food_delivery_new_project/helpers/color_sheet.dart';

// ignore: must_be_immutable
class exptiontilefuction extends StatelessWidget {
  String cardname;
  IconData icon;
  Function onPressed;
  Color? color;
  exptiontilefuction(
      {super.key,
      this.color,
      required this.cardname,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Card(
          elevation: 0,
          color: AppColors.lightgrey,
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.whiteColor),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.greyColor,
            ),
            title: Text(
              cardname,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )),
    );
  }
}
