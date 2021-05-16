import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_controller.dart';
import 'package:hagglex/view/screens/home/dashboard/quick_action_section.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';

import 'markets_section.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key key}) : super(key: key);

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Pallet.primaryColor,
                height: 100,
                width: double.maxFinite,
              ),
              Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: SizedBox(
                    height: 130,
                    child: Center(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          EmptySpace.horizontal(),
                          Image.asset("assets/img/market_place.png"),
                          EmptySpace.horizontal(),
                          Image.asset("assets/img/save_on_hagglex.png"),
                          EmptySpace.horizontal(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              EmptySpace(),
              Markets(),
              EmptySpace(),
              QuickActionSection()
            ],
          ),
        ));
  }
}
