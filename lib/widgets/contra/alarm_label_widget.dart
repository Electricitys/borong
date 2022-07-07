import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

import 'alarm_label.dart';

class AlarmLabelWidget extends StatelessWidget {
  final AlarmLabel label;
  final VoidCallback onTap;

  const AlarmLabelWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ContraText(
              text: label.title,
              alignment: Alignment.centerLeft,
              color: ContraColors.woodSmoke,
              size: 21,
            ),
            label.selected
                ? ContraText(
                    text: label.selectedText,
                    alignment: Alignment.centerLeft,
                    color: ContraColors.black,
                    size: 17,
                  )
                : const Icon(
                    Icons.arrow_forward_ios,
                    color: ContraColors.woodSmoke,
                  )
          ],
        ),
      ),
    );
  }
}
