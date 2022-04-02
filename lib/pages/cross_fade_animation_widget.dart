import 'package:flutter/material.dart';

class CrossFadeAnimationWidget extends StatefulWidget {
  const CrossFadeAnimationWidget({Key? key}) : super(key: key);

  @override
  State<CrossFadeAnimationWidget> createState() =>
      _CrossFadeAnimationWidgetState();
}

class _CrossFadeAnimationWidgetState extends State<CrossFadeAnimationWidget> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CrossFade animation'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          crossFadeState:
              showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: Image.asset(
            'assets/images/goku_normal.png',
            width: 300,
            height: 400,
          ),
          secondChild: Image.asset(
            'assets/images/goku_saiyan.png',
            width: 300,
            height: 400,
          ),
          duration: const Duration(seconds: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => showFirst = !showFirst),
        child: const Icon(Icons.adjust),
      ),
    );
  }
}
