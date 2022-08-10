import 'package:borong/models/settings.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ContraListCardItemBase extends StatelessWidget {
  final String title;
  final String? value;
  final Color? color;
  final Widget? leftElement;
  final Widget? rightElement;
  final void Function()? onTap;

  const ContraListCardItemBase({
    super.key,
    required this.title,
    this.value,
    this.color,
    this.leftElement,
    this.rightElement,
    required this.onTap,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (() => {if (onTap != null) onTap!()}),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (leftElement != null) leftElement!,
              if (leftElement == null && color != null)
                Container(
                  padding: const EdgeInsets.only(left: 24.0),
                  height: 36.0,
                  child: Container(
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(), color: ContraColors.woodSmoke),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: ShapeDecoration(
                            shape: const CircleBorder(), color: color),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 24.0),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    ContraText(
                      overflow: TextOverflow.ellipsis,
                      text: title,
                      textAlign: TextAlign.left,
                      weight: FontWeight.w800,
                      size: 17,
                      alignment: Alignment.centerLeft,
                      color: ContraColors.woodSmoke,
                    ),
                    if (value != null)
                      ContraText(
                        overflow: TextOverflow.ellipsis,
                        text: value!,
                        textAlign: TextAlign.left,
                        weight: FontWeight.w700,
                        size: 17,
                        alignment: Alignment.centerLeft,
                        color: ContraColors.trout,
                      ),
                  ],
                ),
              ),
              if (rightElement != null) rightElement!,
              if (rightElement == null && onTap != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  height: 36,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: ContraColors.woodSmoke,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
