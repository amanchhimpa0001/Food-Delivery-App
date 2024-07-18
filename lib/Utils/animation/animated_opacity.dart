import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/animation/animated_aligin.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';

class animated_apacity extends StatefulWidget {
  const animated_apacity({super.key});

  @override
  State<animated_apacity> createState() => animated_apacityState();
}

class animated_apacityState extends State<animated_apacity> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animated_apacity'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Appservices.addheight(100),
          AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 1),
            child: Text('AMAN CHIMPA'),
          ),
          ElevatedButton(
            onPressed: _changeOpacity,
            child: const Text('Fade Logo'),
          ),
          Expanded(child: SizedBox()),
          CustomElevatedButton(
              btnName: 'Next animation',
              onTap: () {
                Appservices.pushto(context, AnimatedAlignExample());
              }),
          Appservices.addheight(30),
        ],
      ),
    );
  }
}
