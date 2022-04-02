import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animations/pages/container_animation_widget.dart';
import 'package:flutter_animations/pages/cross_fade_animation_widget.dart';
import 'package:flutter_animations/pages/home_widget.dart';
import 'package:flutter_animations/pages/opacity_animation_widget.dart';
import 'package:flutter_animations/pages/positioned_animation_widget.dart';
import 'package:flutter_animations/pages/switcher_animation_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeWidget(),
        '/container': (context) => const ContainerAnimationWidget(),
        '/crossFade': (context) => const CrossFadeAnimationWidget(),
        '/opacity': (context) => const OpacityAnimationWidget(),
        '/switcher': (context) => const SwitcherAnimationWidget(),
        '/positioned': (context) => const PositionedAnimationWidget(),
      },
    );
  }
}
