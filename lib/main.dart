import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore banco = Firestore.instance; // recupera a instancia do firebase
  /*
   *Salva no Banco de dados
   * Para atualizar manten o document
   *
  banco.collection("usuarios")
      .document("002")
      .setData(
      {
        "nome": "Kelia Maiane",
        "idade": "22"
      });
      */
  // ---------------------------------------------------------------------//
  /*
   *Salva no Banco de dados
   * com identificado geradd pelo firebase
   */
  DocumentReference ref =  await banco.collection("noticias")
      .add(
      {
        "title": "Novo Planeta Descorberto",
        "descricao": "texto do Campeão da America"
      });
  print("salvos: " + ref.documentID);
  runApp(AppFirebase());
}

class AppFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
