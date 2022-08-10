import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_select.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class TransactionFilterButton extends StatefulWidget {
  final void Function(SelectOption) onChanged;
  final SelectOption initialValue;
  final List<SelectOption> options;

  const TransactionFilterButton({
    super.key,
    required this.onChanged,
    required this.initialValue,
    required this.options,
  });

  @override
  State<TransactionFilterButton> createState() =>
      _TransactionFilterButtonState();
}

class _TransactionFilterButtonState extends State<TransactionFilterButton> {
  late SelectOption selectedValue = widget.initialValue;

  Future<void> _showModalSheetFilter(BuildContext context) async {
    int initialValue = widget.options.indexOf(selectedValue);
    ContraSheet.showModalSheet(context,
        title: "Set filter",
        action: Row(children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: () async {
                    setState(() {
                      selectedValue = selectedValue;
                    });
                    Navigator.pop(context);
                    widget.onChanged(selectedValue);
                  },
                  color: ContraColors.persianBlue,
                  icon: const Icon(
                    Icons.check,
                  )),
            ),
          )
        ]),
        child: Column(
          children: <Widget>[
            ContraSelect(
              initialItem: initialValue,
              options: widget.options,
              onChanged: ((index, selected) {
                selectedValue = selected;
              }),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ContraButtonSolid(
          text: selectedValue.label,
          style: ContraButtonSolid.small.copyWith(
            color: ContraColors.lighteningYellow,
            textStyle: const TextStyle(color: ContraColors.woodSmoke),
          ),
          withShadow: true,
          withBorder: true,
          onPressed: () {
            _showModalSheetFilter(context);
          }),
    );
  }
}
