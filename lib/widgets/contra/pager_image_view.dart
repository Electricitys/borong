import 'package:borong/widgets/contra/circle_dot_widget.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PagerImageView extends StatefulWidget {
  final List<String> images;

  const PagerImageView({required this.images});

  @override
  _PagerImageViewState createState() => _PagerImageViewState();
}

class _PagerImageViewState extends State<PagerImageView> {
  late PageController _pageController;
  int currentPageValue = 0;
  int previousPageValue = 0;
  double _moveBar = 0.0;
  List<String> _images = [];
  final List<Widget> _cards = [];

  @override
  void initState() {
    _images = widget.images;
    _cards.add(SvgPicture.asset(
      _images[0],
      height: 290,
      width: 300,
    ));
    _cards.add(SvgPicture.asset(
      _images[1],
      height: 290,
      width: 300,
    ));
    _cards.add(SvgPicture.asset(
      _images[2],
      height: 290,
      width: 300,
    ));
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
          height: 300,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PageView.builder(
            physics: ClampingScrollPhysics(),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < _cards.length; i++)
              if (i == currentPageValue) ...[
                CircleDotWidget(
                  isActive: true,
                  color: white,
                  borderColor: white,
                )
              ] else
                CircleDotWidget(
                  isActive: false,
                  color: flamingo,
                  borderColor: woodSmoke,
                ),
          ],
        ),
      ],
    );
  }

  void animatePage(int page) {
    print('page is $page');
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
