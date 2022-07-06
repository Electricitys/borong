import 'package:borong/models/settings.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

class SettingsCardItem extends StatefulWidget {
  final Settings setting;

  const SettingsCardItem({Key? key, required this.setting}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsCardItemState createState() => _SettingsCardItemState();
}

class _SettingsCardItemState extends State<SettingsCardItem> {
  late String title;

  late String text;

  late bool enable;

  late Color bgColor;

  late Color textColor;
  bool isChanged = false;

  void onChanged(bool value) {
    setState(() {
      isChanged = value;
    });
  }

  @override
  void initState() {
    super.initState();
    isChanged = widget.setting.enable;
    title = widget.setting.title;
    text = widget.setting.text;
    enable = widget.setting.enable;
    bgColor = widget.setting.bgColor;
    textColor = widget.setting.textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: ShapeDecoration(
          color: bgColor,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: woodSmoke, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ContraText(
            size: 27,
            color: textColor,
            alignment: Alignment.centerLeft,
            text: title,
            weight: FontWeight.w800,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),
          ContraText(
            size: 15,
            color: textColor,
            alignment: Alignment.centerLeft,
            text: text,
            weight: FontWeight.bold,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),
          Switch(
            value: isChanged,
            onChanged: onChanged,
            activeTrackColor: lighteningYellow,
            inactiveTrackColor: santasGray,
            inactiveThumbColor: white,
          )
        ],
      ),
    );
  }
}
