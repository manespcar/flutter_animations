import 'package:flutter/material.dart';

class OpacityAnimationWidget extends StatefulWidget {
  const OpacityAnimationWidget({Key? key}) : super(key: key);

  @override
  State<OpacityAnimationWidget> createState() => _OpacityAnimationWidgetState();
}

class _OpacityAnimationWidgetState extends State<OpacityAnimationWidget> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: index == 0 ? 0.3 : 1,
              child: GestureDetector(
                onTap: () => setState(() => index = 0),
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: index == 1 ? 0.3 : 1,
              child: GestureDetector(
                onTap: () => setState(() => index = 1),
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: index == 2 ? 0.3 : 1,
              child: GestureDetector(
                onTap: () => setState(() => index = 2),
                child: Container(
                  color: Colors.orange,
                  height: 100,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
