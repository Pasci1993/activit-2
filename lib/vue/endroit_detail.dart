import 'package:flutter/material.dart';
import '../modele/endroit.dart';

class EndroitDetail extends StatelessWidget {
  const EndroitDetail({super.key, required this.endroit});

  final Endroit endroit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(endroit.nom)),
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.file(
              endroit.image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Text(
              endroit.nom,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
