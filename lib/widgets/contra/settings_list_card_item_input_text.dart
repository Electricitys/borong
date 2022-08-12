import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/settings_list_card_item_input.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class SettingsListCardItemInputText extends StatefulWidget {
  final String title;
  final String? sheetTitle;
  final String initialValue;
  final String Function(String value)? valueFormatter;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmit;

  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String Function(dynamic value)? helperTextCallback;
  final String? placeholder;
  final int? minLength;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final int? helperMaxLines;

  const SettingsListCardItemInputText({
    super.key,
    required this.title,
    this.sheetTitle,
    this.initialValue = "",
    required this.onChanged,
    this.onSubmit,
    this.keyboardType,
    this.helperTextCallback,
    this.valueFormatter,
    this.textInputAction = TextInputAction.done,
    this.placeholder,
    this.helperMaxLines,
    this.minLines,
    this.maxLines,
    this.minLength,
    this.maxLength,
  }) : super();

  @override
  State<SettingsListCardItemInputText> createState() =>
      _SettingsListCardItemInputTextState();
}

class _SettingsListCardItemInputTextState
    extends State<SettingsListCardItemInputText> {
  late String _value = widget.initialValue;
  late String _tempValue = _value;

  _onChanged(String value) {
    widget.onChanged(value);
    _tempValue = value;
  }

  Future<void> _onSubmit() async {
    widget.onSubmit?.call(_tempValue);
    setState(() {
      _value = _tempValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsListCardItemInput(
        title: widget.title,
        sheetTitle: widget.sheetTitle,
        value: _value,
        valueFormatter: widget.valueFormatter,
        onSubmit: _onSubmit,
        child: (handleSubmit) => ContraInputText(
              onFieldSubmitted: ((p0) {
                _onSubmit();
                handleSubmit();
              }),
              placeholder: widget.placeholder,
              textInputAction: widget.textInputAction,
              helperTextCallback: widget.helperTextCallback,
              keyboardType: widget.keyboardType,
              initialValue: _value,
              onChanged: _onChanged,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
            ));
  }
}
