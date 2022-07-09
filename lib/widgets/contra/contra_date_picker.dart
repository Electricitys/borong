import 'package:flutter/cupertino.dart';

class ContraDatePicker extends StatefulWidget {
  final double height;

  final DateTime? initialDateTime;
  final int minimumYear;
  final int? maximumYear;
  final void Function(DateTime value) onDateTimeChanged;

  const ContraDatePicker({
    super.key,
    this.initialDateTime,
    this.height = 200,
    this.minimumYear = 1,
    this.maximumYear,
    required this.onDateTimeChanged,
  });

  @override
  State<ContraDatePicker> createState() => _ContraDatePickerState();
}

class _ContraDatePickerState extends State<ContraDatePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: CupertinoDatePicker(
        initialDateTime: widget.initialDateTime,
        minimumYear: widget.minimumYear,
        maximumYear: widget.maximumYear,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: widget.onDateTimeChanged,
      ),
    );
  }
}
