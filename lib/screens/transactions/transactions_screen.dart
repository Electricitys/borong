import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/transactions/transactions_buy_screen.dart';
import 'package:borong/screens/transactions/transactions_sell_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as developer;

class TransactionsScreen extends StatefulWidget {
  final String title;

  const TransactionsScreen({
    Key? key,
    this.title = "Transaction",
  }) : super(key: key);

  static const String routeName = "/transaction-screen";

  @override
  // ignore: library_private_types_in_public_api
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  Uuid uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final List<String> _filters = <String>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ContraColors.white,
        appBar: CustomAppBar(
          height: 68,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.0),
                    border: Border.all(
                      color: ContraColors.black,
                      width: 2,
                    ),
                  ),
                  child: TabBar(
                    labelStyle: ContraText.style.copyWith(
                      fontSize: 24,
                      fontFamily: "Montserrat",
                    ),
                    unselectedLabelColor: ContraText.style.color,
                    indicatorColor: ContraColors.black,
                    indicator: BoxDecoration(
                      color: ContraColors.persianBlue,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    tabs: const <Widget>[
                      Tab(text: "Buy"),
                      Tab(text: "Sell"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: <Widget>[
          TransactionsBuyScreen(),
          TransactionsSellScreen(),
        ]),
      ),
    );
  }
}
