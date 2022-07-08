import 'package:borong/models/settings.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

class SettingsItemWidget extends StatefulWidget {
  final SettingsItem settingsItem;

  const SettingsItemWidget({Key? key, required this.settingsItem})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SettingsItemWidgetState createState() => _SettingsItemWidgetState();
}

class _SettingsItemWidgetState extends State<SettingsItemWidget> {
  late String title;
  late String description;

  late bool enable;
  bool isChanged = false;

  void onChanged(bool value) {
    setState(() {
      isChanged = value;
    });
  }

  @override
  void initState() {
    super.initState();
    isChanged = widget.settingsItem.enable;
    title = widget.settingsItem.title;
    description = widget.settingsItem.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ContraText(
                  text: title,
                  color: ContraColors.woodSmoke,
                  alignment: Alignment.centerLeft,
                  size: 21,
                  weight: FontWeight.w800,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 4,
                ),
                description.isNotEmpty
                    ? Text(
                        description,
                        style: const TextStyle(
                            color: ContraColors.trout,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
              ],
            ),
          ),
          Switch(
            value: isChanged,
            onChanged: onChanged,
            activeTrackColor: ContraColors.lighteningYellow,
            inactiveTrackColor: ContraColors.santasGray,
            inactiveThumbColor: Colors.white,
          )
        ],
      ),
    );
  }
}
