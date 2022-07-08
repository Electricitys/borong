import 'package:borong/widgets/contra/chip_widget.dart';
import 'package:flutter/material.dart';

class ChipsFilterWidget extends StatefulWidget {
  final List<String> filters;

  const ChipsFilterWidget({Key? key, required this.filters}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChipsFilterWidgetState createState() => _ChipsFilterWidgetState();
}

class _ChipsFilterWidgetState extends State<ChipsFilterWidget> {
  List<String> options = [];
  List<int> selectedChoices = [];

  @override
  void initState() {
    super.initState();
    options = widget.filters;
    selectedChoices.add(0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 12,
        runSpacing: 12,
        children: List<Widget>.generate(
          options.length,
          (int index) {
            return ChipWidget(
              selected: selectedChoices.contains(index),
              text: options[index],
              onTap: () {
                setState(() {
                  selectedChoices.contains(index)
                      ? selectedChoices.remove(index)
                      : selectedChoices.add(index);
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
