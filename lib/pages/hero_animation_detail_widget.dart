import 'package:flutter/material.dart';

class HeroAnimationDetailWidget extends StatelessWidget {
  final String urlImage;
  final int index;

  const HeroAnimationDetailWidget({
    Key? key,
    required this.urlImage,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation Detail'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Hero(
          tag: 'image_index_$index',
          child: Image.network(
            urlImage,
          ),
        ),
      ),
    );
  }
}
