import 'package:borong/models/shop_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopCardItemWidget extends StatelessWidget {
  final ShopItem shopItem;
  final VoidCallback onTap;

  const ShopCardItemWidget(
      {Key? key, required this.shopItem, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                  color: shopItem.bgColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      side: BorderSide(color: wood_smoke, width: 2))),
              child: SvgPicture.asset(
                shopItem.image,
                width: 235,
                height: 212,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      shopItem.name,
                      maxLines: 2,
                      style: const TextStyle(
                          color: wood_smoke,
                          fontSize: 21,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: shopItem.bgColor,
                  )
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  "\$${shopItem.price}",
                  style: const TextStyle(
                      color: wood_smoke,
                      fontSize: 27,
                      fontWeight: FontWeight.w800),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
