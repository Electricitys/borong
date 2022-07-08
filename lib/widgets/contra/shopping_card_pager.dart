import 'package:borong/models/category_item.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/circle_dot_widget.dart';
import 'package:flutter/cupertino.dart';

import 'shopping_card_pager_item.dart';

class ShoppingCardPager extends StatefulWidget {
  const ShoppingCardPager({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingCardPagerState createState() => _ShoppingCardPagerState();
}

class _ShoppingCardPagerState extends State<ShoppingCardPager> {
  late PageController _pageController;
  int currentPageValue = 0;
  int previousPageValue = 0;
  double _moveBar = 0.0;
  final List<Widget> _cards = const [
    ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: ContraColors.lighteningYellow,
          startColor: ContraColors.lighteningYellow,
          name: "Summer \nCollection",
          image: "assets/images/shopping/peep_glass.svg"),
    ),
    ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: ContraColors.lighteningYellow,
          startColor: ContraColors.lighteningYellow,
          name: "Tee \nShirts",
          image: "assets/images/shopping/peep_glass.svg"),
    ),
    ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: ContraColors.lighteningYellow,
          startColor: ContraColors.lighteningYellow,
          name: "Formal \nPants",
          image: "assets/images/shopping/peep_glass.svg"),
    )
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: PageView.builder(
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return _cards[index];
            },
            onPageChanged: (int page) {
              animatePage(page);
            },
            itemCount: _cards.length,
            controller: _pageController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < _cards.length; i++)
                if (i == currentPageValue) ...[
                  const CircleDotWidget(
                    isActive: true,
                    color: ContraColors.flamingo,
                    borderColor: ContraColors.flamingo,
                  )
                ] else
                  const CircleDotWidget(
                    isActive: false,
                    color: ContraColors.white,
                    borderColor: ContraColors.woodSmoke,
                  ),
            ],
          ),
        ),
      ],
    );
  }

  void animatePage(int page) {
    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar - 0.14;
      }
    }

    setState(() {});
  }
}
