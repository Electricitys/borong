import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

class ContraDivider extends StatelessWidget {
  final EdgeInsets? padding;

  const ContraDivider({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8.0),
      child: const Divider(
        color: ContraColors.woodSmoke,
        thickness: 2,
        height: 0,
      ),
    );
  }
}
