import 'package:borong/models/shop_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_plain.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/cart_add_remove_button.dart';
import 'package:borong/widgets/contra/colors_select_widget.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/sizes_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShoppingDetailPage extends StatefulWidget {
  final ShopItem item;
  const ShoppingDetailPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  static String routeName = "/shopping-detail-page";

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingDetailPageState createState() => _ShoppingDetailPageState();
}

class _ShoppingDetailPageState extends State<ShoppingDetailPage> {
  final List<String> _filters = <String>[];
  final List<Color> _colors = <Color>[];

  @override
  void initState() {
    _filters.add("XS");
    _filters.add("S");
    _filters.add("M");
    _filters.add("L");
    _colors.add(flamingo);
    _colors.add(lightening_yellow);
    _colors.add(carribean_green);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: kToolbarHeight + statusBarHeight,
                  color: lightening_yellow,
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  color: lightening_yellow,
                  child: Hero(
                    tag: 'hero-${widget.item.id}',
                    child: SvgPicture.asset(
                      "assets/images/shopping/coat_fur.svg",
                      height: 290,
                      width: 300,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: <Widget>[
                      const ContraText(
                        alignment: Alignment.centerLeft,
                        size: 27,
                        text: "Fur Jacket Cool Look",
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "by Amedian Company",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: trout,
                              fontSize: 17,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Wireframe is still important for ideation. It will help you to quickly test idea.",
                        style: TextStyle(
                            color: trout,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "\$" + "565",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Divider(
                          color: wood_smoke,
                          thickness: 3,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const ContraText(
                        alignment: Alignment.centerLeft,
                        text: "Sizes",
                        size: 15,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizesSelectWidget(
                          filters: _filters,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const ContraText(
                                  alignment: Alignment.centerLeft,
                                  text: "Colors",
                                  size: 15,
                                ),
                                ColorsSelectWidget(
                                  colors: _colors,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: ContraText(
                                    alignment: Alignment.centerLeft,
                                    text: "Quantity",
                                    size: 15,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 4),
                                    child: CartAddRemoveButton(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      ButtonPlain(
                        height: 60,
                        textSize: 21,
                        text: "Add to Bag",
                        color: wood_smoke,
                        textColor: white,
                        borderColor: wood_smoke,
                        onTap: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 24,
            top: (kToolbarHeight / 2) + statusBarHeight,
            child: ButtonRoundWithShadow(
                size: 48,
                borderColor: wood_smoke,
                color: white,
                callback: () {
                  Navigator.pop(context);
                },
                shadowColor: wood_smoke,
                iconPath: "assets/icons/arrow_back.svg"),
          )
        ],
      ),
    );
  }
}
