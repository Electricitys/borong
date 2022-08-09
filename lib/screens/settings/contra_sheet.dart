import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ContraSheet extends StatefulWidget {
  final Widget child;
  final String title;
  final Widget? action;
  final VoidCallback? onInitState;
  final VoidCallback? onDispose;
  const ContraSheet({
    Key? key,
    required this.child,
    required this.title,
    this.action,
    this.onInitState,
    this.onDispose,
  }) : super(key: key);

  @override
  State<ContraSheet> createState() => _ContraSheetState();

  static Future<void> showModalSheet(
    BuildContext context, {
    required String title,
    Widget? action,
    VoidCallback? onInitState,
    VoidCallback? onDispose,
    required Future<void> Function(dynamic value) onSubmit,
    required Widget child,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ContraSheet(
        onInitState: onInitState,
        onDispose: onDispose,
        title: title,
        action: action,
        child: child,
      ),
    );
  }
}

class _ContraSheetState extends State<ContraSheet> {
  @override
  void initState() {
    super.initState();
    if (widget.onInitState != null) widget.onInitState!();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) widget.onDispose!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardPadding = MediaQuery.of(context).viewInsets.bottom;
    double statusbarPadding = MediaQueryData.fromWindow(window).padding.top;
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: EdgeInsets.only(
          top: statusbarPadding,
          bottom: keyboardPadding,
        ),
        color: const Color.fromRGBO(0, 0, 0, 0.001),
        child: GestureDetector(
          onTap: (() {}),
          child: DraggableScrollableSheet(builder: (_, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                border: Border.all(color: ContraColors.woodSmoke, width: 2),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: ContraColors.woodSmoke, width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, right: 12),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: ContraText(
                              alignment: Alignment.centerLeft,
                              text: widget.title,
                              size: 24,
                            ),
                          ),
                          if (widget.action != null)
                            Flexible(flex: 0, child: widget.action!)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: controller,
                      child: widget.child,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
