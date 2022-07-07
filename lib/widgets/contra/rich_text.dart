import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class CustomRichText extends StatelessWidget {
  final Alignment alignment;
  final String textOne;
  final String textSecond;
  final VoidCallback textSecoundOnTap;

  const CustomRichText({
    Key? key,
    required this.alignment,
    required this.textOne,
    required this.textSecond,
    required this.textSecoundOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          TextSpan(
              text: textOne,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: ContraColors.black,
              )),
          TextSpan(
            text: textSecond,
            recognizer: TapGestureRecognizer()..onTap = textSecoundOnTap,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: ContraColors.flamingo),
          ),
        ]),
      ),
    );
  }
}
