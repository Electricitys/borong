import 'package:borong/models/category_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  final Category category;

  const StartWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            decoration: ShapeDecoration(
                shadows: const [
                  BoxShadow(
                    color: ContraColors.woodSmoke,
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
                color: category.bgColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: ContraColors.woodSmoke, width: 2))),
            child: Icon(
              Icons.star_border,
              size: 32,
              color: category.startColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            category.name,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          )
        ],
      ),
    );
  }
}
