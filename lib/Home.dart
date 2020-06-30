import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          _image == null ? Container() : Image.file(_image)
        ],
      ),
    );
  }
}
