import 'package:flutter/material.dart';

Future<Widget> buildPageAsync(
  BuildContext context,
  Widget Function(BuildContext) builder,
) async {
  return Future.microtask(() => builder(context));
}
