import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

import 'package:flutter_svg/flutter_svg.dart';

class ContraInputText extends StatefulWidget {
  final String? placeholder;
  final Icon? prefixIcon;
  final TextInputAction? textInputAction;

  final bool required;
  final String? helperText;
  final String Function(String value)? helperTextCallback;
  final int? minLength;
  final int? maxLength;

  final List<TextInputFormatter>? inputFormatters;

  final bool? obscureText;
  final int? minLines;
  final int? maxLines;
  final int? helperMaxLines;
  final TextInputType? keyboardType;

  final FocusNode? focusNode;
  final TextEditingController? controller;

  final String? initialValue;
  final void Function(String value)? onChanged;
  final void Function(String)? onFieldSubmitted;

  const ContraInputText({
    super.key,
    this.placeholder,
    this.prefixIcon,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.minLength,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.inputFormatters,
    this.required = false,
    this.helperText,
    this.helperTextCallback,
    this.helperMaxLines,
    this.onFieldSubmitted,
  })  : assert(helperText == null || helperTextCallback == null),
        super();

  @override
  State<ContraInputText> createState() => _ContraInputTextState();
}

class _ContraInputTextState extends State<ContraInputText> {
  bool showPassword = false;

  late String _value = widget.initialValue ?? '';

  void _handleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  String? _helperText() {
    if (widget.helperTextCallback != null) {
      return widget.helperTextCallback?.call(_value);
    }
    return widget.helperText;
  }

  void _onChanged(String value) {
    widget.onChanged?.call(value);
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
    );

    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      initialValue: widget.initialValue,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      style: textStyle,
      onChanged: _onChanged,
      obscureText: widget.obscureText == true ? !showPassword : false,
      validator: (text) {
        if ((widget.required == true) && (text == null || text.isEmpty)) {
          return 'Can\'t be empty';
        }
        final int length = text != null ? text.length : 0;
        if (widget.minLength != null && length < widget.minLength!) {
          return 'Too short';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        helperText: _helperText(),
        errorStyle: textStyle.copyWith(fontSize: 16),
        hintMaxLines: widget.minLines,
        hintText: widget.placeholder ??
            (widget.obscureText == true
                ? '\u25CF \u25CF \u25CF \u25CF \u25CF \u25CF'
                : null),
        helperMaxLines: widget.helperMaxLines,
        helperStyle: textStyle.copyWith(fontSize: 16),
        hintStyle: textStyle.apply(color: ContraColors.trout),
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
