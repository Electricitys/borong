import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonPlainWithIcon extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback callback;
  final bool isPrefix;
  final bool isSuffix;
  final Color color;
  final Color textColor;
  final double? size;

  const ButtonPlainWithIcon(
      {super.key,
      required this.text,
      required this.callback,
      required this.isPrefix,
      required this.isSuffix,
      required this.iconPath,
      required this.color,
      this.size,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: size != null ? size! : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          backgroundColor: color,
          textStyle: TextStyle(
            color: textColor,
          ),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: callback,
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
              style:
                  const TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
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
