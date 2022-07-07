import 'package:borong/models/shop_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShopGridItemWidget extends StatelessWidget {
  final ShopItem shopItem;
  final VoidCallback onTap;

  const ShopGridItemWidget(
      {Key? key, required this.shopItem, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
                color: shopItem.bgColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: ContraColors.woodSmoke, width: 2))),
            child: Hero(
              tag: 'hero-${shopItem.id}',
              child: SvgPicture.asset(
                shopItem.image,
                height: 170,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              shopItem.name,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: ContraColors.woodSmoke,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$${shopItem.price}",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                  color: ContraColors.trout,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
