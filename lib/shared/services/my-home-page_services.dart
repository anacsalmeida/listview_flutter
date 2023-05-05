import 'package:flutter/cupertino.dart';
import '../../pages/my-home/my-home-page_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//acesso ao banco

class MyHomePageService {
  final _filmesFirestore = FirebaseFirestore.instance.collection('filmes');

  createMovie(dynamic movie) async {
    try {
      await _filmesFirestore.doc(movie['titulo']).set({
        'baner': movie['baner'],
        'titulo': movie['titulo'],
        'ano': movie['ano'],
        'descricao': movie['descricao']
      });
    } on FirebaseException catch (error) {
      print(error.message);
    }
  }

  deleteMovie(String idMovie) async {
    await _filmesFirestore.doc(idMovie).delete();
  }
}
