import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/animation/animated_opacity.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedBuilderExample'),
      ),
      body: Column(
        children: [
          Appservices.addheight(100),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              child: Image.asset(Getimage.CafenioCoffeeClubimg),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 8.0 * math.pi,
                  child: child,
                );
              },
            ),
          ),
          Expanded(child: SizedBox()),
          CustomElevatedButton(
              btnName: 'Next animation',
              onTap: () {
                Appservices.pushto(context, animated_apacity());
              }),
          Appservices.addheight(30),
        ],
      ),
    );
  }
}
