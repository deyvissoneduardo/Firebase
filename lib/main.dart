import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pesquisa = "edu";
  Firestore banco = Firestore.instance; // recupera a instancia do firebase
  /*
   // Salva no Banco de dados Para atualizar manten o document
  banco.collection("usuarios")
      .document("002")
      .setData(
      {
        "nome": "Kelia Maiane",
        "idade": "22"
      });
  // ---------------------------------------------------------------------//

   //Salva no Banco de dados com identificado geradd pelo firebase
  DocumentReference ref =  await banco.collection("noticias")
      .add(
      {
        "title": "Novo Planeta Descorberto",
        "descricao": "texto do Campeão da America"
      });
  print("salvos: " + ref.documentID);
  // ---------------------------------------------------------------------//
   // Deleta usuario
   banco.collection("usuarios").document("003").delete();
  // ---------------------------------------------------------------------//
   //Recuperando um unico por id
  DocumentSnapshot snapshot = await banco.collection("usuarios")
  .document("002")
  .get();
  var dados = snapshot.data;
  print("Dados recuperados, Nome: " + dados['nome'] + ' idade: ' + dados["idade"]);
  */
  // ---------------------------------------------------------------------//
  /* QuerySnapshot snapshot = await banco.collection("usuarios")
  .getDocuments();
  // listando todos usuarios
  for ( DocumentSnapshot item in snapshot.documents ){
    var dados = item.data;
    print( "dados usuarios: " + dados.toString());
  }
  // ---------------------------------------------------------------------//

  // Notifica sempre que houver alteração na colecao

  banco.collection("usuarios").snapshots().listen((snapshots) {
    for (DocumentSnapshot item in snapshots.documents) {
      var dados = item.data;
      print("dados usuarios: " + dados.toString());
    }
  });
  // Apliancando filtros
  QuerySnapshot querySnapshot = await banco
      .collection("usuarios")
      // .where("nome", isEqualTo: "deyvisson")
      //.where("idade", isEqualTo: 22)
      //.where("idade", isGreaterThan: 20) // maior que
      //.where("idade", isLessThan: 35) // menor que
      // .orderBy("idade", descending: true)
      //.orderBy("nome", descending: false)
      //.limit(2)

      .where("nome", isGreaterThanOrEqualTo: pesquisa)
      .where("nome", isLessThanOrEqualTo: pesquisa + "\uf8ff")
      .getDocuments();

  for (DocumentSnapshot item in querySnapshot.documents) {
    var dados = item.data;
    print("dados usuarios: " + dados.toString());
  }
  // ---------------------------------------------------------------------//
  // Cria usuario
  FirebaseAuth auth = FirebaseAuth.instance;

  // Criando um usuario com email e senha
  String email = 'teste@gmail.com';
  String senha = '123456';

  auth.createUserWithEmailAndPassword(email: email, password: senha)
  .then((firebaseUser) {
    print('Cadastrado com email ' + firebaseUser.email);
  }).catchError((error) {
    print('Error ao cadastra ' + error.toString());
  });
   */
  // ---------------------------------------------------------------------//
  // Autentica usuario
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = 'teste@gmail.com';
  String senha = '123456';
  FirebaseUser user = await auth.currentUser();
  if (user != null ){
    // logado
    print('usuario logado com email: ' + user.email);
  }else {
    print('usuario nao logado');
  }
  runApp(AppFirebase());
}

class AppFirebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
