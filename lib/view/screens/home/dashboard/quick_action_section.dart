import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_controller.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';

class QuickActionSection extends StatelessWidget {
  const QuickActionSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Do more with HaggleX",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            shrinkWrap: true,
            physics: PageScrollPhysics(),
            children: [
              _item(
                  title: "Send money instantly",
                  description: "Send crypto to another wallet"),
              _item(
                  title: "Receive money from anyone",
                  description: "Receive crypto from another wallet"),
              _item(
                  title: "Virtual Card",
                  description: "Make faster payments using HaggleX cards"),
              _item(
                  title: "Global Remittance",
                  description: "Send money to anyone, anywhere"),
            ],
          ),
        )
      ],
    );
  }

  Widget _item({title, description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        shadowColor: Colors.grey[100],
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Pallet.primaryColor.withOpacity(0.2),
                child: CircleAvatar(
                  backgroundColor: Pallet.primaryColor,
                ),
              ),
              EmptySpace(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    EmptySpace(),
                    Text(
                      "$description",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
