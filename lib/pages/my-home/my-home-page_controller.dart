import 'package:flutter/cupertino.dart';
import '../../shared/services/my-home-page_services.dart';

//objetos do banco
class MyHomePageController {
  final _serviceHome = MyHomePageService();
  final controllerBaner = TextEditingController();
  final controllerTitulo = TextEditingController();
  final controllerAno = TextEditingController();
  final controllerDescricao = TextEditingController();

  createMovie() async {
    await _serviceHome.createMovie({
      'baner': controllerBaner.text,
      'titulo': controllerTitulo.text,
      'ano': controllerAno.text,
      'descricao': controllerDescricao.text
    });
  }

  deleteMovie(String idMovie) async {
    await _serviceHome.deleteMovie(idMovie);
  }
}
