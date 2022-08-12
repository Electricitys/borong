import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/utilities/currency_formatter.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/settings_list_card_item_input_text.dart';
import 'package:flutter/material.dart';

class ProductVariantForm extends StatefulWidget {
  final String name;
  final double price;
  final int stock;
  final bool disableRemoveButton;

  final void Function({
    required String name,
    required double price,
    required int stock,
  }) onChanged;

  final void Function() onRemove;

  const ProductVariantForm(
      {super.key,
      required this.name,
      required this.price,
      required this.stock,
      required this.onChanged,
      required this.onRemove,
      required this.disableRemoveButton});

  @override
  State<ProductVariantForm> createState() => _ProductVariantFormState();
}

class _ProductVariantFormState extends State<ProductVariantForm> {
  late String _nameValue = widget.name;
  late double _priceValue = widget.price;
  late int _stockValue = widget.stock;

  void _onSubmit() {
    widget.onChanged(
      name: _nameValue,
      price: _priceValue,
      stock: _stockValue,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(color: ContraColors.woodSmoke, offset: Offset(0, 4))
          ],
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: ContraColors.woodSmoke,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      child: Column(children: <Widget>[
        SettingsListCardItemInputText(
            title: "Name",
            sheetTitle: "Edit Variant Name",
            initialValue: widget.name,
            onSubmit: ((value) => _onSubmit()),
            onChanged: ((value) {
              _nameValue = value;
            })),
        SettingsListCardItemInputText(
            title: "Price",
            keyboardType: TextInputType.number,
            helperTextCallback: (value) => CurrencyFormatter.format(value),
            sheetTitle: "Edit Price",
            initialValue: "${widget.price}",
            valueFormatter: (value) => CurrencyFormatter.format(value),
            onSubmit: ((value) => _onSubmit()),
            onChanged: ((value) {
              _priceValue = double.tryParse(value) ?? 0;
            })),
        SettingsListCardItemInputText(
            title: "Stock",
            keyboardType: TextInputType.number,
            sheetTitle: "Edit Stock",
            initialValue: "${widget.stock}",
            onSubmit: ((value) => _onSubmit()),
            onChanged: ((value) {
              _stockValue = int.tryParse(value) ?? 0;
            })),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Opacity(
              opacity: widget.disableRemoveButton ? 0.0 : 1.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ContraButtonSolid(
                    isDisabled: widget.disableRemoveButton,
                    text: "Remove",
                    withBorder: true,
                    withShadow: true,
                    style: ContraButtonSolid.small.copyWith(
                      textStyle: const TextStyle(color: ContraColors.woodSmoke),
                      color: ContraColors.lighteningYellow,
                    ),
                    onPressed: () {
                      widget.onRemove();
                    }),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
