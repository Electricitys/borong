import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchText extends StatelessWidget {
  final String text;
  final String iconPath;
  final bool enable;
  final VoidCallback callback;
  final TextEditingController controller;

  const CustomSearchText(
      {Key? key,
      required this.text,
      required this.iconPath,
      required this.enable,
      required this.callback,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shadows: [
            BoxShadow(
              color: ContraColors.woodSmoke,
              offset: Offset(
                0.0, // Move to right 10  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          color: ContraColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: ContraColors.woodSmoke, width: 2))),
      child: TextField(
        onTap: callback,
        readOnly: !enable,
        enableInteractiveSelection: enable,
        autofocus: false,
        controller: controller,
        enableSuggestions: enable,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: ContraColors.woodSmoke),
            contentPadding: const EdgeInsets.all(16),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                iconPath,
                height: 24,
                width: 24,
              ),
            )),
      ),
    );
  }
}
