import 'dart:developer';
import 'dart:io';

import 'package:borong/models/category_item.dart';
import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/screens/setting_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/shop_card_item_small.dart';
import 'package:borong/widgets/contra/shop_grid_item.dart';
import 'package:borong/widgets/contra/shopping_card_pager.dart';
import 'package:borong/widgets/contra/star_widget.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class _KeyVal {
  String label;
  String value;

  _KeyVal({
    required this.label,
    required this.value,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({foundation.Key? key}) : super(key: key);

  static String routeName = "/profile-page";

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Flash tee",
        price: "189",
        bgColor: carribean_green,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Flash tee",
        price: "189",
        bgColor: lightening_yellow,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Flash tee",
        price: "189",
        bgColor: pink_salomn,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Flash tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Flash tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Flash tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Flash tee",
        price: "189",
        bgColor: flamingo,
        by: "Company name"));

    _categories.add(const Category(
        bgColor: bareley_white, startColor: wood_smoke, name: "Men"));
    _categories.add(const Category(
        bgColor: fair_pink, startColor: wood_smoke, name: "Woman"));
    _categories.add(
        const Category(bgColor: foam, startColor: wood_smoke, name: "Kid"));
    _categories.add(const Category(
        bgColor: bareley_white, startColor: wood_smoke, name: "Adult"));
    _categories.add(const Category(
        bgColor: fair_pink, startColor: wood_smoke, name: "Men"));
    _categories.add(
        const Category(bgColor: foam, startColor: wood_smoke, name: "Men"));
  }

  @override
  Widget build(BuildContext context) {
    List<_KeyVal> profileStats = [
      _KeyVal(label: "Followers", value: (10).toString()),
      _KeyVal(label: "Products", value: (125).toString()),
      _KeyVal(label: "Rate", value: (5.0).toString()),
    ];
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        height: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    width: 48,
                  ),
                  const Expanded(
                    flex: 1,
                    child: ContraText(
                      size: 27,
                      alignment: Alignment.bottomCenter,
                      text: "Profile",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: wood_smoke,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.orange.shade700,
                      Colors.yellow.shade300,
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      "https://i.pravatar.cc/300?u=fake@pravatar.com",
                      width: 128,
                      height: 128,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "@ilomon10",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  profileStats.length,
                  (index) => Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            profileStats[index].value,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(profileStats[index].label),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: (1 / 1.7),
                ),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShopGridItemWidget(
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
