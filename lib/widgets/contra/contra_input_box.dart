import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContraInputBox extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final bool showPrefix;

  const ContraInputBox(
      {Key? key,
      required this.hintText,
      required this.iconPath,
      required this.showPrefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
              color: ContraColors.woodSmoke),
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
          prefixIcon: showPrefix
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    iconPath,
                    height: 24,
                    width: 24,
                  ),
                )
              : null),
    );
  }
}
