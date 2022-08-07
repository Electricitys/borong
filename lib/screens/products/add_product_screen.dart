import 'package:borong/models/settings.dart';
import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/screens/settings/setting_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_date_picker.dart';
import 'package:borong/widgets/contra/contra_image_picker.dart';
import 'package:borong/widgets/contra/contra_input_text.dart';
import 'package:borong/widgets/contra/contra_select.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/settings_list_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static const String routeName = "/add-product-screen";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late List<XFile> _imageList = <XFile>[];

  late SettingsCardDetail detailOne;
  late SettingsCardDetail detailTwo;

  List<SettingsCardItemDetail> detailsOne = <SettingsCardItemDetail>[];
  List<SettingsCardItemDetail> detailsTwo = <SettingsCardItemDetail>[];

  @override
  void initState() {
    super.initState();
    detailsOne.add(SettingsCardItemDetail(
        title: "Name",
        value: "Imanuel Pundoko",
        color: ContraColors.caribbeanGreen,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Fullname",
            onInitState: () {
              fieldFocusNode.requestFocus();
            },
            onDispose: () {
              fieldFocusNode.dispose();
            },
            onSubmit: () async {
              return true;
            },
            child: Column(
              children: [
                ContraInputText(
                  initialValue: "Imanuel Pundoko",
                  focusNode: fieldFocusNode,
                  placeholder: "Fullname",
                ),
              ],
            ),
          );
        }));
    detailsOne.add(SettingsCardItemDetail(
        title: "Birthday",
        value: "May 7, 1999",
        color: ContraColors.pastelPink,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          int currentYear = DateTime.now().year;
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Birthday",
            onInitState: () {
              fieldFocusNode.requestFocus();
            },
            onDispose: () {
              fieldFocusNode.dispose();
            },
            onSubmit: () async {
              return true;
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ContraDatePicker(
                    initialDateTime: DateTime(currentYear - 19),
                    minimumYear: currentYear - 70,
                    maximumYear: currentYear - 18,
                    onDateTimeChanged: (value) {},
                  ),
                )
              ],
            ),
          );
        }));
    detailsOne.add(SettingsCardItemDetail(
        title: "Gender",
        value: "Male",
        color: ContraColors.foam,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          List<SelectOption> genderList = [];
          _showModalSheet(
            title: "Edit Gender",
            onInitState: () {
              fieldFocusNode.requestFocus();
            },
            onDispose: () {
              fieldFocusNode.dispose();
            },
            onSubmit: () async {
              return true;
            },
            child: Column(
              children: [
                ContraSelect(
                  height: 150,
                  options: genderList,
                  onChanged: ((index, selected) {}),
                )
              ],
            ),
          );
        }));

    detailsTwo.add(SettingsCardItemDetail(
        title: "Email",
        value: "ilomon10@gmail.com",
        color: ContraColors.lighteningYellow,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Edit",
            onInitState: () {
              fieldFocusNode.requestFocus();
            },
            onDispose: () {
              fieldFocusNode.dispose();
            },
            onSubmit: () async {
              return true;
            },
            child: Column(
              children: [
                ContraInputText(
                  initialValue: "ilomon10@gmail.com",
                  focusNode: fieldFocusNode,
                  placeholder: "Edit",
                ),
              ],
            ),
          );
        }));
    detailsTwo.add(SettingsCardItemDetail(
        title: "Phone number",
        value: "+62 852-9948-2331",
        color: ContraColors.caribbeanGreen,
        textColor: ContraColors.woodSmoke,
        onTap: () {
          FocusNode fieldFocusNode = FocusNode();
          _showModalSheet(
            title: "Edit Phone Number",
            onInitState: () {
              fieldFocusNode.requestFocus();
            },
            onDispose: () {
              fieldFocusNode.dispose();
            },
            onSubmit: () async {
              return true;
            },
            child: Column(
              children: [
                ContraInputText(
                  initialValue: "+62 852-9948-2331",
                  focusNode: fieldFocusNode,
                  placeholder: "Phone Number",
                ),
              ],
            ),
          );
        }));

    detailOne = SettingsCardDetail(
        title: "Product Information",
        bgColor: CupertinoColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsOne);
    detailTwo = SettingsCardDetail(
        title: "Product Description",
        bgColor: CupertinoColors.white,
        borderColor: ContraColors.woodSmoke,
        items: detailsTwo);
  }

  Future<void> _showModalSheet({
    required Future<bool> Function() onSubmit,
    required Widget child,
    required String title,
    VoidCallback? onInitState,
    VoidCallback? onDispose,
  }) async {
    ContraSheet.showModalSheet(
      context,
      onInitState: onInitState,
      onDispose: onDispose,
      onSubmit: (value) async {},
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
                    await onSubmit();
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
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ButtonRoundWithShadow(
                        size: 48,
                        borderColor: ContraColors.woodSmoke,
                        color: ContraColors.white,
                        callback: () {
                          Navigator.pop(context);
                        },
                        shadowColor: ContraColors.woodSmoke,
                        iconPath: "assets/icons/arrow_back.svg",
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: ContraText(
                      size: 27,
                      alignment: Alignment.bottomCenter,
                      text: "Add Product",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: ContraColors.woodSmoke,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ContraText(
                color: ContraColors.trout,
                text: "Product Photos",
                textAlign: TextAlign.left,
                weight: FontWeight.bold,
                size: 21,
                alignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 127,
              child: ListView.separated(
                reverse: true,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _imageList.length + 1,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (context, index) {
                  if (index > _imageList.length - 1) {
                    return ContraImagePicker(
                      onImageSelected: (file) {
                        setState(() {
                          _imageList.add(file);
                        });
                      },
                    );
                  }
                  return ContraImagePicker(
                    initialValue: _imageList[index],
                    onImageSelected: (file) {
                      setState(() {
                        _imageList[index] = file;
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 16),
              ),
            ),
            const SizedBox(height: 16),
            SettingsListCardItem(
              detail: detailOne,
            ),
            SettingsListCardItem(
              detail: detailTwo,
            ),
          ],
        ),
      ),
    );
  }
}
