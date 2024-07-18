import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  String? hintext;
  bool isExpanded;
  IconData? icon;
  IconData? icontraling;
  Function? ontap;

  bool hide;
  Function(String?)? validator;
  TextEditingController? controller;
  CustomTextField(
      {super.key,
      this.icon,
      this.ontap,
      this.isExpanded = false,
      this.hintext,
      this.icontraling,
      required this.hide,
      this.controller,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final textfield = Container(
        decoration: BoxDecoration(
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
            padding: EdgeInsets.all(5.sp),
            child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      color: AppColors.greyscale,
                      onPressed: () => widget.ontap!(),
                      icon: Icon(
                        widget.icon,
                        color: AppColors.grey,
                      )),
                  suffixIcon: IconButton(
                      color: AppColors.greyscale,
                      onPressed: () {},
                      icon: Icon(
                        widget.icontraling,
                        size: 20,
                        color: AppColors.whiteColor,
                      )),
                  // prefixIcon: IconButton(onPressed: () {}, icon: icon),
                  border: InputBorder.none,
                  hintText: widget.hintext,
                  hintStyle: GetTextTheme.fs12_regular,
                ))));
    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}
