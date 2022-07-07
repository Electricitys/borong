import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContraInputText extends StatefulWidget {
  final String? placeholder;
  final Icon? prefixIcon;
  final TextInputAction? textInputAction;

  final bool? obscureText;

  final FocusNode? focusNode;
  final TextEditingController? controller;

  final String? initialValue;
  final void Function(String)? onChanged;

  const ContraInputText({
    Key? key,
    this.placeholder,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<ContraInputText> createState() => _ContraInputTextState();
}

class _ContraInputTextState extends State<ContraInputText> {
  bool showPassword = false;

  void _handleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
    );

    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      style: textStyle,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText == true ? !showPassword : false,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Can\'t be empty';
        }
        if (text.length < 4) {
          return 'Too short';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        errorStyle: textStyle.copyWith(fontSize: 16),
        hintText: widget.placeholder ??
            (widget.obscureText != null
                ? '\u25CF \u25CF \u25CF \u25CF \u25CF \u25CF'
                : null),
        hintStyle: textStyle.apply(color: ContraColors.woodSmoke),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ContraColors.black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ContraColors.black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ContraColors.black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: ContraColors.black),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        prefixIcon: (widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: widget.prefixIcon,
              )
            : null),
        suffixIcon: widget.obscureText == true
            ? Padding(
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
              )
            : null,
      ),
    );
  }
}
