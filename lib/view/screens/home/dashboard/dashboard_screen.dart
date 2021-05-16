import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_controller.dart';
import 'package:hagglex/view/screens/home/dashboard/news_section.dart';
import 'package:hagglex/view/screens/home/dashboard/quick_action_section.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';

import 'markets_section.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key key}) : super(key: key);

  final controller = Get.put(DashboardController());
  final AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TopBar(),
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
              _divider(),
              QuickActionSection(),
              _divider(),
              NewsSection(),
            ],
          ),
        ));
  }

  _divider() {
    return Container(
      height: 10,
      color: Colors.grey[100],
    );
  }
}

class TopBar extends StatelessWidget {
  TopBar({Key key}) : super(key: key);

  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Pallet.primaryColor,
      width: double.maxFinite,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Pallet.primaryColor,
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Pallet.pinkColor,
                      child: Text(
                        "${appController.user.initials}".toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Pallet.primaryColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "HaggleX",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: 56,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.1),
                    child: Badge(
                      badgeContent: Text(
                        '5',
                        style: TextStyle(color: Colors.white),
                      ),
                      position: BadgePosition(top: -15, end: -15),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            EmptySpace.v4(),
            Text(
              "Total portfolio balance",
              style: TextStyle(color: Colors.white),
            ),
            EmptySpace.v2(),
            Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                        child: Text(
                          "****",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                _currencyToggle(),
              ],
            )
          ],
        ),
      )),
    );
  }

  _currencyToggle() {
    return Container(
      width: 120,
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(48.0)),
      child: Row(
        children: [
          EmptySpace(multiple: 0.2),
          Expanded(child: _button(label: "USD", selected: true)),
          Expanded(child: _button(label: "NGN", selected: false)),
          EmptySpace(multiple: 0.2),
        ],
      ),
    );
  }

  Widget _button({String label, bool selected = false}) {
    return Material(
      color: selected ? Colors.white : Colors.transparent,
      elevation: selected ? 4.0 : 0.0,
      borderRadius: BorderRadius.circular(48.0),
      child: Container(
        width: 60,
        height: 40,
        alignment: Alignment.center,
        decoration: selected
            ? BoxDecoration(
                color: Pallet.accentColor,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(48.0))
            : null,
        child: Text(
          "$label",
          style: TextStyle(
              fontWeight: selected ? FontWeight.bold : null, fontSize: 12),
        ),
      ),
    );
  }
}
