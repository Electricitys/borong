import 'package:borong/widgets/contra/circle_dot_widget.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PagerImageView extends StatefulWidget {
  final List<String> images;

  const PagerImageView({Key? key, required this.images}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < _cards.length; i++)
              if (i == currentPageValue) ...[
                const CircleDotWidget(
                  isActive: true,
                  color: ContraColors.white,
                  borderColor: ContraColors.white,
                )
              ] else
                const CircleDotWidget(
                  isActive: false,
                  color: ContraColors.flamingo,
                  borderColor: ContraColors.woodSmoke,
                ),
          ],
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
