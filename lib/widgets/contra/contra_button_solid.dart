import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';

class ContraButtonStyle {
  final double? textSize;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? radiusSize;
  final Color? color;
  final Color? shadowColor;
  final Color? borderColor;

  final double? height;

  const ContraButtonStyle({
    Key? key,
    this.color,
    this.textSize,
    this.textStyle,
    this.padding,
    this.radiusSize,
    this.shadowColor,
    this.borderColor,
    this.height,
  });

  ContraButtonStyle copyWith(
      {double? textSize,
      TextStyle? textStyle,
      EdgeInsets? padding,
      double? radiusSize,
      Color? color,
      Color? shadowColor,
      Color? borderColor,
      double? height}) {
    return ContraButtonStyle(
        textSize: textSize ?? this.textSize,
        textStyle: textStyle != null
            ? this.textStyle?.merge(textStyle)
            : this.textStyle,
        padding: padding ?? this.padding,
        radiusSize: radiusSize ?? this.radiusSize,
        color: color ?? this.color,
        shadowColor: shadowColor ?? this.shadowColor,
        borderColor: shadowColor ?? this.shadowColor,
        height: height ?? this.height);
  }
}

class ContraButtonSolid extends StatelessWidget {
  final bool subtle;
  final Color? textColor;
  final String text;
  final VoidCallback onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ContraButtonStyle? style;
  final bool withShadow;
  final bool withBorder;
  final bool isLoading;
  final bool isDisabled;

  const ContraButtonSolid({
    super.key,
    this.textColor,
    required this.text,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.subtle = false,
    this.style = ContraButtonSolid.large,
    this.withShadow = false,
    this.withBorder = false,
    this.isLoading = false,
    this.isDisabled = false,
  });

  static const ContraButtonStyle small = ContraButtonStyle(
    textSize: 12,
    textStyle: TextStyle(),
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    radiusSize: 8,
    height: 28,
    shadowColor: ContraColors.woodSmoke,
    borderColor: ContraColors.black,
  );

  static const ContraButtonStyle medium = ContraButtonStyle(
    textSize: 16,
    padding: EdgeInsets.all(8.0),
    radiusSize: 12,
    shadowColor: ContraColors.woodSmoke,
    borderColor: ContraColors.black,
    height: 48,
  );

  static const ContraButtonStyle large = ContraButtonStyle(
    textSize: 21,
    padding: EdgeInsets.all(16.0),
    radiusSize: 16,
    shadowColor: ContraColors.woodSmoke,
    borderColor: ContraColors.black,
    height: 64,
  );

  @override
  Widget build(BuildContext context) {
    late ContraButtonStyle style = this.style ?? ContraButtonSolid.large;
    late ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(
        color: textColor ?? ContraColors.white,
      ),
      backgroundColor: style.color ?? ContraColors.woodSmoke,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
    );
    if (subtle) {
      buttonStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(
          color: style.color ?? ContraColors.woodSmoke,
        ),
        backgroundColor: Colors.transparent,
      );
    }

    return ButtonTheme(
        minWidth: MediaQuery.of(context).size.width,
        child: Container(
          height: style.height!,
          decoration: ShapeDecoration(
              shadows: [
                BoxShadow(
                  color: withShadow == true
                      ? style.shadowColor ?? Colors.transparent
                      : Colors.transparent,
                  offset: Offset(
                    0.0, // Move to right 10  horizontally
                    withShadow == true ? 2.0 : 0, // Move to bottom 5 Vertically
                  ),
                )
              ],
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(style.radiusSize! + 2)),
                  side: withBorder == true
                      ? BorderSide(
                          color: style.borderColor ?? Colors.transparent,
                          width: 2,
                          strokeAlign: StrokeAlign.inside,
                        )
                      : BorderSide.none)),
          child: ElevatedButton(
            onPressed: isDisabled == true ? null : onPressed,
            style: buttonStyle.copyWith(
              elevation: MaterialStateProperty.all(0.0),
              padding: MaterialStateProperty.all(style.padding),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(style.radiusSize!)))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                prefixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: prefixIcon,
                      )
                    : const SizedBox(),
                if (isLoading == true)
                  Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: style.color,
                    ),
                  )
                else
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: style.textSize,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Montserrat",
                    ).merge(style.textStyle),
                  ),
                suffixIcon != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: suffixIcon,
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ));
  }
}
