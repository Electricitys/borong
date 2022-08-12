import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import 'product_variant_form.dart';

class ProductVariant {
  String name;
  double price;
  int stock;

  ProductVariant({
    required this.name,
    required this.price,
    required this.stock,
  });
}

class ProductListVariantForm extends StatefulWidget {
  final List<ProductVariant> productVariants;
  final void Function(List<ProductVariant>) onChange;

  const ProductListVariantForm({
    super.key,
    required this.productVariants,
    required this.onChange,
  });

  @override
  State<ProductListVariantForm> createState() => _ProductListVariantFormState();
}

class _ProductListVariantFormState extends State<ProductListVariantForm> {
  late List<ProductVariant> _productVariants = widget.productVariants;

  _onAdd() {
    setState(() {
      _productVariants.add(ProductVariant(
        name: '',
        price: 0,
        stock: 0,
      ));
    });
  }

  _onRemove(index) {
    setState(() {
      _productVariants.removeAt(index);
      _productVariants = _productVariants;
    });
  }

  _onChange(index, ProductVariant productVariant) {
    setState(() {
      _productVariants[index] = productVariant;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContraText(
                color: ContraColors.trout,
                text: "Product Variant",
                textAlign: TextAlign.left,
                weight: FontWeight.bold,
                size: 21,
                alignment: Alignment.centerLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ContraButtonSolid(
                text: "Add variant",
                style: ContraButtonSolid.small,
                onPressed: (() => _onAdd()),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 280,
          child: ListView.separated(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _productVariants.length,
            itemBuilder: (context, index) => SizedBox(
              width: deviceWidth - (24.0 * 2),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ProductVariantForm(
                    disableRemoveButton: index == 0,
                    name: _productVariants[index].name,
                    price: _productVariants[index].price,
                    stock: _productVariants[index].stock,
                    onChanged: (({
                      required name,
                      required price,
                      required stock,
                    }) {
                      _onChange(
                          index,
                          ProductVariant(
                            name: name,
                            price: price,
                            stock: stock,
                          ));
                    }),
                    onRemove: () => _onRemove(index),
                  ),
                  if (index > 0)
                    Positioned(
                      top: -8.0,
                      left: -8.0,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: const ShapeDecoration(
                          color: ContraColors.persianBlue,
                          shape: CircleBorder(
                            side: BorderSide(
                                color: ContraColors.woodSmoke, width: 2),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(color: ContraColors.white),
                        )),
                      ),
                    ),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16.0),
          ),
        ),
      ],
    );
  }
}
