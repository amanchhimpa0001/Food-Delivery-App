import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Location_screen/Access_Location.dart';
import 'package:food_delivery_new_project/Location_screen/Deliveryaddress.dart';
import 'package:food_delivery_new_project/componants/navbar.dart';
import 'package:food_delivery_new_project/food_scrren_all/food_screen.dart';
import 'package:food_delivery_new_project/food_scrren_all/serach_food.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';

import 'package:food_delivery_new_project/authentication/Forget.dart';
import 'package:food_delivery_new_project/authentication/login.dart';
import 'package:food_delivery_new_project/authentication/resend_link_scrren.dart';
import 'package:food_delivery_new_project/authentication/sign_up.dart';
import 'package:food_delivery_new_project/authentication/sign_upwith_phonum.dart';
import 'package:food_delivery_new_project/home_screen/home_page.dart';
import 'package:food_delivery_new_project/on_boarding/sliders_scrren.dart';
import 'package:food_delivery_new_project/on_boarding/welcome_page.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routsname.Sliders_page:
        return MaterialPageRoute(
          builder: (context) => Sliders_page(),
        );
      case Routsname.Welcome_page:
        return MaterialPageRoute(
          builder: (context) => Welcome_page(),
        );
      case Routsname.Login_Page:
        return MaterialPageRoute(
          builder: (context) => Login_Page(),
        );
      case Routsname.Sign_up:
        return MaterialPageRoute(
          builder: (context) => Sign_up(),
        );

      case Routsname.Forget_screen:
        return MaterialPageRoute(
          builder: (context) => Forget_screen(),
        );
      case Routsname.resend_link:
        return MaterialPageRoute(
          builder: (context) => ResendLink(),
        );
      case Routsname.signup_withphonenumber:
        return MaterialPageRoute(
          builder: (context) => signup_withphonenumber(),
        );
      // case Routsname.Verifyphonenumber:
      //   return MaterialPageRoute(
      //     builder: (context) => Verifyphonenumber(),
      //   );
      case Routsname.Deliveryaddress:
        return MaterialPageRoute(
          builder: (context) => Deliveryaddress(),
        );
      case Routsname.AccessLocation:
        return MaterialPageRoute(
          builder: (context) => AccessLocation(),
        );
      case Routsname.Home_page:
        return MaterialPageRoute(
          builder: (context) => Home_page(),
        );
      case Routsname.Serach_food:
        return MaterialPageRoute(
          builder: (context) => Serach_food(),
        );
      case Routsname.Food_screen:
        return MaterialPageRoute(
          builder: (context) => Food_screen(),
        );
      case Routsname.Navbar:
        return MaterialPageRoute(
          builder: (context) => Navbar(),
        );
      // case Routsname.My_cart:
      //   return MaterialPageRoute(
      //     builder: (context) => My_cart(),
      //   );
      // case Routsname.Details_food_page:
      //   return MaterialPageRoute(
      //     builder: (context) => Details_food_page(modeldata: ),
      //   );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Column(
                    children: [Text("no route difined")],
                  ),
                ));
    }
  }
}
