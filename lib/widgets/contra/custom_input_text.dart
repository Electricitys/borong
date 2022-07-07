import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final String text;
  final Color borderColor;
  final Color shadowColor;
  final Color color;
  final VoidCallback callback;

  const CustomInputText(
      {Key? key,
      required this.text,
      required this.borderColor,
      required this.color,
      required this.shadowColor,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              side: BorderSide(color: borderColor, width: 2))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: text,
                hintStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ContraColors.santasGray),
                contentPadding: const EdgeInsets.all(16),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            color: ContraColors.woodSmoke,
            icon: const Icon(Icons.keyboard_voice),
            onPressed: () {},
          ),
          IconButton(
            color: ContraColors.woodSmoke,
            icon: const Icon(Icons.send),
            onPressed: callback,
          )
        ],
      ),
    );
  }
}
