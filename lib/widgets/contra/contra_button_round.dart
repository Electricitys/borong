import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ContraButtonRound extends StatelessWidget {
  final Color borderColor;
  final Color shadowColor;
  final Color color;
  final Color? iconColor;
  final String iconPath;
  final VoidCallback callback;
  final double? size;

  const ContraButtonRound(
      {Key? key,
      required this.borderColor,
      required this.shadowColor,
      required this.color,
      this.iconColor,
      required this.iconPath,
      this.size,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: size,
        width: size,
        padding: EdgeInsets.all(size != null ? 8 : 16),
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
            shape:
                CircleBorder(side: BorderSide(color: borderColor, width: 2))),
        child: SvgPicture.asset(
          iconPath,
        ),
      ),
    );
  }
}
