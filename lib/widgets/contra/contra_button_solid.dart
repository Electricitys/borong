import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

class ContraButtonSolid extends StatelessWidget {
  final bool subtle;
  final Color? borderColor;
  final Color? shadowColor;
  final Color? color;
  final Color? textColor;
  final String text;
  final VoidCallback onPressed;
  final double? size;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? textSize;

  const ContraButtonSolid({
    Key? key,
    this.borderColor,
    this.shadowColor,
    this.color,
    this.textColor,
    required this.text,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.size,
    this.height,
    this.textSize,
    this.subtle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: textColor ?? ContraColors.white,
      ),
      backgroundColor: color ?? ContraColors.woodSmoke,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
    );
    if (subtle) {
      style = ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: color ?? ContraColors.woodSmoke,
        ),
        backgroundColor: Colors.transparent,
      );
    }
    return ButtonTheme(
      minWidth: size != null ? size! : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style.copyWith(
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: prefixIcon,
                  )
                : const SizedBox(),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: textSize ?? 21, fontWeight: FontWeight.w800),
            ),
            suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: suffixIcon,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
