import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/chips_filter_widget.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/shop_list_item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../widgets/contra/custom_app_bar.dart';

class OrderListScreen extends StatefulWidget {
  final String title;

  const OrderListScreen({
    Key? key,
    this.title = "Orders",
  }) : super(key: key);

  static String routeName = "/settings-orders-screen";

  @override
  // ignore: library_private_types_in_public_api
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  Uuid uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final List<String> _filters = <String>[];

  @override
  void initState() {
    super.initState();
    _filters.add("Small");
    _filters.add("Medium");
    _filters.add("Shirt");
    _filters.add("Shirt");
    _filters.add("Shirt");
    _filters.add("Tee");
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.carribeanGreen,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.lighteningYellow,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.pinkSalmon,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContraColors.white,
      appBar: CustomAppBar(
        height: 92,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ButtonRoundWithShadow(
                      size: 48,
                      borderColor: ContraColors.woodSmoke,
                      color: ContraColors.white,
                      callback: () {
                        Navigator.pop(context);
                      },
                      shadowColor: ContraColors.woodSmoke,
                      iconPath: "assets/icons/arrow_back.svg"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ContraText(
                size: 27,
                alignment: Alignment.bottomCenter,
                text: widget.title,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                width: 20,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ChipsFilterWidget(
                filters: _filters,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              reverse: false,
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index) {
                ShopItem shopItem = _items[index];
                return ShopListItemWidget(
                  shopItem: shopItem,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShoppingDetailPage(
                          item: shopItem,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: ContraColors.black,
                  thickness: 2,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
