import 'package:borong/models/settings.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:flutter/material.dart';

class SettingsListCardItem extends StatelessWidget {
  final SettingsCardDetail detail;

  const SettingsListCardItem({Key? key, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          ContraText(
            color: trout,
            text: detail.title,
            textAlign: TextAlign.left,
            weight: FontWeight.bold,
            size: 21,
            alignment: Alignment.centerLeft,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            // height: 220,
            decoration: ShapeDecoration(
                color: detail.bgColor,
                shadows: const [BoxShadow(offset: Offset(0, 4))],
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: detail.borderColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)))),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: ShapeDecoration(
                              shape: const CircleBorder(),
                              color: detail.borderColor),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: const ShapeDecoration(
                                  shape: CircleBorder(),
                                  color: lightening_yellow),
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ContraText(
                          text: detail.items[index].title,
                          textAlign: TextAlign.left,
                          weight: FontWeight.w800,
                          size: 17,
                          alignment: Alignment.centerLeft,
                          color: wood_smoke,
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: wood_smoke,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: detail.items.length,
            ),
          )
        ],
      ),
    );
  }
}
