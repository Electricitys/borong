import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

enum ContraToastType {
  success,
  error,
  warning,
  info,
}

class ContraToastScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final ContraToastType type;
  final void Function() onDismiss;

  const ContraToastScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onDismiss,
    this.type = ContraToastType.info,
  }) : super(key: key);

  dismiss() {
    // Navigator.pop(context);
    onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    late final IconData icon = type == ContraToastType.success
        ? Icons.check
        : type == ContraToastType.error
            ? Icons.heart_broken
            : type == ContraToastType.warning
                ? Icons.warning
                : Icons.info_sharp;
    late final Color color = type == ContraToastType.success
        ? ContraColors.caribbeanGreen
        : type == ContraToastType.error
            ? ContraColors.flamingo
            : type == ContraToastType.warning
                ? ContraColors.lighteningYellow
                : ContraColors.foam;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3),
                shape: BoxShape.circle,
                color: color,
              ),
              child: Icon(
                icon,
                size: 46,
              ),
            ),
            SizedBox(height: 36),
            ContraText(
              alignment: Alignment.center,
              text: title,
            ),
            SizedBox(height: 16),
            ContraText(
              alignment: Alignment.center,
              textAlign: TextAlign.center,
              text: subtitle,
              color: ContraColors.trout,
              size: 21,
              weight: FontWeight.normal,
            ),
            SizedBox(height: 36),
            SizedBox(
              width: 136,
              child: ContraButtonSolid(
                  text: "Okay",
                  onPressed: (() {
                    dismiss();
                  })),
            )
          ],
        ),
      ),
    );
  }
}
