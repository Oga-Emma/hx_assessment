import 'package:flutter/material.dart';
import 'package:hagglex/view/utils/pallet.dart';
import 'package:helper_widgets/empty_space.dart';
import 'package:helper_widgets/loading_spinner.dart';

class HButton extends StatelessWidget {
  HButton(
      {@required this.labelText,
      @required this.onPressed,
      this.backgroundColor = Pallet.accentColor,
      this.textColor,
      this.loading = false});

  HButton.gradient(
      {@required this.labelText,
      @required this.onPressed,
      this.backgroundColor = Pallet.primaryColor,
      this.textColor = Pallet.primaryColor,
      this.gradient = true,
      this.loading = false});

  String labelText;
  Function() onPressed;
  Color backgroundColor;
  Color textColor;
  bool loading = false;
  bool gradient = false;

  @override
  Widget build(BuildContext context) {
    if (gradient) {
      return InkWell(
        onTap: loading ? null : onPressed,
        child: Container(
          height: 58,
          width: double.maxFinite,
          child: loading
              ? LoadingSpinner(color: Colors.white)
              : Text(
                  labelText,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(colors: [
                Pallet.primaryColor,
                Pallet.primaryLight,
              ])),
        ),
      );
    }

    return SizedBox(
      height: 58,
      width: double.maxFinite,
      child: MaterialButton(
          color: Theme.of(context).accentColor,
          child: loading
              ? LoadingSpinner(color: Pallet.primaryColor)
              : Text(
                  labelText,
                  style: TextStyle(
                      color: Pallet.primaryColor, fontWeight: FontWeight.bold),
                ),
          onPressed: loading ? () {} : onPressed),
    );
  }
}
