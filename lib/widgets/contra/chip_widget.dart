import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChipWidget extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const ChipWidget(
      {Key? key,
      required this.text,
      required this.selected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 48,
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
              color: selected ? ContraColors.pastelPink : ContraColors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(44)),
                  side: BorderSide(color: ContraColors.woodSmoke, width: 2))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(
                  color: ContraColors.woodSmoke,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (selected)
                SvgPicture.asset("assets/icons/close.svg")
              else
                const SizedBox()
            ],
          )),
    );
  }
}
