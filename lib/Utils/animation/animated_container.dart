import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/animation/animatedbuilder.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = false;

  // ignore: unused_field
  double _pedding = 10;
  // ignore: unused_field
  Color _basecolor = Colors.deepPurple;

  double _sacle = 0;
  double _pozition = -200;

  void animate() {
    setState(() {
      _pozition = 0;
      _sacle = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () => animate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedContainer(
              transform: Matrix4.translationValues(0, _pozition, 0),

              // width: selected ? 100.0 : 50.0,
              // height: selected ? 50.0 : 100.0,
              // color: selected ? Colors.red : Colors.blue,
              // alignment:
              //     selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              // curve: Curves.fastOutSlowIn,
              child: AnimatedScale(
                scale: _sacle,
                duration: Duration(milliseconds: 1000),
                child: Text(
                  'AMAN CHHIMPA',
                  style: GetTextTheme.fs18_bold,
                ),
              ),
            ),
          ),
          Appservices.addheight(30),
          Hero(
            tag: 'aman',
            child: CustomElevatedButton(
                btnName: 'Next animation', onTap: () => animate()),
          ),
          Hero(
            tag: 'AMAN',
            child: Text(
              'AMAN CHHIMPA',
              style: GetTextTheme.fs18_bold,
            ),
          ),
          Expanded(child: SizedBox()),
          CustomElevatedButton(
              btnName: 'Next animation',
              onTap: () {
                Appservices.pushto(context, AnimatedBuilderExample());
              }),
          Appservices.addheight(30),
        ],
      ),
    );
  }
}
