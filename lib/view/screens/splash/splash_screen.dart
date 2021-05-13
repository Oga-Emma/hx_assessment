import 'package:flutter/material.dart';
import 'package:hagglex/view/utils/assets.dart';
import 'package:helper_widgets/empty_space.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.app_logo_white_png,
            height: 48,
          ),
          EmptySpace.v3(),
          Text(
            "HaggleX",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      )),
    );
  }
}
