import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePrise extends StatefulWidget {
  const ImagePrise({super.key, required this.onPhotoSelectionne});

  final void Function(File image) onPhotoSelectionne;

  @override
  State<ImagePrise> createState() => _ImagePriseState();
}

class _ImagePriseState extends State<ImagePrise> {
  File? _photoSelectionne;

  Future<void> _prendrePhoto() async {
    final imagePicker = ImagePicker();
    final photoPrise = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (photoPrise == null) {
      return;
    }

    setState(() {
      _photoSelectionne = File(photoPrise.path);
    });

    widget.onPhotoSelectionne(_photoSelectionne!);
  }

  @override
  Widget build(BuildContext context) {
    Widget contenu = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text("Prendre photo"),
      onPressed: _prendrePhoto,
    );

    if (_photoSelectionne != null) {
      contenu = GestureDetector(
        onTap: _prendrePhoto,
        child: Image.file(
          _photoSelectionne!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withValues(),
        ),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: contenu,
    );
  }
}
