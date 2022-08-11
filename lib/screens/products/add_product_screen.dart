import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/utilities/currency_formatter.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_image_picker.dart';
import 'package:borong/widgets/contra/contra_list_card.dart';
import 'package:borong/widgets/contra/contra_select.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/contra_toast_screen.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/settings_list_card_item_input_select.dart';
import 'package:borong/widgets/contra/settings_list_card_item_input_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static const String routeName = "/add-product-screen";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late final List<XFile> _imageList = <XFile>[];

  late bool isSubmitting = false;

  late List<SelectOption<String>> category = <SelectOption<String>>[
    SelectOption(label: "Category 1", value: "1"),
    SelectOption(label: "Category 2", value: "2"),
    SelectOption(label: "Category 3", value: "3"),
    SelectOption(label: "Category 4", value: "4"),
    SelectOption(label: "Category 5", value: "5"),
  ];

  @override
  void initState() {
    super.initState();
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
      title: title,
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

  void _onSubmit(context) {
    setState(() {
      isSubmitting = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      ContraToastScreen.pushToastScreen(
        context,
        title: "Complete",
        type: ContraToastType.success,
        subtitle: 'Product has been published',
        onDismiss: () {
          Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
        },
      );
    });
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
                  const SizedBox(width: 36),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ContraText(
                color: ContraColors.trout,
                text: "Product Photos (${_imageList.length}/5)",
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
                itemCount: _imageList.length < 5
                    ? _imageList.length + 1
                    : _imageList.length,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemBuilder: (context, index) {
                  if (_imageList.length < 5 && index > _imageList.length - 1) {
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
            ContraListCard(
              title: "Product Information",
              child: Column(
                children: <Widget>[
                  SettingsListCardItemInputText(
                      title: "Name",
                      sheetTitle: "Edit Name",
                      initialValue: "...",
                      onChanged: ((value) {})),
                  SettingsListCardItemInputTextSelect<String>(
                      title: "Category",
                      initialValue: category[2],
                      options: category,
                      onChanged: ((index, value) {})),
                  SettingsListCardItemInputText(
                      title: "Price",
                      keyboardType: TextInputType.number,
                      helperTextCallback: (value) =>
                          CurrencyFormatter.format(value),
                      sheetTitle: "Edit Price",
                      initialValue: "0",
                      valueFormatter: (value) =>
                          CurrencyFormatter.format(value),
                      onChanged: ((value) {})),
                  SettingsListCardItemInputText(
                      title: "Stock",
                      keyboardType: TextInputType.number,
                      sheetTitle: "Edit Stock",
                      initialValue: "1",
                      onChanged: ((value) {})),
                ],
              ),
            ),
            ContraListCard(
              title: "Product Detail",
              child: Column(
                children: <Widget>[
                  SettingsListCardItemInputTextSelect<bool>(
                      title: "Condition",
                      initialValue: SelectOption(label: "New", value: true),
                      options: [
                        SelectOption(label: "New", value: true),
                        SelectOption(label: "Second", value: false),
                      ],
                      onChanged: ((index, value) {})),
                  SettingsListCardItemInputText(
                      title: "Description",
                      sheetTitle: "Edit Description",
                      valueFormatter: ((value) =>
                          value.isEmpty ? "..." : value),
                      onChanged: ((value) {}),
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.multiline,
                      placeholder:
                          "Sepatu Sneakers Pria Tokostore Kanvas Hitam Seri C28B\n-Model simple\n-Nyaman Digunakan\n-Tersedia warna hitam\n\nBahan:\nUpper: Polyester,\nLower: Polyester\nUkuran: 36",
                      maxLines: null,
                      minLines: 10,
                      maxLength: 512),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: ContraButtonSolid(
                  isLoading: isSubmitting,
                  isDisabled: isSubmitting,
                  text: "Publish",
                  onPressed: (() => _onSubmit(context))),
            ),
            const SizedBox(height: 24.0)
          ],
        ),
      ),
    );
  }
}
