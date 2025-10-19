import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/endroits_utilisateurs.dart';
import '../widgets/endroits_list.dart';
import 'ajout_endroit.dart';

// Doit être un ConsumerWidget pour utiliser Riverpod
class EndroitsInterface extends ConsumerWidget {
  const EndroitsInterface({super.key});

  void _ajouterEndroit(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const AjoutEndroit()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final endroitsUtilisateurs = ref.watch(endroitsprovider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes endroits préférés"),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _ajouterEndroit(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EndroitsList(endroits: endroitsUtilisateurs),
      ),
    );
  }
}
