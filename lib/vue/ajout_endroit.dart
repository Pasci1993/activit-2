import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/endroits_utilisateurs.dart';
import '../widgets/image_prise.dart';
import 'dart:io';

class AjoutEndroit extends ConsumerStatefulWidget {
  const AjoutEndroit({super.key});

  @override
  ConsumerState<AjoutEndroit> createState() => _AjoutEndroitState();
}

class _AjoutEndroitState extends ConsumerState<AjoutEndroit> {
  final _nomController = TextEditingController();
  File? _imageSelectionnee;

  void _definirImage(File image) {
    _imageSelectionnee = image;
  }

  void _enregistreEndroit() {
    final nomSaisi = _nomController.text;

    if (nomSaisi.isEmpty || _imageSelectionnee == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Veuillez saisir un nom et prendre une photo."),
        ),
      );
      return;
    }

    ref
        .read(endroitsprovider.notifier)
        .ajoutEndroit(nomSaisi, _imageSelectionnee);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajout d'un nouveau endroit"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(labelText: 'Nom'),
              maxLength: 50,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 10),
            ImagePrise(onPhotoSelectionne: _definirImage),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _enregistreEndroit,
              icon: const Icon(Icons.add),
              label: const Text('Ajouter un nouveau endroit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
