import 'package:borong/screens/products/product_list_variant_form.dart';
import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/utilities/currency_formatter.dart';
import 'package:borong/widgets/contra/button_round_with_shadow.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_divider.dart';
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

  late String _name;
  late String _category;
  late bool _condition;
  late String _description;

  late List<ProductVariant> _productVariants = <ProductVariant>[];

  late bool isSubmitting = false;

  late bool isValid = false;

  late List<SelectOption<String>> category = <SelectOption<String>>[
    SelectOption(label: "Category 1", value: "1"),
    SelectOption(label: "Category 2", value: "2"),
    SelectOption(label: "Category 3", value: "3"),
    SelectOption(label: "Category 4", value: "4"),
    SelectOption(label: "Category 5", value: "5"),
  ];

  _validate() {
    if (_imageList.isEmpty) {
      return false;
    }
    if (_name.isEmpty || _name.length < 3) {
      return false;
    }
    if (_description.isEmpty || _description.length < 3) {
      return false;
    }
    if (_productVariants.isEmpty) {
      return false;
    }
    return true;
  }

  _handleChange() {
    setState(() {
      isValid = _validate();
    });
  }

  @override
  void initState() {
    super.initState();

    _productVariants.add(ProductVariant(
      name: "Default",
      price: 0,
      stock: 0,
    ));
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
      backgroundColor: ContraColors.bareleyWhite,
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
                  return Stack(
                    children: <Widget>[
                      ContraImagePicker(
                        initialValue: _imageList[index],
                        onImageSelected: (file) {
                          setState(() {
                            _imageList[index] = file;
                          });
                        },
                      ),
                      Positioned(
                        top: -8,
                        right: -8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _imageList.removeAt(index);
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                                color: ContraColors.bareleyWhite,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(18))),
                            child: const Icon(
                              Icons.close,
                              color: ContraColors.flamingo,
                            ),
                          ),
                        ),
                      )
                    ],
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
                      onChanged: ((value) {
                        _name = value;
                        _handleChange();
                      })),
                  SettingsListCardItemInputTextSelect<String>(
                      title: "Category",
                      initialValue: category[2],
                      options: category,
                      onChanged: ((index, value) {
                        _category = value.value;
                        _handleChange();
                      })),
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
                      onChanged: ((index, value) {
                        _condition = value.value;
                        _handleChange();
                      })),
                  SettingsListCardItemInputText(
                      title: "Description",
                      sheetTitle: "Edit Description",
                      valueFormatter: ((value) =>
                          value.isEmpty ? "..." : value),
                      onChanged: ((value) {
                        _description = value;
                        _handleChange();
                      }),
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
            ProductListVariantForm(
              productVariants: _productVariants,
              onChange: (List<ProductVariant> productVariants) {
                _productVariants = productVariants;
              },
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: ContraButtonSolid(
                  isLoading: isSubmitting,
                  isDisabled: !isValid || isSubmitting,
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
