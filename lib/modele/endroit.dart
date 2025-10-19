import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Endroit {
  Endroit({required this.nom, this.image}) : id = uuid.v4();

  final String id;
  final String nom;
  final File? image;
}
