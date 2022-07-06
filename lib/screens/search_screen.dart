import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/screens/search_delegate_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/custom_search_text.dart';
import 'package:borong/widgets/contra/shop_card_item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../widgets/contra/custom_app_bar.dart';

class ShoppingSearchPage extends StatefulWidget {
  const ShoppingSearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingSearchPageState createState() => _ShoppingSearchPageState();
}

class _ShoppingSearchPageState extends State<ShoppingSearchPage> {
  var uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: carribeanGreen,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: lighteningYellow,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: pinkSalmon,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Rebousa - White striped tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        height: 96,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: CustomSearchText(
                      iconPath: "assets/icons/ic_search.svg",
                      text: "Search with love ...",
                      enable: false,
                      callback: () {
                        showSearch(
                          context: context,
                          delegate: ShoppingSearchDelegate(),
                        );
                      },
                      controller: _textEditingController,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                reverse: false,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShopCardItemWidget(
                    shopItem: _items[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingDetailPage(
                            item: _items[index],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
