import 'package:flutter/cupertino.dart';

class SelectOptions {
  final String label;
  final dynamic value;

  SelectOptions({
    required this.label,
    required this.value,
  });
}

class ContraSelect extends StatelessWidget {
  final double? height;
  final List<SelectOptions> options;
  final void Function(int index, SelectOptions selected) onChanged;

  const ContraSelect({
    super.key,
    required this.options,
    required this.onChanged,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CupertinoPicker(
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
