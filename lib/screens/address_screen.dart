import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/button_solid_with_icon.dart';
import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/map_widget.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  final String title;
  const AddressScreen({
    super.key,
    this.title = "Set Address",
  });

  static String routeName = "/address_screen";

  @override
  // ignore: library_private_types_in_public_api
  _AddressScreen createState() => _AddressScreen();
}

class _AddressScreen extends State<AddressScreen> {
  Future<void> _showModalSheetTextEditor() async {
    FocusNode fieldFocusNode = FocusNode();
    ContraSheet.showModalSheet(
      context,
      onInitState: () {
        fieldFocusNode.requestFocus();
      },
      onDispose: () {
        fieldFocusNode.dispose();
      },
      onSubmit: () async {},
      title: "Set information",
      action: Row(children: <Widget>[
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () async {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                      content: Text("Sending..."),
                      behavior: SnackBarBehavior.floating,
                    ));
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  try {
                    if (!mounted) return;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text("Changed"),
                        behavior: SnackBarBehavior.floating,
                      ));
                    return;
                  } catch (err) {
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(const SnackBar(
                        content: Text("Error"),
                        behavior: SnackBarBehavior.floating,
                      ));
                  }
                },
                color: ContraColors.persianBlue,
                icon: const Icon(
                  Icons.check,
                )),
          ),
        )
      ]),
      child: Column(
        children: <Widget>[
          ContraInputText(
            placeholder: "Name",
            textInputAction: TextInputAction.next,
            focusNode: fieldFocusNode,
          ),
          const SizedBox(height: 12),
          const ContraInputText(
            placeholder: "Address",
            maxLines: null,
            keyboardType: TextInputType.multiline,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ContraColors.persianBlue,
      appBar: CustomAppBar(
        height: kToolbarHeight + statusBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: ButtonRoundWithShadow(
                            size: 48,
                            borderColor: ContraColors.lighteningYellow,
                            color: ContraColors.lighteningYellow,
                            callback: () {
                              Navigator.pop(context);
                            },
                            shadowColor: ContraColors.woodSmoke,
                            iconPath: "assets/icons/arrow_back_white.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ContraText(
                      size: 27,
                      color: ContraColors.white,
                      alignment: Alignment.center,
                      text: widget.title,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 12),
              const ContraText(
                color: ContraColors.white,
                size: 16,
                overflow: TextOverflow.ellipsis,
                maxLine: 2,
                softWrap: true,
                weight: FontWeight.w500,
                alignment: Alignment.center,
                text: "Drag pinpoint",
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  child: const MapWidget(
                    distance: "2.5",
                    isDetail: false,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: ContraText(
                                    color: ContraColors.white,
                                    overflow: TextOverflow.fade,
                                    size: 32,
                                    weight: FontWeight.w800,
                                    alignment: Alignment.centerLeft,
                                    text: "Imanuel Pundoko",
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: ContraText(
                                    color: ContraColors.white,
                                    size: 24,
                                    overflow: TextOverflow.ellipsis,
                                    maxLine: 2,
                                    softWrap: true,
                                    weight: FontWeight.w500,
                                    alignment: Alignment.centerLeft,
                                    text:
                                        "Desa Sea, Jaga 3, Kec. Pineleng, Kab. Minahasa",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  _showModalSheetTextEditor();
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: ContraColors.white,
                                )),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: ButtonPlainWithIcon(
                          text: "Send",
                          color: ContraColors.woodSmoke,
                          callback: () {},
                          size: 48,
                          isPrefix: false,
                          isSuffix: true,
                          textColor: ContraColors.white,
                          iconPath: "assets/icons/ic_navigation_white.svg",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
