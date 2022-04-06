import 'package:flutter/material.dart';
import 'package:flutter_animations/pages/hero_animation_detail_widget.dart';

class HeroAnimationWidget extends StatelessWidget {
  const HeroAnimationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HeroAnimationDetailWidget(
                        urlImage: _getUrlImage(index),
                        index: index,
                      ),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Hero(
                      tag: 'image_index_$index',
                      child: Image.network(
                        _getUrlImage(index),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getUrlImage(final int index) {
    switch (index) {
      case 0:
        return 'https://picsum.photos/id/1011/200/200';
      case 1:
        return 'https://picsum.photos/id/1001/200/200';
      case 2:
        return 'https://picsum.photos/id/1000/200/200';
      case 3:
        return 'https://picsum.photos/id/1005/200/200';
      case 4:
        return 'https://picsum.photos/id/1012/200/200';
      default:
        return '';
    }
  }
}
