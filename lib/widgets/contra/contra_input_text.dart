import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

class ContraInputText extends StatelessWidget {
  final String text;
  final Icon? prefixIcon;
  final TextInputAction? textInputAction;

  const ContraInputText({
    Key? key,
    required this.text,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
    );

    return TextField(
      textInputAction: textInputAction,
      style: textStyle,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: textStyle.apply(color: woodSmoke),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        prefixIcon: (prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: prefixIcon,
              )
            : null),
      ),
    );
  }
}
