import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/navbar.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class ResendLink extends StatelessWidget {
  const ResendLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appservices.addheight(10),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.lightgrey),
                    child: IconButton(
                        onPressed: () {
                          Appservices.goback(context);
                        },
                        icon: Icon(Icons.keyboard_arrow_left_outlined)),
                  ),
                  Appservices.addWidth(10),
                  Text(
                    "Forgot password",
                    style: GetTextTheme.fs14_regular,
                  )
                ],
              ),
              Appservices.addheight(20),
              Text(
                "check your email",
                style: GetTextTheme.fs24_medium,
              ),
              Appservices.addheight(20),
              Text(
                "We have just sent a instructions email to abc@gmail.com",
                style: GetTextTheme.fs16_regular,
              ),
              Appservices.addheight(25),
              Text(
                "Having a problem ?",
                style: GetTextTheme.fs16_medium,
              ),
              Appservices.addheight(20),
              Center(
                child: Text(
                  "Resend in 32",
                  style: GetTextTheme.fs16_medium,
                ),
              ),
              Appservices.addheight(30),
              CustomElevatedButton(
                peddingv: 18,
                btnName: "RESEND LINK",
                onTap: () {
                  Appservices.pushto(context, Navbar());
                  // if (_formKey.currentState!.validate()) {
                  //   // Appfunctions().login(_nameController.text,
                  //   //     _passwordController.text, context);
                  // }
                },
                foreground_clr: AppColors.whiteColor,
                color: AppColors.darkred,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
