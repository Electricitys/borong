import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';

class BadgeText extends StatelessWidget {
  final Color color;
  final String text;
  final double? size;

  const BadgeText({
    Key? key,
    required this.color,
    required this.text,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: ShapeDecoration(
          color: color,
          shape: CircleBorder(side: BorderSide(color: color, width: 2))),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }
}
