import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HTextFormField extends StatelessWidget {
  const HTextFormField(
      {this.labelText,
      this.initialValue,
      this.controller,
      this.onSaved,
      this.validator,
      this.obscureText = false,
      this.autoValidate = false,
      this.isLastTextField = false,
      this.onChanged,
      this.maxLength,
      this.textAlign = TextAlign.left,
      this.inputFormatters,
      this.keyboardType,
      this.multiLine = false,
      this.enabled = true,
      this.minLines = 5,
      this.trailingIcon,
      this.onTap,
      this.inverted = false,
      Key key})
      : super(key: key);

  final List<TextInputFormatter> inputFormatters;
  final int minLines;
  final int maxLength;
  final bool multiLine;
  final bool isLastTextField;
  final bool obscureText;
  final bool autoValidate;
  final bool enabled;
  final String initialValue;
  final String labelText;
  final TextEditingController controller;
  final Function(String) onSaved;
  final Function(String) validator;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final Function() onTap;
  final TextAlign textAlign;
  final Widget trailingIcon;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    var color = inverted ? Colors.black : Colors.white;

    return TextFormField(
      enabled: enabled,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      obscureText: obscureText,
      onTap: onTap,
      initialValue: initialValue,
      controller: controller,
      autovalidate: autoValidate,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textAlign: textAlign,
      minLines: multiLine ? minLines : 1,
      maxLines: multiLine ? minLines * 2 : 1,
      textInputAction:
          isLastTextField ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (_) =>
          isLastTextField ? null : FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: color),
        suffixIcon: trailingIcon,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        errorBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }
}
