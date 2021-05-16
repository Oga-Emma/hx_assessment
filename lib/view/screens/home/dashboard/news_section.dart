import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_controller.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 32.0, bottom: 16.0),
          child: Text(
            "Trending crypto news",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: PageScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _item();
            },
          ),
        ),
        Divider(),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                EmptySpace.h2(),
                Expanded(
                    child: Text("View all stories",
                        style: TextStyle(color: Colors.grey[700]))),
                Icon(Icons.chevron_right, color: Colors.grey),
                EmptySpace.h2(),
              ],
            )),
        Divider(),
      ],
    );
  }

  Widget _item() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Material(
            color: Colors.grey[200],
            shadowColor: Colors.grey[100],
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 90,
              width: 70,
            ),
          ),
          EmptySpace(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                EmptySpace(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "5hrs ago",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Expanded(
                        child: RichText(
                            text: TextSpan(
                                text: "Category: ",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                                children: [
                          TextSpan(
                            text: "DeFi",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ]))),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
