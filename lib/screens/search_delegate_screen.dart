import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/chips_filter_widget.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/shop_card_item.dart';
import 'package:borong/widgets/contra/shop_list_item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ShoppingSearchDelegate extends SearchDelegate {
  var uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final List<ShopItem> _suggestion = <ShopItem>[];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: colorScheme.brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        toolbarTextStyle: theme.textTheme.bodyText2,
        titleTextStyle: theme.textTheme.headline6,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: ButtonRoundWithShadow(
        size: 48,
        borderColor: wood_smoke,
        color: white,
        callback: () {
          Navigator.pop(context);
        },
        shadowColor: wood_smoke,
        iconPath: "assets/icons/arrow_back.svg",
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
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
    return ListView.builder(
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
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
