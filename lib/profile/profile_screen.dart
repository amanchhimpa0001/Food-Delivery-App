import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/componants/exptiontilefun.dart';
import 'package:food_delivery_new_project/controllers/authcontrollers.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class Profile_page extends StatelessWidget {
  const Profile_page({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(5).copyWith(left: 15),
          // height: 45,
          // width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.lightgrey),
          child: IconButton(
              onPressed: () {
                Appservices.goback(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
              )),
        ),
        forceMaterialTransparency: true,
        leadingWidth: 65,
        title: Text(
          'Menu Profile',
          style: GetTextTheme.fs20_regular,
        ),
        actions: [
          Container(
            // height: 45,
            // width: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.lightgrey),
            child: IconButton(
                onPressed: () {
                  Appservices.goback(context);
                },
                icon: Icon(
                  Icons.more_horiz,
                  size: 20,
                )),
          ),
          Appservices.addWidth(15)
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Appservices.addheight(15),
                Row(children: [
                  Image.asset(Getimage.profile),
                  Appservices.addWidth(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Septa",
                        style: GetTextTheme.fs20_regular,
                      ),
                      Text(
                        "I love fast food",
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.greyColor),
                      ),
                    ],
                  )
                ]),
                Appservices.addheight(15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightgrey),
                  child: Column(
                    children: [
                      exptiontilefuction(
                          cardname: "Personal Info",
                          color: AppColors.orange,
                          icon: Icons.person_2_outlined,
                          onPressed: () {}),
                      exptiontilefuction(
                          color: AppColors.primaryColor,
                          cardname: "Addresses",
                          icon: Icons.map_outlined,
                          onPressed: () {}),
                    ],
                  ),
                ),
                Appservices.addheight(15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightgrey),
                  child: Column(
                    children: [
                      exptiontilefuction(
                          color: AppColors.blue,
                          cardname: "Cart",
                          icon: Icons.card_travel,
                          onPressed: () {}),
                      exptiontilefuction(
                          color: AppColors.jamnicolor,
                          cardname: "Favourite",
                          icon: Icons.favorite_outline,
                          onPressed: () {}),
                      exptiontilefuction(
                          color: AppColors.orange,
                          cardname: "Notifications",
                          icon: Icons.notifications_none_outlined,
                          onPressed: () {}),
                      exptiontilefuction(
                          color: AppColors.blue,
                          cardname: "Payment Method",
                          icon: Icons.credit_card_outlined,
                          onPressed: () {}),
                    ],
                  ),
                ),
                Appservices.addheight(15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightgrey),
                  child: Column(
                    children: [
                      exptiontilefuction(
                          cardname: "FAQs",
                          color: AppColors.darkorange,
                          icon: Icons.help_outline_rounded,
                          onPressed: () {}),
                      exptiontilefuction(
                          cardname: "User Reviews",
                          color: AppColors.yellow,
                          icon: Icons.reviews,
                          onPressed: () {}),
                      exptiontilefuction(
                          color: AppColors.primaryColor,
                          cardname: "Settings",
                          icon: Icons.settings,
                          onPressed: () {}),
                    ],
                  ),
                ),
                Appservices.addheight(15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightgrey),
                  child: Column(
                    children: [
                      exptiontilefuction(
                          color: AppColors.darkred,
                          cardname: "Log out",
                          icon: Icons.logout,
                          onPressed: () async {
                            authController.logoutUser(context);
                          }),
                    ],
                  ),
                ),
                Appservices.addheight(100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
