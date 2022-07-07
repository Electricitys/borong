import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContraButton extends StatelessWidget {
  final Color borderColor;
  final Color shadowColor;
  final Color color;
  final Color? textColor;
  final String text;
  final VoidCallback callback;
  final double? size;
  final double? height;
  final bool isPrefix;
  final bool isSuffix;
  final String iconPath;
  final Color? iconColor;
  final double? textSize;

  const ContraButton(
      {Key? key,
      required this.borderColor,
      required this.shadowColor,
      required this.color,
      required this.textColor,
      required this.text,
      this.size,
      this.height,
      required this.callback,
      this.isPrefix = false,
      this.isSuffix = false,
      this.textSize,
      required this.iconPath,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: size ?? MediaQuery.of(context).size.width,
        height: height ?? 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                color: shadowColor,
                offset: const Offset(
                  0.0, // Move to right 10  horizontally
                  4.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            color: color,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                side: BorderSide(color: borderColor, width: 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isPrefix
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      iconPath,
                      color: ContraColors.white,
                    ),
                  )
                : const SizedBox(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor ?? ContraColors.woodSmoke,
                  fontSize: textSize ?? 21,
                  fontWeight: FontWeight.w800),
            ),
            isSuffix
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(iconPath),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
