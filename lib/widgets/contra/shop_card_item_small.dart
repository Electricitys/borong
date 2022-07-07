import 'package:borong/models/shop_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopCardSmallItemWidget extends StatelessWidget {
  final ShopItem shopItem;
  final VoidCallback onTap;

  const ShopCardSmallItemWidget({
    Key? key,
    required this.shopItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 120,
              height: 117,
              decoration: ShapeDecoration(
                  color: shopItem.bgColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      side:
                          BorderSide(color: ContraColors.woodSmoke, width: 2))),
              child: Hero(
                tag: 'hero-${shopItem.id}',
                child: SvgPicture.asset(
                  shopItem.image,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                shopItem.name,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: ContraColors.woodSmoke,
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Text(
                "\$${shopItem.price}",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: ContraColors.trout,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
