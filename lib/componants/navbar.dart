import 'package:flutter/material.dart';

import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/home_screen/home_page.dart';
import 'package:food_delivery_new_project/orders_screen/my_oders/my_orders.dart';
import 'package:food_delivery_new_project/profile/profile_screen.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';

class Navbar extends StatefulWidget {
  const Navbar({
    super.key,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  List<FloatingBottomNavItem> bottomNavItems = const [
    // FloatingBottomNavItem(
    //   inactiveIcon: Icon(Icons.home_outlined),
    //   activeIcon: Icon(Icons.home),
    //   label: "Home",
    // ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.card_travel),
      activeIcon: Icon(Icons.card_travel),
      label: "Orders",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: "Home",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  List<Widget> pages = [
    My_orders(),
    Home_page(),
    Profile_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return FloatingBottomNavBar(
      pages: pages,
      items: bottomNavItems,
      selectedLabelStyle: TextStyle(color: AppColors.blackColor),
      initialPageIndex: 1,
      backgroundColor: AppColors.orange,
      // bottomPadding: 10,
      elevation: 0,
      radius: 20,
      // width: 300,
      // height: 65,
    );
  }
}
