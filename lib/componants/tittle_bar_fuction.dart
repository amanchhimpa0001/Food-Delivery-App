import 'package:flutter/material.dart';

import 'package:food_delivery_new_project/helpers/text_theme.dart';

// ignore: must_be_immutable
class tittlebar extends StatelessWidget {
  String tittle, btnname;
  Color tittlecolor;
  Function? ontap;
  tittlebar(
      {super.key,
      this.ontap,
      required this.tittle,
      required this.btnname,
      required this.tittlecolor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle,
                style: GetTextTheme.fs20_regular.copyWith(color: tittlecolor),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () => ontap!(),
          child: Row(
            children: [
              Text(btnname, style: GetTextTheme.fs16_regular),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
              )
            ],
          ),
        ),
      ],
    );
  }
}
