import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final List<String> list;

  const CustomListItem({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                Text(
                  list[index],
                  style: const TextStyle(color: Colors.white, fontSize: 21),
                )
              ],
            ),
          );
        });
  }
}
