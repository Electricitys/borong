import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginEmailText extends StatelessWidget {
  final String text;
  final String iconPath;
  final TextInputAction? textInputAction;

  const LoginEmailText({
    Key? key,
    required this.text,
    required this.iconPath,
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
          hintStyle: textStyle.apply(color: ContraColors.woodSmoke),
          contentPadding: const EdgeInsets.all(16),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ContraColors.black),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ContraColors.black),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ContraColors.black),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: ContraColors.black),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
            ),
          )),
    );
  }
}
