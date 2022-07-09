import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

const TextStyle _kTextStyle = TextStyle(
  color: ContraColors.woodSmoke,
  fontWeight: FontWeight.w800,
  fontSize: 18,
);

const double _kIconSize = 24;

class CartAddRemoveButton extends StatefulWidget {
  final double height;
  final double width;
  final int initialValue;
  final int min;
  final int max;
  final void Function(int value) onChange;
  final void Function()? onRemove;
  const CartAddRemoveButton({
    super.key,
    this.initialValue = 0,
    this.min = 0,
    this.max = 99,
    this.onRemove,
    required this.onChange,
    this.height = 40,
    this.width = 96,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CartAddRemoveButtonState createState() => _CartAddRemoveButtonState();
}

class _CartAddRemoveButtonState extends State<CartAddRemoveButton> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  void onAddClicked() {
    if (count < widget.max) {
      setState(() {
        count = count + 1;
        widget.onChange(count);
      });
    }
  }

  void onRemoveClicked() {
    if (count > widget.min) {
      setState(() {
        count = count - 1;
        widget.onChange(count);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isZero = (count == 0);
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              side: BorderSide(color: ContraColors.woodSmoke, width: 2))),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 30,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: (isZero)
                  ? const Icon(
                      Icons.close,
                      size: _kIconSize,
                    )
                  : const Icon(
                      Icons.remove,
                      size: _kIconSize,
                    ),
              onPressed: () {
                if (isZero && widget.onRemove != null) {
                  widget.onRemove!();
                } else {
                  onRemoveClicked();
                }
              },
            ),
          ),
          Expanded(
            flex: 40,
            child: count == 0
                ? GestureDetector(
                    onTap: () {
                      onAddClicked();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      decoration: const ShapeDecoration(
                        color: ContraColors.lighteningYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Add",
                        textAlign: TextAlign.center,
                        style: _kTextStyle,
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height,
                      color: ContraColors.lighteningYellow,
                      child: Text(count.toString(), style: _kTextStyle),
                    ),
                  ),
          ),
          if (!isZero)
            Expanded(
              flex: 30,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.add,
                  size: _kIconSize,
                ),
                onPressed: () {
                  onAddClicked();
                },
              ),
            )
        ],
      ),
    );
  }
}
