import 'package:borong/models/shop_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/cart_add_remove_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopListItemWidget extends StatelessWidget {
  final ShopItem shopItem;
  final VoidCallback onTap;

  const ShopListItemWidget(
      {Key? key, required this.shopItem, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                    color: shopItem.bgColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        side: BorderSide(
                            color: ContraColors.woodSmoke, width: 2))),
                child: Hero(
                  tag: 'hero-${shopItem.id}',
                  child: SvgPicture.asset(
                    shopItem.image,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            shopItem.by,
                            style: const TextStyle(
                                color: ContraColors.trout,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              shopItem.name,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: ContraColors.woodSmoke,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\$${shopItem.price}",
                        style: const TextStyle(
                            color: ContraColors.woodSmoke,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                      CartAddRemoveButton(
                        onChange: (value) {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
