import 'package:flutter_riverpod/legacy.dart';
import '../modele/endroit.dart';
import 'dart:io';

class EndroitsUtilisateursNotifier extends StateNotifier<List<Endroit>> {
  EndroitsUtilisateursNotifier() : super(const []);

  void ajoutEndroit(String nom, File? image) {
    final nouvelEndroit = Endroit(nom: nom, image: image);
    state = [...state, nouvelEndroit];
  }
}

final endroitsprovider =
    StateNotifierProvider<EndroitsUtilisateursNotifier, List<Endroit>>(
      (ref) => EndroitsUtilisateursNotifier(),
    );
