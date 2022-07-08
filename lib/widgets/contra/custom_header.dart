import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contra_text.dart';

class CustomHeader extends StatelessWidget {
  final String lineOneText;
  final String lineTwotext;
  final Color fgColor;
  final Color bgColor;
  final Color color;
  final bool isTwoLines;

  const CustomHeader(
      {Key? key,
      required this.lineOneText,
      required this.lineTwotext,
      required this.color,
      this.isTwoLines = true,
      required this.fgColor,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: isTwoLines
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      lineOneText,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = fgColor,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      lineOneText,
                      style: TextStyle(
                          fontSize: 44,
                          color: bgColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                ContraText(
                  text: lineTwotext,
                  alignment: Alignment.centerLeft,
                  size: 44,
                  color: color,
                )
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      lineOneText,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = fgColor,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      lineOneText,
                      style: TextStyle(
                          fontSize: 44,
                          color: bgColor,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                ContraText(
                  text: lineTwotext,
                  alignment: Alignment.centerLeft,
                  size: 44,
                  color: color,
                )
              ],
            ),
    );
  }
}
