import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

class ContraAppbar extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;

  const ContraAppbar({
    super.key,
    required this.title,
    this.titleStyle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ContraAppbarState createState() => _ContraAppbarState();
}

class _ContraAppbarState extends State<ContraAppbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kToolbarHeight + 24.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ButtonRoundWithShadow(
                      size: 48,
                      borderColor: ContraColors.woodSmoke,
                      color: ContraColors.white,
                      callback: () async {
                        Navigator.pop(context);
                      },
                      shadowColor: ContraColors.woodSmoke,
                      iconPath: "assets/icons/arrow_back.svg"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ContraText(
                size: widget.titleStyle?.fontSize ?? 27,
                color: widget.titleStyle?.color ?? ContraColors.woodSmoke,
                alignment: Alignment.center,
                text: widget.title,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
