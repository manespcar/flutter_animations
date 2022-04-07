import 'package:flutter/material.dart';

class TranslationAnimationWidget extends StatefulWidget {
  const TranslationAnimationWidget({Key? key}) : super(key: key);

  @override
  State<TranslationAnimationWidget> createState() =>
      _TranslationAnimationWidgetState();
}

class _TranslationAnimationWidgetState extends State<TranslationAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation1 = Tween<double>(begin: 100.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.elasticOut,
      ),
    )..addListener(() => setState(() {}));

    _animation2 = Tween<double>(begin: 100.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeInOutBack,
      ),
    )..addListener(() => setState(() {}));

    _animation3 = Tween<double>(begin: 100.0, end: 300.0).animate(
      CurvedAnimation(
        parent: _controller3,
        curve: Curves.easeInBack,
      ),
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translation Animation'),
      ),
      body: Stack(
        children: [
          _buildCard(
            context,
            Colors.greenAccent,
            120,
            _controller1,
            _animation1,
            'Card 1',
          ),
          _buildCard(
            context,
            Colors.orangeAccent,
            60,
            _controller2,
            _animation2,
            'Card 2',
          ),
          _buildCard(
            context,
            Colors.lightBlue,
            0,
            _controller3,
            _animation3,
            'Card 3',
          ),
        ],
      ),
    );
  }

  Positioned _buildCard(
      BuildContext context,
      Color color,
      double position,
      AnimationController controller,
      Animation<double> animation,
      String text) {
    return Positioned(
      bottom: position,
      child: Transform.translate(
        offset: const Offset(0, 0),
        child: GestureDetector(
          onTap: () {
            if (controller.status == AnimationStatus.completed) {
              controller.reverse();
            } else if (controller.status == AnimationStatus.dismissed) {
              controller.forward();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: animation.value,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
