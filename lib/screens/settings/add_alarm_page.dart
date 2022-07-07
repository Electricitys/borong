import 'package:borong/models/alarm.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/alarm_label.dart';
import 'package:borong/widgets/contra/alarm_label_widget.dart';
import 'package:borong/widgets/contra/bottom_sheet_input.dart';
import 'package:borong/widgets/contra/button_plain.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/contra_time_picker.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AddAlarmPage extends StatefulWidget {
  const AddAlarmPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddAlarmPageState createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  List<Alarm> list = <Alarm>[];
  List<String> items = <String>[];
  bool isChanged = false;

  void onChanged(bool value) {
    setState(() {
      isChanged = value;
    });
  }

  @override
  void initState() {
    super.initState();
    items.add("T");
    items.add("S");
    items.add("T");
    list.add(Alarm(time: "06:30", am_pm: "AM", datesList: items));
    list.add(Alarm(time: "06:30", am_pm: "AM", datesList: items));
    list.add(Alarm(time: "06:30", am_pm: "AM", datesList: items));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ButtonRoundWithShadow(
                      size: 48,
                      borderColor: ContraColors.woodSmoke,
                      color: ContraColors.white,
                      callback: () {
                        Navigator.pop(context);
                      },
                      shadowColor: ContraColors.woodSmoke,
                      iconPath: "assets/icons/arrow_back.svg"),
                ),
              ),
            ),
            const Expanded(
              flex: 2,
              child: ContraText(
                size: 27,
                alignment: Alignment.bottomCenter,
                text: "Add Alarm",
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 20,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: ContraTimePickerSpinner(
              is24HourMode: true,
              highlightedTextStyle: TextStyle(
                  color: ContraColors.woodSmoke,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
              normalTextStyle: TextStyle(
                  color: ContraColors.santasGray,
                  fontSize: 36,
                  fontWeight: FontWeight.w800),
            ),
          ),
          AlarmLabelWidget(
            label: AlarmLabel(
                title: "Repeat", selected: false, selectedText: "Never"),
            onTap: () {},
          ),
          AlarmLabelWidget(
            label: AlarmLabel(
                title: "Title", selected: true, selectedText: "Never"),
            onTap: () {
              _showAddLabelBottomSheet();
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const ContraText(
                  color: ContraColors.woodSmoke,
                  size: 21,
                  text: "Snooze",
                  alignment: Alignment.centerLeft,
                ),
                Switch(
                  value: isChanged,
                  onChanged: onChanged,
                  activeTrackColor: ContraColors.lighteningYellow,
                  inactiveTrackColor: ContraColors.santasGray,
                  inactiveThumbColor: ContraColors.white,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
            child: ButtonPlain(
              text: "Save",
              height: 60,
              color: ContraColors.woodSmoke,
              borderColor: ContraColors.woodSmoke,
              onTap: () {},
              textSize: 21,
              textColor: ContraColors.white,
            ),
          )
        ],
      ),
    );
  }

  _showAddLabelBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const BottomSheetInput();
      },
    );
  }
}
