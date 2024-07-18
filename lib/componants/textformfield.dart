import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

// ignore: must_be_immutable
class Customtextformfilled extends StatefulWidget {
  TextEditingController? controller;
  IconData? icon;
  bool darkHint;
  Function? onSufixPressed;
  bool isExpanded;
  String? hintText;
  Function(String?)? validator;
  bool obsecure;
  Color? fillcolor;
  Function(String?)? onchange;
  TextStyle? style;

  Customtextformfilled({
    super.key,
    this.icon,
    this.isExpanded = false,
    this.onSufixPressed,
    this.darkHint = false,
    this.obsecure = false,
    this.controller,
    this.hintText,
    this.onchange,
    this.validator,
    this.style,
    this.fillcolor,
  });

  @override
  State<Customtextformfilled> createState() => _CustomtextformfilledState();
}

class _CustomtextformfilledState extends State<Customtextformfilled> {
  @override
  Widget build(BuildContext context) {
    final textfield = TextFormField(
        style: GetTextTheme.fs12_medium.copyWith(color: AppColors.grey),
        controller: widget.controller,
        obscureText: widget.obsecure,
        onChanged: widget.onchange,
        validator: widget.validator == null
            ? null
            : (value) => widget.validator!(value),
        decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillcolor,
            hintText: widget.hintText,
            hintStyle: widget.style,
            suffixIcon: IconButton(
                color: AppColors.greyscale,
                onPressed: widget.onSufixPressed != null
                    ? () => widget.onSufixPressed!()
                    : null,
                icon: Icon(
                  widget.icon,
                  color: AppColors.grey,
                )),
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.whiteColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.whiteColor))));
    return widget.isExpanded ? Expanded(child: textfield) : textfield;
  }
}
