import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_divider.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String title;
  final String orderSerial;
  final String customerName;
  final DateTime deadlineDate;

  final String displayedProductName;
  final String displayedProductThumbnail;
  final int productAddition;

  final String shippingType;
  final String shippingAddress;

  final VoidCallback onTap;
  final VoidCallback? buttonOnTap;
  final String? buttonText;

  const TransactionCard({
    super.key,
    required this.id,
    required this.title,
    required this.orderSerial,
    required this.customerName,
    required this.deadlineDate,
    required this.displayedProductName,
    required this.displayedProductThumbnail,
    required this.productAddition,
    required this.shippingType,
    required this.shippingAddress,
    required this.onTap,
    this.buttonText,
    this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap()),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: ContraColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ContraColors.black,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(color: ContraColors.black, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ContraText(
                      text: title,
                      size: 12,
                      color: ContraColors.trout,
                    ),
                    ContraText(
                      text: orderSerial,
                      size: 12,
                    ),
                    const SizedBox(height: 4),
                    ContraText(
                      text: customerName,
                      size: 12,
                      color: ContraColors.trout,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const ContraText(
                      color: ContraColors.trout,
                      text: "Batas respon",
                      size: 12,
                    ),
                    ContraText(
                      text: DateFormat("d MMM 2022, H:m").format(deadlineDate),
                      size: 16,
                    ),
                  ],
                )
              ],
            ),
            const ContraDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: const ShapeDecoration(
                      color: ContraColors.trout,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          side: BorderSide(
                              color: ContraColors.woodSmoke,
                              width: 2,
                              strokeAlign: StrokeAlign.inside))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: Hero(
                      tag: 'hero-$id',
                      child: Image.network(
                        displayedProductThumbnail,
                        width: 64,
                        height: 64,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ContraText(
                        text: displayedProductName,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLine: 3,
                        size: 16,
                      ),
                      ContraText(
                        text: "+$productAddition produk lainnya",
                        size: 12,
                        weight: FontWeight.normal,
                        color: ContraColors.trout,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    Row(
                      children: const <Widget>[
                        Icon(
                          Icons.local_shipping_outlined,
                          size: 14,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ContraText(
                          text: "Reguler - Ojek",
                          size: 12,
                          weight: FontWeight.normal,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const <Widget>[
                        Icon(
                          Icons.place_outlined,
                          size: 14,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ContraText(
                          text: "Sea",
                          size: 12,
                          weight: FontWeight.normal,
                        )
                      ],
                    ),
                  ],
                ),
                if (buttonText != null)
                  ContraButtonSolid(
                    text: buttonText!,
                    style: ContraButtonSolid.small.copyWith(
                      textStyle: const TextStyle(color: ContraColors.woodSmoke),
                      color: ContraColors.lighteningYellow,
                      height: 32,
                    ),
                    withBorder: true,
                    withShadow: true,
                    onPressed: (() {
                      buttonOnTap!();
                    }),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
