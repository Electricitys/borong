import 'package:borong/models/category_item.dart';
import 'package:borong/screens/shopping_list_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_plain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoppingCardPagerItem extends StatelessWidget {
  final CategoryBig categoryBig;

  const ShoppingCardPagerItem({Key? key, required this.categoryBig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: ShapeDecoration(
          color: categoryBig.bgColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: ContraColors.woodSmoke, width: 2))),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 24),
                  child: Text(
                    categoryBig.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: ContraColors.woodSmoke,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, bottom: 24),
                  child: ButtonPlain(
                    color: ContraColors.woodSmoke,
                    borderColor: ContraColors.woodSmoke,
                    textColor: ContraColors.white,
                    text: "Shop now",
                    size: 96,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShoppingListScreen(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SvgPicture.asset(
              categoryBig.image,
              width: 210,
              height: 230,
            ),
          ),
        ],
      ),
    );
  }
}
