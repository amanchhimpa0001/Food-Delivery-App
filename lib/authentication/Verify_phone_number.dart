import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/Utils/utilss.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

// ignore: must_be_immutable
class Verifyphonenumber extends StatefulWidget {
  String verificationId;

  Verifyphonenumber({super.key, required this.verificationId});

  @override
  State<Verifyphonenumber> createState() => _VerifyphonenumberState();
}

class _VerifyphonenumberState extends State<Verifyphonenumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static String otp = '';

  var code = '';
  @override
  Widget build(BuildContext context) {
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
                  Appservices.addheight(10),
                  Text(
                    "Verify  phone number",
                    style: GetTextTheme.fs24_medium,
                  ),
                  Appservices.addheight(30),
                  Text(
                    "Enter the 4-Digit code sent to  you on + 9985 956654",
                    style: GetTextTheme.fs16_regular,
                  ),
                  Appservices.addheight(30),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Didn’t receive ? ",
                            style: GetTextTheme.fs18_medium),
                        TextSpan(
                            text: "Send again",
                            style: GetTextTheme.fs18_medium.copyWith(
                              color: AppColors.darkred,
                            )),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Appservices.addheight(20),
                  Center(
                    child: Text(
                      'Resend in 32',
                      style: (GetTextTheme.fs18_medium),
                    ),
                  ),
                  Appservices.addheight(30),
                  OTPTextField(
                    onChanged: (v) {
                      setState(() => otp = v);
                    },
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 60,
                    style: TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                  Appservices.addheight(30),
                  CustomElevatedButton(
                    peddingv: 18,
                    btnName: "RESEND LINK",
                    onTap: () async {
                      if (otp.length == 6) {
                        try {
                          PhoneAuthCredential credential =
                              await PhoneAuthProvider.credential(
                                  verificationId: widget.verificationId,
                                  smsCode: code);

                          FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) {
                            return Navigator.pushNamed(
                                context, Routsname.AccessLocation);
                          });
                        } catch (e) {
                          print('====================');
                        }
                        return Navigator.pushNamed(
                            context, Routsname.AccessLocation);
                        // Appfunctions().login(_nameController.text,
                        //     _passwordController.text, context);
                      } else {
                        return Utils.snakbar('please Enter otp', context);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
