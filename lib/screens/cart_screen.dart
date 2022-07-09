import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/address_screen.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_plain_with_shadow.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/shop_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as developer;

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  static String routeName = "/shopping-search-list-page";

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  var uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final ScrollController _scrollController = ScrollController();
  late bool _hideBottomBar = true;

  @override
  void initState() {
    super.initState();
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

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_hideBottomBar != false) {
          setState(() {
            _hideBottomBar = false;
          });
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_hideBottomBar != true) {
          setState(() {
            _hideBottomBar = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContraColors.white,
      appBar: CustomAppBar(
        height: 82,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: ContraText(
                      size: 27,
                      alignment: Alignment.centerLeft,
                      text: "Total: Rp. 25.000",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(children: <Widget>[
        Positioned.fill(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  reverse: false,
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ShopListItemWidget(
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
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    color: ContraColors.woodSmoke,
                    thickness: 2,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 75,
                )
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          left: 0,
          right: 0,
          bottom: _hideBottomBar ? 0 : -35,
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ButtonPlainWithShadow(
                // size: 150,
                borderColor: ContraColors.woodSmoke,
                color: ContraColors.lighteningYellow,
                callback: () {
                  Navigator.pushNamed(context, AddressScreen.routeName);
                },
                shadowColor: ContraColors.woodSmoke,
                text: 'Checkout',
              ),
            ),
          ),
        )
      ]),
    );
  }
}
