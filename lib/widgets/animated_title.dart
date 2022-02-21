import 'package:adoptme/utils/styles.dart';
import 'package:flutter/material.dart';

class AnimatedTitle extends StatelessWidget {
  final String title;
  const AnimatedTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(seconds: 1),
        builder: (context, value, _) {
          return AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: value,
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Styles.blackColor),
            ),
          );
        }
    );
  }
}
