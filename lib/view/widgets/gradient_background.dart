import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({this.child, Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: image),
        Positioned.fill(
          child: Scaffold(backgroundColor: Colors.transparent, body: child),
        ),
      ],
    );
  }
}

final image = Image.asset(
  "assets/img/app_bg.png",
  fit: BoxFit.cover,
);
