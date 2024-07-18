import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/text_button.dart';
import 'package:food_delivery_new_project/componants/textformfield.dart';
import 'package:food_delivery_new_project/controllers/authcontrollers.dart';
import 'package:food_delivery_new_project/controllers/text_validotor.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;

  var email = "";
  var password = "";
  var isChecked = true;

  var _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
                            text: "Let’s ",
                            style: GetTextTheme.fs24_medium
                                .copyWith(color: AppColors.blackColor)),
                        TextSpan(
                            text: "Sign you up,\n",
                            style: GetTextTheme.fs24_medium.copyWith(
                              color: AppColors.darkred,
                            )),
                        TextSpan(
                            text: "your meal awaits",
                            style: GetTextTheme.fs24_medium),
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
                            text: "Sign up here",
                            style: GetTextTheme.fs16_medium
                                .copyWith(color: AppColors.darkred)),
                      ],
                    ),
                  ),
                  Appservices.addheight(25),
                  Text(
                    "Full Name",
                    style: GetTextTheme.fs16_medium,
                  ),
                  Appservices.addheight(5),
                  Customtextformfilled(
                    controller: _nameController,
                    validator: (v) {
                      return v == null || v.isEmpty
                          ? "Please enter username to proceed"
                          : null;
                    },
                    hintText: "Aman",
                    fillcolor: AppColors.textformfieldcolor,
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Appservices.addheight(10),
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
                    controller: authController.emailController,
                    validator: (v) => TextValidatioinController.isEmail(v),
                    hintText: "septa.git@gmail.com",
                    fillcolor: AppColors.textformfieldcolor,
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Appservices.addheight(10),
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
                    controller: authController.passwordController,
                    validator: (value) =>
                        TextValidatioinController.isPassword(value),
                    obsecure: _passwordVisible,
                    onSufixPressed: () =>
                        setState(() => _passwordVisible = !_passwordVisible),
                    icon: _passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    hintText: "password",
                    fillcolor: AppColors.textformfieldcolor,
                    style: GetTextTheme.fs12_medium
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Appservices.addheight(15),
                  CustomElevatedButton(
                    peddingv: 18,
                    btnName: "SIGN UP",
                    onTap: () async {
                      // FirebaseAuth.instance
                      //     .createUserWithEmailAndPassword(
                      //       email: email,
                      //       password: password,
                      //     )
                      //     .then((signedInUsers) => _firestore
                      //             .collection("users")
                      //             .add({
                      //           "email": email,
                      //           "password": password
                      //         }).then((value) {
                      //           if (signedInUsers != null) {
                      //             return Navigator.pushNamed(context,
                      //                 Routsname.signup_withphonenumber);
                      //           }
                      //         }));
                      // try {
                      //   final newuser =
                      //       await _firestore.createUserWithEmailAndPassword(
                      //           email: email, password: password);
                      //   if (newuser != null) {
                      //     return Navigator.pushNamed(
                      //         context, Routsname.signup_withphonenumber);
                      //   }
                      // } catch (e) {
                      //   print("==================================");
                      // }
                      if (_formKey.currentState!.validate()) {
                        authController.createAccount(context);
                      }
                    },
                    foreground_clr: AppColors.whiteColor,
                    color: AppColors.darkred,
                  ),
                  Appservices.addheight(25),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "By signing up, you have agreed to our\n",
                              style: GetTextTheme.fs14_regular
                                  .copyWith(color: AppColors.grey)),
                          TextSpan(
                              text: "Terms and conditions",
                              style: GetTextTheme.fs14_regular.copyWith(
                                color: AppColors.primaryColor,
                              )),
                          TextSpan(
                              text: " & ",
                              style: GetTextTheme.fs14_regular.copyWith(
                                color: AppColors.grey,
                              )),
                          TextSpan(
                              text: "Privacy policy",
                              style: GetTextTheme.fs14_regular.copyWith(
                                color: AppColors.primaryColor,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Appservices.addheight(15),
                  Center(
                    child: Text("Or connect with",
                        style: GetTextTheme.fs14_regular),
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
                    ontap: () {},
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
