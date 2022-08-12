import 'dart:io';

import 'package:borong/screens/settings/contra_sheet.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContraImagePicker extends StatefulWidget {
  final XFile? initialValue;
  final Function(XFile) onImageSelected;
  const ContraImagePicker({
    super.key,
    this.initialValue,
    required this.onImageSelected,
  });

  @override
  State<ContraImagePicker> createState() => _ContraImagePickerState();
}

class _ContraImagePickerState extends State<ContraImagePicker> {
  XFile? _imageFile;
  void _setImageFileListFromFile(XFile? value) {
    _imageFile = value;
  }

  dynamic _pickImageError;
  String? _retrieveDataError;

  final List<AvailableSource> _availabelSource = [
    AvailableSource(
      label: "Camera",
      type: ImageSource.camera,
      icon: Icons.camera_alt,
    ),
    AvailableSource(
      label: "Gallery",
      type: ImageSource.gallery,
      icon: Icons.photo_library,
    ),
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _setImageFileListFromFile(widget.initialValue);
    }
  }

  Future<void> _onPressed(BuildContext? context) async {
    await _displayPickImageDialog(context!, (ImageSource source) async {
      try {
        final XFile? pickedFile = await _picker.pickImage(source: source);
        setState(() {
          _setImageFileListFromFile(pickedFile);
          if (pickedFile != null) {
            widget.onImageSelected(pickedFile);
          }
        });
      } catch (e) {
        setState(() {
          _pickImageError = e;
        });
      }
    });
  }

  Widget _previewImage() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      return Semantics(
        label: 'image_picker_example_picked_images',
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.file(File(_imageFile!.path)),
        ),
      );
    } else if (_pickImageError != null) {
      return const Icon(
        Icons.broken_image,
        size: 36,
      );
    } else {
      return const Icon(
        Icons.add,
        size: 36,
      );
    }
  }

  Widget _handlePreview() {
    return _previewImage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPressed(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.grey.shade300,
              Colors.grey.shade200,
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.0),
          child: SizedBox(
            height: 127,
            width: 127,
            child: _handlePreview(),
          ),
        ),
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return ContraSheet.showModalSheet(
      context,
      title: 'Choose an image',
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
                    // await onSubmit();
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
        children: [
          if (_imageFile != null) Image.file(File(_imageFile!.path)),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: Row(
              children: _availabelSource
                  .map((source) => Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: (() {
                            onPick(source.type);
                            Navigator.pop(context);
                          }),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.grey.shade300,
                                  Colors.grey.shade200,
                                ],
                              ),
                            ),
                            child: SizedBox(
                              height: 76,
                              width: 76,
                              child: Icon(
                                source.icon,
                                size: 36,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(ImageSource source);

class AvailableSource {
  final String label;
  final ImageSource type;
  final IconData icon;

  AvailableSource({
    required this.label,
    required this.type,
    required this.icon,
  });
}
