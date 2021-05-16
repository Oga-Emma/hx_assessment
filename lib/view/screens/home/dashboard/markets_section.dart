import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_controller.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';

class Markets extends StatelessWidget {
  const Markets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Markets",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.separated(
            shrinkWrap: true,
            physics: PageScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return MarketItem();
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
          ),
        )
      ],
    );
  }
}

class MarketItem extends StatelessWidget {
  const MarketItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          ),
          EmptySpace.h2(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bitcoin (BTC)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                EmptySpace(),
                Row(
                  children: [
                    Text(
                      "NGN 4,272,211.00",
                      style: TextStyle(fontSize: 12),
                    ),
                    EmptySpace(),
                    Text(
                      "+2.34%",
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          EmptySpace(),
          Image.asset(
            "assets/img/live_chart.png",
            width: 100,
          )
        ],
      ),
    );
  }
}
