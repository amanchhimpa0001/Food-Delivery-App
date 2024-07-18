import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/orders_screen/my_oders/history_data.dart';
import 'package:food_delivery_new_project/orders_screen/my_oders/ongoing_data.dart';

class My_orders extends StatefulWidget {
  const My_orders({super.key});

  @override
  State<My_orders> createState() => _My_ordersState();
}

class _My_ordersState extends State<My_orders> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
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
            'My Orders',
            style: GetTextTheme.fs20_regular,
          ),
          bottom: TabBar(
              onTap: (value) {
                currentIndex = value;
              },
              indicatorColor: AppColors.orange,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              unselectedLabelColor: AppColors.grey,
              labelColor: AppColors.orange,
              tabs: [
                Tab(text: "Ongoing"),
                Tab(text: "History"),
              ]),
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
        body: TabBarView(
            controller: _tabController,
            children: [ongoing_orders(), orders_history()]));
  }
}
