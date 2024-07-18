import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/animation/animated_pozistion.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';

import 'package:food_delivery_new_project/helpers/app_services.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedAlignExample'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: Container(
                width: 250.0,
                height: 250.0,
                color: Colors.red,
                child: AnimatedAlign(
                    alignment:
                        selected ? Alignment.topRight : Alignment.bottomLeft,
                    duration: const Duration(seconds: 3),
                    curve: Curves.fastOutSlowIn,
                    child: Text('aman bhai tap ker ')),
              ),
            ),
          ),
          Expanded(child: SizedBox()),
          CustomElevatedButton(
              btnName: 'Next animation',
              onTap: () {
                Appservices.pushto(context, AnimatedPositionedExample());
              }),
          Appservices.addheight(30),
        ],
      ),
    );
  }
}
