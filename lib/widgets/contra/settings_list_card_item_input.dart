import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_list_card_item_base.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../screens/settings/contra_sheet.dart';

class SettingsListCardItemInput extends StatelessWidget {
  final String title;
  final String? sheetTitle;
  final String value;
  final String Function(String value)? valueFormatter;
  final Widget Function(Function handleSubmit) child;
  final VoidCallback? onInitState;
  final VoidCallback? onDispose;
  final Function onSubmit;

  const SettingsListCardItemInput({
    super.key,
    required this.title,
    required this.onSubmit,
    required this.child,
    this.onInitState,
    this.onDispose,
    required this.value,
    this.sheetTitle,
    this.valueFormatter,
  }) : super();

  void _onSubmit(BuildContext context) {
    developer.log("_onSubmit");
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(const SnackBar(
        content: Text("Sending..."),
        behavior: SnackBarBehavior.floating,
      ));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    try {
      onSubmit();
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text("Changed"),
          behavior: SnackBarBehavior.floating,
        ));
      return;
    } catch (err) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
          content: Text("Error"),
          behavior: SnackBarBehavior.floating,
        ));
    }
  }

  Future<void> _showModalSheet(BuildContext context) async {
    ContraSheet.showModalSheet(
      context,
      onInitState: onInitState,
      onDispose: onDispose,
      title: sheetTitle ?? title,
      action: Row(children: <Widget>[
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () async {
                  _onSubmit(context);
                },
                color: ContraColors.persianBlue,
                icon: const Icon(
                  Icons.check,
                )),
          ),
        )
      ]),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: child(() => _onSubmit(context))),
    );
  }

  _valueFormatter() {
    if (valueFormatter != null) {
      return valueFormatter!(value);
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContraListCardItemBase(
      title: title,
      value: _valueFormatter(),
      onTap: () => _showModalSheet(context),
      rightElement: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        height: 36,
        alignment: Alignment.topCenter,
        child: const Icon(
          Icons.edit,
          color: ContraColors.woodSmoke,
          size: 16,
        ),
      ),
    );
  }
}
