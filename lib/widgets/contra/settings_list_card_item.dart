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
            color: ContraColors.trout,
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
            decoration: ShapeDecoration(
                color: detail.bgColor,
                shadows: const [BoxShadow(offset: Offset(0, 4))],
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: detail.borderColor, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)))),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: detail.items.length,
              itemBuilder: (BuildContext context, int index) {
                SettingsCardItemDetail item = detail.items[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (() => {if (item.onTap != null) item.onTap!()}),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Container(
                              decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  color: detail.borderColor),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: ShapeDecoration(
                                      shape: const CircleBorder(),
                                      color: item.color),
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                ContraText(
                                  overflow: TextOverflow.ellipsis,
                                  text: detail.items[index].title,
                                  textAlign: TextAlign.left,
                                  weight: FontWeight.w800,
                                  size: 17,
                                  alignment: Alignment.centerLeft,
                                  color: ContraColors.woodSmoke,
                                ),
                                if (item.value != null)
                                  ContraText(
                                    overflow: TextOverflow.ellipsis,
                                    text: detail.items[index].value!,
                                    textAlign: TextAlign.left,
                                    weight: FontWeight.w700,
                                    size: 17,
                                    alignment: Alignment.centerLeft,
                                    color: ContraColors.trout,
                                  ),
                              ],
                            ),
                          ),
                          // ignore: unnecessary_null_comparison
                          if (item.onTap != null)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: ContraColors.woodSmoke,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
