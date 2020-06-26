import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Salva no Banco de dados
  Firestore.instance
      .collection("usuarios")
      .document("pontuacao")
      .setData({"Deyvisson": "10", "Eduardo": "9"});

  runApp(AppFirebase());
}

class AppFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
