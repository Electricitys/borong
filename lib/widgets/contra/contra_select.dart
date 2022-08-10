import 'package:flutter/cupertino.dart';

class SelectOption<T> {
  final String label;
  final T value;

  SelectOption({
    required this.label,
    required this.value,
  });
}

class ContraSelect<T> extends StatelessWidget {
  final double? height;
  final List<SelectOption<T>> options;
  final void Function(int index, SelectOption<T> selected) onChanged;
  final int initialItem;

  const ContraSelect({
    super.key,
    required this.options,
    required this.onChanged,
    this.height = 200,
    this.initialItem = 0,
  });

  static option<T>(String label, T value) {
    return SelectOption(label: label, value: value);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: 32.0,
        magnification: 1.22,
        onSelectedItemChanged: (index) {
          final selected = options[index];
          onChanged(index, selected);
        },
        children: List<Widget>.generate(
          options.length,
          (index) => Center(
              child: Text(
            options[index].label,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
