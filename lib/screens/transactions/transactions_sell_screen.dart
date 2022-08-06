import 'package:borong/screens/transactions/transaction_card.dart';
import 'package:borong/screens/transactions/transaction_filter_button.dart';
import 'package:borong/widgets/contra/contra_select.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as developer;

class TransactionsSellScreen extends StatefulWidget {
  const TransactionsSellScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionsSellScreenState createState() => _TransactionsSellScreenState();
}

class _TransactionsSellScreenState extends State<TransactionsSellScreen> {
  final List<SelectOption> filterOptions = [
    SelectOption(label: "All", value: "all"),
    SelectOption(label: "New Orders", value: "order"),
    SelectOption(label: "Ready Shipping", value: "ready"),
    SelectOption(label: "Complete", value: "complete"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16.0),
        TransactionFilterButton(
          initialValue: filterOptions[0],
          onChanged: (SelectOption value) {},
          options: filterOptions,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8.0),
                for (var i in [1, 2, 3, 4, 5])
                  Padding(
                    key: Key("key-$i"),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    child: TransactionCard(
                      id: const Uuid().v1(),
                      title: 'Pesanan Baru',
                      customerName: 'Imanuel Pundoko',
                      deadlineDate: DateTime.now(),
                      displayedProductName:
                          'Air Jordan Gym Red Stain - Red, Black',
                      displayedProductThumbnail:
                          "https://picsum.photos/seed/$i/100",
                      orderSerial: 'INV/20220202/$i',
                      productAddition: 1,
                      shippingAddress: 'Jaga 3, Desa Sea',
                      shippingType: 'Ojek',
                      onTap: () {},
                      buttonOnTap: () {},
                      buttonText: "Terima Pesanan",
                    ),
                  ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
