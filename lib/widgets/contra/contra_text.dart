import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';

class ContraText extends StatelessWidget {
  final Alignment alignment;
  final String text;
  final double? size;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLine;
  final bool? softWrap;
  final FontWeight? weight;
  final TextAlign? textAlign;

  const ContraText({
    Key? key,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
    this.overflow,
    this.maxLine,
    this.softWrap,
  }) : super(key: key);

  static const TextStyle style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ContraColors.black,
    fontFamily: "Montserrat",
  );

  static const TextStyle bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: ContraColors.black,
    fontFamily: "Montserrat",
  );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.left,
        overflow: overflow,
        maxLines: maxLine,
        softWrap: softWrap,
        style: ContraText.style.copyWith(
            fontSize: size ?? 36,
            fontWeight: weight,
            color: color ?? ContraColors.black),
      ),
    );
  }
}
