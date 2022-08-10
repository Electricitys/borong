import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/settings_list_card_item_input.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'contra_select.dart';

class SettingsListCardItemInputTextSelect<T> extends StatefulWidget {
  final List<SelectOption<T>> options;

  final String title;
  final String? sheetTitle;
  final SelectOption<T>? initialValue;
  final String Function(SelectOption<T> value)? valueFormatter;
  final void Function(int index, SelectOption<T> value) onChanged;

  const SettingsListCardItemInputTextSelect({
    super.key,
    required this.title,
    this.sheetTitle,
    this.initialValue,
    required this.onChanged,
    this.valueFormatter,
    required this.options,
  }) : super();

  @override
  State<SettingsListCardItemInputTextSelect<T>> createState() =>
      _SettingsListCardItemInputTextSelectState<T>();
}

class _SettingsListCardItemInputTextSelectState<T>
    extends State<SettingsListCardItemInputTextSelect<T>> {
  late SelectOption<T>? _value = widget.initialValue;
  late SelectOption<T>? _tempValue = _value;

  _onChanged(int index, SelectOption<T> selected) {
    widget.onChanged(index, selected);
    _tempValue = selected;
  }

  String _valueFormatter() {
    if (_value == null) return "";
    if (widget.valueFormatter != null) {
      return widget.valueFormatter!(_value!);
    }
    return _value!.label;
  }

  Future<void> _onSubmit() async {
    setState(() {
      _value = _tempValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsListCardItemInput(
        title: widget.title,
        sheetTitle: widget.sheetTitle,
        value: _valueFormatter(),
        onSubmit: _onSubmit,
        child: (handleSubmit) => ContraSelect<T>(
              initialItem: _value != null ? widget.options.indexOf(_value!) : 0,
              onChanged: _onChanged,
              options: widget.options,
            ));
  }
}
