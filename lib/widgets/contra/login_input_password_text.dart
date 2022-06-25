import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPasswordText extends StatefulWidget {
  final String text;
  final String iconPath;
  final TextInputAction? textInputAction;

  const LoginPasswordText({
    Key? key,
    required this.text,
    required this.iconPath,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  State<LoginPasswordText> createState() => _LoginPasswordTextState();
}

class _LoginPasswordTextState extends State<LoginPasswordText> {
  bool showPassword = false;

  void _handleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return TextField(
      textInputAction: widget.textInputAction,
      obscureText: !showPassword,
      style: textStyle,
      decoration: InputDecoration(
        hintText: '\u25CF \u25CF \u25CF \u25CF \u25CF \u25CF',
        hintStyle: textStyle.apply(color: wood_smoke),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            widget.iconPath,
            height: 24,
            width: 24,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: _handleShowPassword,
            child: showPassword
                ? SvgPicture.asset(
                    'assets/icons/eye-outline.svg',
                    height: 24,
                    width: 24,
                  )
                : SvgPicture.asset(
                    'assets/icons/eye-off-outline.svg',
                    height: 24,
                    width: 24,
                  ),
          ),
        ),
      ),
    );
  }
}
