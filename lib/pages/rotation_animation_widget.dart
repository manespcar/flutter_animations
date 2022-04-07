import 'dart:math';

import 'package:flutter/material.dart';

class RotationAnimationWidget extends StatefulWidget {
  const RotationAnimationWidget({Key? key}) : super(key: key);

  @override
  State<RotationAnimationWidget> createState() =>
      _RotationAnimationWidgetState();
}

class _RotationAnimationWidgetState extends State<RotationAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
          ..addListener(() => setState(() {}))
        /*..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })*/
        ;
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Animation'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Transform.rotate(
            angle: pi * _animation.value,
            child: const Icon(
              Icons.wb_sunny_outlined,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
