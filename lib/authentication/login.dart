import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';

import 'package:food_delivery_new_project/componants/text_button.dart';
import 'package:food_delivery_new_project/componants/textformfield.dart';
import 'package:food_delivery_new_project/controllers/authcontrollers.dart';
import 'package:food_delivery_new_project/controllers/text_validotor.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  // var email = "";
  // var password = "";
  var isChecked = true;

  var _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appservices.addheight(15),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Just",
                            style: GetTextTheme.fs24_bold
                                .copyWith(color: AppColors.blackColor)),
                        TextSpan(
                            text: " Sign in,",
                            style: GetTextTheme.fs24_bold.copyWith(
                              color: AppColors.darkred,
                            )),
                        TextSpan(
                            text: "we’ll prepar your order",
                            style: GetTextTheme.fs24_bold),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Appservices.addheight(25),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "If you don’t have an account",
                            style: GetTextTheme.fs16_medium
                                .copyWith(color: AppColors.grey)),
                        TextSpan(
                            text: " please ",
                            style: GetTextTheme.fs16_medium.copyWith(
                              color: AppColors.grey,
                            )),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, Routsname.Sign_up);
                              },
                            text: "Sign up here",
                            style: GetTextTheme.fs16_medium
                                .copyWith(color: AppColors.darkred)),
                      ],
                    ),
                  ),
                  Appservices.addheight(25),
                  Text(
                    "Email address",
                    style: GetTextTheme.fs16_medium,
                  ),
                  Appservices.addheight(5),
                  Customtextformfilled(
                    // onchange: (value) {
                    //   setState(() {
                    //     email = value.toString();
                    //   });
                    // },
                    controller: authController.loginEmailController,
                    validator: (v) {
                      return v == null || v.isEmpty
                          ? "Please enter username to proceed"
                          : null;
                    },
                    hintText: "septa.git@gmail.com",
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.greyColor),
                    fillcolor: AppColors.textformfieldcolor,
                  ),
                  Appservices.addheight(15),
                  Text(
                    "Password",
                    style: GetTextTheme.fs16_medium,
                  ),
                  Appservices.addheight(5),
                  Customtextformfilled(
                    // onchange: (value) {
                    //   setState(() {
                    //     password = value.toString();
                    //   });
                    // },
                    controller: authController.loginPasswordController,
                    validator: (value) =>
                        TextValidatioinController.isPassword(value),
                    obsecure: _passwordVisible,
                    onSufixPressed: () =>
                        setState(() => _passwordVisible = !_passwordVisible),
                    icon: _passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    hintText: "password",
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.greyColor),
                    fillcolor: AppColors.textformfieldcolor,
                  ),
                  Appservices.addheight(15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routsname.Forget_screen);
                      },
                      child: Text(
                        "Forgot password?",
                        style: GetTextTheme.fs14_medium
                            .copyWith(color: AppColors.greyColor),
                      ),
                    ),
                  ),
                  Appservices.addheight(25),
                  CustomElevatedButton(
                    peddingv: 18,
                    btnName: "SIGN IN",
                    onTap: () async {
                      // try {
                      //   await FirebaseAuth.instance
                      //       .signInWithEmailAndPassword(
                      //           email: email, password: password)
                      //       .then((firebaseusers) {
                      //     return Appservices.pushto(context, Navbar());
                      //   });
                      // } catch (e) {
                      //   print("======================login");
                      // }

                      // .onError((error, stackTrace) =>
                      //     print("====================="));
                      if (_formKey.currentState!.validate()) {
                        authController.loginUser(context);
                      }
                    },
                    foreground_clr: AppColors.whiteColor,
                    color: AppColors.darkred,
                  ),
                  Appservices.addheight(40),
                  Center(
                    child: Text("Or", style: GetTextTheme.fs16_medium),
                  ),
                  Appservices.addheight(30.h),
                  Textbutton(
                    isCenter: true,
                    style: GetTextTheme.fs14_medium
                        .copyWith(color: AppColors.blackColor),
                    vertical: 15,
                    backgroundColor: AppColors.textfieldColor,
                    ontap: () {},
                    image: Getimage.facebookimg,
                    text: "Connect with facebook",
                  ),
                  Appservices.addheight(14.h),
                  Textbutton(
                    isCenter: true,
                    style: GetTextTheme.fs14_medium.copyWith(
                      color: AppColors.blackColor,
                    ),
                    vertical: 15,
                    backgroundColor: AppColors.textfieldColor,
                    ontap: () async {
                      await authController.googleLogin(context);
                    },
                    image: Getimage.googleimg,
                    text: "Connect with Goggle ",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
