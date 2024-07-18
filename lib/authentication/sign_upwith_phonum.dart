import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/utilss.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/controllers/authcontrollers.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class signup_withphonenumber extends StatefulWidget {
  const signup_withphonenumber({super.key});
  static String verify = "";

  @override
  State<signup_withphonenumber> createState() => _signup_withphonenumberState();
}

class _signup_withphonenumberState extends State<signup_withphonenumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final TextEditingController _phonenumberController = TextEditingController();
  TextEditingController phn_controllers = TextEditingController();

  bool isLoading = false;

  bool isValidNumber = false;
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Appservices.addheight(20),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Get started with",
                            style: GetTextTheme.fs24_medium),
                        TextSpan(
                            text: " Hunger,", style: GetTextTheme.fs24_medium),
                        TextSpan(
                            text: "Hub",
                            style: GetTextTheme.fs24_medium.copyWith(
                              color: AppColors.darkred,
                            )),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Appservices.addheight(25),
                  Text(
                    "Enter your phone number to  use Hunger hub and enjoy",
                    style: GetTextTheme.fs16_regular,
                  ),
                  Appservices.addheight(25),
                  Text(
                    "Phone number ",
                    style: GetTextTheme.fs16_medium,
                  ),
                  Appservices.addheight(5),
                  IntlPhoneField(
                    controller: phn_controllers,
                    // ignore: body_might_complete_normally_nullable
                    validator: (v) {
                      setState(() {
                        try {
                          isValidNumber = v!.isValidNumber();
                        } catch (e) {
                          isValidNumber = false;
                        }
                      });
                    },
                    dropdownIconPosition: IconPosition.trailing,
                    dropdownIcon: Icon(Icons.arrow_drop_down_outlined,
                        color: AppColors.blackColor),
                    // autovalidateMode: AutovalidateMode.always,

                    decoration: InputDecoration(
                      fillColor: AppColors.lightgrey,
                      filled: true,
                      hintText: 'Phone Number',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppColors.textformfieldcolor)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    showCountryFlag: false,
                    initialCountryCode: 'IN',
                    onChanged: (phone) {},
                  ),
                  Appservices.addheight(30),
                  CustomElevatedButton(
                    peddingv: 18,
                    btnName: "SIGN UP",
                    onTap: () async {
                      if (isValidNumber) {
                        return authController.otpsend(
                            context, phn_controllers.text);
                      } else {
                        return Utils.snakbar(
                            'please anter Mobile Number ', context);
                      }
                    },
                    foreground_clr: AppColors.whiteColor,
                    color: AppColors.darkred,
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
