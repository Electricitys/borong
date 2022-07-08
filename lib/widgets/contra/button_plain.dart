// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ButtonPlain extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color textColor;
  final double? size;
  final String text;
  final VoidCallback onTap;
  final double? height;
  final double? textSize;

  const ButtonPlain(
      {Key? key,
      required this.color,
      required this.textColor,
      required this.borderColor,
      this.size,
      required this.text,
      this.height,
      this.textSize,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height != null ? height! : 48,
      minWidth: size != null ? size! : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: color,
          textStyle: TextStyle(color: textColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        ),
        onPressed: onTap,
        child: Text(
          text,
          maxLines: 1,
          style:
              TextStyle(fontSize: textSize ?? 12, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
