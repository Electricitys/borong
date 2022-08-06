import 'dart:io';

import 'package:borong/models/category_item.dart';
import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/shop_card_item_small.dart';
import 'package:borong/widgets/contra/shopping_card_pager.dart';
import 'package:borong/widgets/contra/star_widget.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ShoppingHomePage extends StatefulWidget {
  const ShoppingHomePage({foundation.Key? key}) : super(key: key);

  static String routeName = "/shopping-home-page";

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingHomePageState createState() => _ShoppingHomePageState();
}

class _ShoppingHomePageState extends State<ShoppingHomePage> {
  var uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final List<Category> _categories = <Category>[];

  @override
  void initState() {
    super.initState();
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.caribbeanGreen,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.lighteningYellow,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.pinkSalmon,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));

    _categories.add(const Category(
        bgColor: ContraColors.bareleyWhite,
        startColor: ContraColors.woodSmoke,
        name: "Men"));
    _categories.add(const Category(
        bgColor: ContraColors.fairPink,
        startColor: ContraColors.woodSmoke,
        name: "Woman"));
    _categories.add(const Category(
        bgColor: ContraColors.foam,
        startColor: ContraColors.woodSmoke,
        name: "Kid"));
    _categories.add(const Category(
        bgColor: ContraColors.bareleyWhite,
        startColor: ContraColors.woodSmoke,
        name: "Adult"));
    _categories.add(const Category(
        bgColor: ContraColors.fairPink,
        startColor: ContraColors.woodSmoke,
        name: "Men"));
    _categories.add(const Category(
        bgColor: ContraColors.foam,
        startColor: ContraColors.woodSmoke,
        name: "Men"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContraColors.white,
      appBar: CustomAppBar(
        height: 94,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  foundation.kIsWeb || Platform.isIOS
                      ? ButtonRoundWithShadow(
                          size: 48,
                          borderColor: ContraColors.woodSmoke,
                          color: ContraColors.white,
                          callback: () {
                            Navigator.pop(context);
                          },
                          shadowColor: ContraColors.woodSmoke,
                          iconPath: "assets/icons/arrow_back.svg")
                      : const SizedBox(),
                  foundation.kIsWeb || Platform.isIOS
                      ? const SizedBox(
                          width: 20,
                        )
                      : const SizedBox(),
                  Expanded(
                    flex: 2,
                    child: ContraText(
                      size: foundation.kIsWeb || Platform.isIOS ? 36 : 44,
                      alignment: foundation.kIsWeb
                          ? Alignment.bottomCenter
                          : Alignment.bottomLeft,
                      text: "Borong",
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
            SizedBox(
              height: 180,
              child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StartWidget(
                      category: _categories[index],
                    );
                  }),
            ),
            const SizedBox(height: 250, child: ShoppingCardPager()),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    ShopItem shopItem = _items[index];
                    return ShopCardSmallItemWidget(
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
