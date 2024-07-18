import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/animation/animated_container.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({super.key});

  @override
  State<AnimatedSizeExample> createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 100.0 : 40.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Size Example'),
      ),
      body: Column(
        children: [
          Appservices.addheight(100),
          GestureDetector(
            onTap: () => _updateSize(),
            child: ColoredBox(
              color: Colors.amberAccent,
              child: AnimatedSize(
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  child: Text(
                    'aman',
                    style: TextStyle(fontSize: _size),
                  )),
            ),
          ),
          Appservices.addheight(20),
          Hero(
            tag: 'aman',
            child: Text(
              'AMAN CHHIMPA jksjsjk',
              style: GetTextTheme.fs18_bold,
            ),
          ),
          Expanded(child: SizedBox()),
          CustomElevatedButton(
              btnName: 'Next animation',
              onTap: () {
                Appservices.pushto(context, AnimatedContainerExample());
              }),
          Appservices.addheight(30),
        ],
      ),
    );
  }
}
