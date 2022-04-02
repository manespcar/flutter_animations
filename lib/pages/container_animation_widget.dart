import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimationWidget extends StatefulWidget {
  const ContainerAnimationWidget({Key? key}) : super(key: key);

  @override
  State<ContainerAnimationWidget> createState() =>
      _ContainerAnimationWidgetState();
}

class _ContainerAnimationWidgetState extends State<ContainerAnimationWidget> {
  double width = 100;
  double height = 100;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          width = Random().nextInt(300).toDouble();
          height = Random().nextInt(300).toDouble();
          color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
        }),
        child: const Icon(Icons.adjust),
      ),
    );
  }
}
