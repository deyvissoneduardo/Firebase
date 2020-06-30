import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _image; // retorno do metodo
  File _imageSelected; // recupera a imagem selecionada

  /* metodo para recupera imagem */
  Future _recoverImage(bool isCamera) async {
    if (isCamera) {
      _imageSelected = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      _imageSelected = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = _imageSelected;
    });
  }

  /* metodo que faz o upload e cria pasta no firebase*/
  Future _uploadImage() async {

    // Referencia arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    StorageReference pastaRaiz = storage.ref();
    StorageReference articles = pastaRaiz
        .child("photos")
        .child("photo1.jpg");

    //Faz upload da imagem
    articles.putFile(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar Imagem"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Camera"),
            onPressed: () {
              _recoverImage(true);
            },
          ),
          RaisedButton(
              child: Text("Galeria"),
              onPressed: () {
                _recoverImage(false);
              }),
          _image == null ? Container() : Image.file(_image),
          RaisedButton(
              child: Text("Upload da Imagem"),
              onPressed: () {
                _uploadImage();
              }),
        ],
      ),
    );
  }
}
