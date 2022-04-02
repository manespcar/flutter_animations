import 'dart:math';

import 'package:flutter/material.dart';

class SwitcherAnimationWidget extends StatefulWidget {
  const SwitcherAnimationWidget({Key? key}) : super(key: key);

  @override
  State<SwitcherAnimationWidget> createState() =>
      _SwitcherAnimationWidgetState();
}

class _SwitcherAnimationWidgetState extends State<SwitcherAnimationWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switcher animation'),
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Text(
            '$count',
            key: ValueKey<int>(count),
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => count = Random().nextInt(20)),
        child: const Icon(Icons.adjust),
      ),
    );
  }
}
