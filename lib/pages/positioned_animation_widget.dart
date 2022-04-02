import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class PositionedAnimationWidget extends StatefulWidget {
  const PositionedAnimationWidget({Key? key}) : super(key: key);

  @override
  State<PositionedAnimationWidget> createState() =>
      _PositionedAnimationWidgetState();
}

class _PositionedAnimationWidgetState extends State<PositionedAnimationWidget> {
  final double _sizeBall = 50;
  double _positionX = 100;
  double _positionY = 100;
  List<double>? _accelerometerValues = [0.0, 0.0, 0.0];
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    final double _topBottom = sizeScreen.height - 200 + _sizeBall;
    final double _topRight = sizeScreen.width - _sizeBall;
    _positionX = _positionX - _accelerometerValues![0];
    _positionY = _positionY + _accelerometerValues![1];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Positioned animation'),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 50),
            top: _calculateY(_topBottom),
            left: _calculateX(_topRight),
            child: Container(
              height: _sizeBall,
              width: _sizeBall,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent,
              ),
            ),
          )
        ],
      ),
    );
  }

  double _calculateY(double _topBottom) {
    if (_positionY <= 0) {
      _positionY = 0;
    } else if (_positionY >= _topBottom) {
      _positionY = _topBottom;
    }
    return _positionY;
  }

  double _calculateX(double _topRight) {
    if (_positionX <= 0) {
      _positionX = 0;
    } else if (_positionX >= _topRight) {
      _positionX = _topRight;
    }
    return _positionX;
  }
}
