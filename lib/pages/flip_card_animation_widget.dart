import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardAnimationWidget extends StatefulWidget {
  const FlipCardAnimationWidget({Key? key}) : super(key: key);

  @override
  State<FlipCardAnimationWidget> createState() =>
      _FlipCardAnimationWidgetState();
}

class _FlipCardAnimationWidgetState extends State<FlipCardAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationMove;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationMove =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(50, 0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.decelerate,
      ),
    )..addListener(() {
            setState(() {});
          });
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    )..addListener(() {
        setState(() {});
      });
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
        title: const Text('Flip Card'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildBehindCard(),
            _buildMainCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Transform.translate(
      offset: _animationMove.value,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _controller.status == AnimationStatus.completed
                ? _controller.reverse()
                : _controller.forward(),
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pinkAccent,
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Tap here',
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBehindCard() {
    return Transform(
      transform: Matrix4.rotationY(pi * _animation.value),
      origin: const Offset(25, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
