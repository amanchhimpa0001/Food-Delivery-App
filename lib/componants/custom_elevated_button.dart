// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';

class CustomElevatedButton extends StatelessWidget {
  String btnName;
  Function onTap;
  Color? color;
  Color? bordercolor;

  bool isExpanded;
  Color foreground_clr;
  TextStyle? style;
  double? peddingh, peddingv;

  CustomElevatedButton(
      {this.isExpanded = false,
      this.peddingh = 10,
      this.peddingv = 10,
      required this.btnName,
      required this.onTap,
      this.bordercolor = const Color.fromARGB(31, 249, 248, 248),
      this.color,
      this.style,
      this.foreground_clr = AppColors.blackColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final btnexpended = Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
                style: ButtonStyle(
                    side: MaterialStatePropertyAll(
                        BorderSide(color: bordercolor!)),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      vertical: peddingv!,
                      horizontal: peddingh!,
                    )),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(
                        color ?? AppColors.primaryColor),
                    foregroundColor: MaterialStateProperty.all(foreground_clr)),
                onPressed: () => onTap(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btnName,
                      style: style,
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ),
        )
      ],
    );
    return isExpanded ? Expanded(child: btnexpended) : btnexpended;
  }
}
