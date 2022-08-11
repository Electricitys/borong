import 'package:borong/models/settings.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

class ContraListCard extends StatelessWidget {
  final String title;
  final Color? color;
  final Color borderColor;
  final Color shadowColor;

  final Widget child;

  const ContraListCard({
    super.key,
    required this.title,
    this.color = Colors.white,
    this.borderColor = ContraColors.woodSmoke,
    this.shadowColor = ContraColors.woodSmoke,
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          ContraText(
            color: ContraColors.trout,
            text: title,
            textAlign: TextAlign.left,
            weight: FontWeight.bold,
            size: 21,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: ShapeDecoration(
                color: color,
                shadows: [
                  BoxShadow(color: shadowColor, offset: const Offset(0, 4))
                ],
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: borderColor,
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(16)))),
            child: child,
          )
        ],
      ),
    );
  }
}
