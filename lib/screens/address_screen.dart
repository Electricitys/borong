import 'package:borong/screens/order_detail_screen.dart';
import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as developer;

class AddressScreen extends StatefulWidget {
  final String title;
  const AddressScreen({
    super.key,
    this.title = "Shipping",
  });

  static const String routeName = "/address_screen";

  @override
  // ignore: library_private_types_in_public_api
  _AddressScreen createState() => _AddressScreen();
}

class _UserDestination {
  String? alias;
  String? address;
  LatLng? position;
  _UserDestination({
    required this.alias,
    required this.address,
    required this.position,
  });
}

class _AddressScreen extends State<AddressScreen> {
  // ignore: avoid_init_to_null
  late LatLng? _currentPosition = null;
  late bool _isDragging = false;
  late bool _isMapReady = false;
  final _UserDestination _userDestination = _UserDestination(
    alias: null,
    address: null,
    position: null,
  );

  Future<void> _showModalSheetTextEditor() async {
    FocusNode fieldFocusNode = FocusNode();
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    final TextEditingController nameController =
        TextEditingController(text: _userDestination.alias);
    final TextEditingController addressController =
        TextEditingController(text: _userDestination.address);
    ContraSheet.showModalSheet(
      context,
      onInitState: () {
        fieldFocusNode.requestFocus();
      },
      onDispose: () {
        fieldFocusNode.dispose();
      },
      onSubmit: (value) async {},
      title: "Set information",
      action: Row(children: <Widget>[
        ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () async {
                  if (!formState.currentState!.validate()) return;
                  _userDestination.alias = nameController.text;
                  _userDestination.address = addressController.text;
                  setState(() {
                    _userDestination;
                  });
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
      child: Form(
        key: formState,
        child: Column(
          children: <Widget>[
            ContraInputText(
              controller: nameController,
              placeholder: "Name",
              textInputAction: TextInputAction.next,
              focusNode: fieldFocusNode,
            ),
            const SizedBox(height: 12),
            ContraInputText(
              controller: addressController,
              placeholder: "Address",
              maxLines: null,
              keyboardType: TextInputType.multiline,
            )
          ],
        ),
      ),
    );
  }

  void _onMapReady(mapController) async {
    _isMapReady = true;
  }

  void _onMapCameraMove(CameraPosition position) {
    if (_currentPosition == null && _isDragging == true) return;

    setState(() {
      _currentPosition = null;
      _isDragging = true;
    });
  }

  void _onMapCameraIdle(CameraPosition position) {
    setState(() {
      _userDestination.position = position.target;
      _currentPosition = position.target;
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    bool isValid = true;
    if (_userDestination.alias == null ||
        _userDestination.address == null ||
        _userDestination.position == null) {
      isValid = false;
    }
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
                            callback: () async {
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
                text: "Drag pinpoint to change address",
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 12.0),
                  child: Stack(
                    children: [
                      MapWidget(
                        onCameraIdle: _onMapCameraIdle,
                        onCameraMove: _onMapCameraMove,
                        onMapReady: _onMapReady,
                      ),
                      if (_isMapReady)
                        Positioned.fill(
                          child: Center(
                            child: IgnorePointer(
                              child: SizedBox(
                                width: 128,
                                height: 128,
                                child: _Pinpoint(
                                  placed: _isDragging,
                                  color: ContraColors.woodSmoke,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
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
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ContraText(
                                    color: ContraColors.white,
                                    overflow: TextOverflow.fade,
                                    size: 32,
                                    weight: FontWeight.w800,
                                    alignment: Alignment.centerLeft,
                                    text: _userDestination.alias ?? "Unknown",
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ContraText(
                                    color: ContraColors.white,
                                    size: 24,
                                    overflow: TextOverflow.ellipsis,
                                    maxLine: 2,
                                    softWrap: true,
                                    weight: FontWeight.w500,
                                    alignment: Alignment.centerLeft,
                                    text: _userDestination.address ?? "Unknown",
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
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 24),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ContraButtonSolid(
                              subtle: !isValid,
                              text: "Send",
                              onPressed: () {
                                // if (!isValid) return;
                                Navigator.pushNamed(
                                    context, OrderDetailScreen.routeName);
                              },
                              suffixIcon: SvgPicture.asset(
                                "assets/icons/ic_navigation_white.svg",
                                color: ContraColors.white,
                              ),
                            ),
                          ),
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

class _Pinpoint extends StatelessWidget {
  final bool placed;
  final Color color;
  final Duration duration;

  const _Pinpoint({
    this.placed = false,
    // ignore: unused_element
    this.duration = const Duration(milliseconds: 500),
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double size = !placed ? 24 : 16;
    double rippleSize = !placed ? 128 : 24;
    double offset = !placed ? 2 : 0;
    Color accentColor = !placed ? ContraColors.lighteningYellow : color;
    return SizedBox(
      width: 128,
      height: 128,
      child: Center(
        child: AnimatedContainer(
          duration: duration,
          curve: Curves.easeOutExpo,
          height: rippleSize,
          width: rippleSize,
          decoration: BoxDecoration(
            color: color.withOpacity(0.25),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: AnimatedContainer(
              duration: duration,
              curve: Curves.easeOutExpo,
              width: size,
              height: size,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: color,
                    offset: Offset(0, offset),
                  )
                ],
                border: Border.all(
                  color: color,
                  width: 2,
                ),
                color: accentColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
