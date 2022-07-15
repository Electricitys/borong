import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/widgets.dart';

class ContraBox extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? elevation;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Color? shadowColor;
  final Function? onPressed;

  const ContraBox({
    Key? key,
    required this.child,
    this.color,
    this.elevation,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.shadowColor,
    this.onPressed,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: ShapeDecoration(
          color: color ?? ContraColors.white,
          shadows: [
            BoxShadow(
                offset: Offset(0, elevation ?? 4),
                color: shadowColor ?? ContraColors.black)
          ],
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: borderColor ?? ContraColors.black,
                width: 2,
              ),
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(16)))),
      child: child,
    );
  }
}
