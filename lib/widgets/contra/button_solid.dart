import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonIcon {
  final String path;

  ButtonIcon({
    required this.path,
  });
}

class ButtonSolid extends StatelessWidget {
  final String text;
  final ButtonIcon? rightIcon;
  final ButtonIcon? leftIcon;
  final VoidCallback callback;
  final Color color;
  final Color textColor;
  final double? size;

  const ButtonSolid({
    Key? key,
    required this.text,
    required this.callback,
    this.rightIcon,
    this.leftIcon,
    required this.color,
    this.size,
    required this.textColor,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  static ButtonIcon Icon(path) {
    return ButtonIcon(path: path);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: size != null ? size! : MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: callback,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            leftIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      leftIcon!.path,
                      color: white,
                    ),
                  )
                : const SizedBox(),
            Text(
              text,
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            rightIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      rightIcon!.path,
                      color: white,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
