import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';

class RoundImageWithText extends StatelessWidget {
  final Color borderColor;
  final Color shadowColor;
  final Color color;
  final String text;
  final double size;

  const RoundImageWithText({
    Key? key,
    required this.borderColor,
    required this.shadowColor,
    required this.color,
    required this.size,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
          color: color,
          shape: CircleBorder(side: BorderSide(color: borderColor, width: 2))),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: ContraColors.white),
      )),
    );
  }
}
