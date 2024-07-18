import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/textformfield.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Forget_screen extends StatefulWidget {
  const Forget_screen({super.key});

  @override
  State<Forget_screen> createState() => _Forget_screenState();
}

class _Forget_screenState extends State<Forget_screen> {
  final TextEditingController _emailController = TextEditingController();
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
                "Reset link",
                style: GetTextTheme.fs24_medium,
              ),
              Appservices.addheight(20),
              Text(
                "Enter your email address and we will send you the reset link",
                style: GetTextTheme.fs16_regular,
              ),
              Appservices.addheight(25),
              Text(
                "Email address",
                style: GetTextTheme.fs16_medium,
              ),
              Appservices.addheight(5),
              Customtextformfilled(
                controller: _emailController,
                validator: (v) {
                  return v == null || v.isEmpty
                      ? "Please enter username to proceed"
                      : null;
                },
                hintText: "septa.git@gmail.com",
                fillcolor: AppColors.textformfieldcolor,
              ),
              Appservices.addheight(25),
              CustomElevatedButton(
                peddingv: 18,
                btnName: "RESET PASSWORD",
                onTap: () {
                  Navigator.pushNamed(context, Routsname.resend_link);
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
