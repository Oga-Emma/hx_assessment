import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglex/view/screens/home/dashboard/dashboard_screen.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: DashboardScreen()),
        HBottomNavigationBar(
          selectedIndex: currentIndex,
          onSelect: (index) {
            if (currentIndex != index && index != 2) {
              setState(() {
                currentIndex = index;
              });
            }
          },
        ),
      ],
    ));
  }
}

class HBottomNavigationBar extends StatelessWidget {
  const HBottomNavigationBar({this.selectedIndex, this.onSelect, Key key})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        height: 100,
        child: Row(
          children: [
            navItem(
                icon: "dashboard",
                label: "Home",
                selected: selectedIndex == 0,
                onTap: () => onSelect(0)),
            navItem(
                icon: "wallet",
                label: "Wallet",
                selected: selectedIndex == 1,
                onTap: () => onSelect(1)),
            SizedBox(
              height: 100,
              width: 100,
              child: InkWell(
                onTap: () => onSelect(2),
                child: Image.asset(
                  "assets/img/ic_transfer.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            navItem(
                icon: "save",
                label: "Cryptosave",
                selected: selectedIndex == 3,
                onTap: () => onSelect(3)),
            navItem(
                icon: "more",
                label: "More",
                selected: selectedIndex == 4,
                onTap: () => onSelect(4)),
          ],
        ),
      ),
    );
  }

  Widget navItem({label, icon, selected = false, onTap}) {
    return Expanded(
      child: SizedBox(
        height: 80,
        width: 80,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/ic_$icon.png",
                color: selected ? Pallet.primaryColor : Colors.grey,
                width: 28,
                height: 28,
              ),
              EmptySpace(multiple: 0.5),
              Text(
                label,
                style: TextStyle(
                    color: selected ? Pallet.primaryColor : Colors.grey,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}