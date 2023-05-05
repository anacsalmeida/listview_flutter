import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_listview/utils/colors.dart';
import 'package:firebase_listview/utils/input-default.dart';
import 'package:firebase_listview/utils/text-card.dart';
import 'package:flutter/material.dart';
import '../../pages/my-home/my-home-page_controller.dart';
import 'package:firestore_search/firestore_search.dart';

class CadastroMovie extends StatefulWidget {
  CadastroMovie({Key? key}) : super(key: key);

  @override
  State<CadastroMovie> createState() => _CadastroMovieState();
}

class _CadastroMovieState extends State<CadastroMovie> {
  final _formKey = GlobalKey<FormState>();
  final _controllerHome = MyHomePageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorSecond,
          title: const Text('Cadastro'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _controllerHome.createMovie();
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  InputDefault(
                      input: TextFormField(
                        controller: _controllerHome.controllerTitulo,
                        autofocus: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite um URL válido!";
                          }
                          return null;
                        },
                      ),
                      nomeInput: 'Titulo Original:'),
                  InputDefault(
                    input: TextFormField(
                      controller: _controllerHome.controllerBaner,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Digite um titulo valido!";
                        }
                        return null;
                      },
                    ),
                    nomeInput: 'Url do Banner: ',
                  ),
                  InputDefault(
                    input: TextFormField(
                      controller: _controllerHome.controllerAno,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Digite um ano valido!";
                        }
                        return null;
                      },
                    ),
                    nomeInput: 'Ano lançamento:',
                  ),
                  InputDefault(
                    input: TextFormField(
                      controller: _controllerHome.controllerDescricao,
                      maxLength: 500,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Informe a descrição!";
                        }
                        return null;
                      },
                    ),
                    nomeInput: 'Descrição:',
                  ),
                  
                ],
              ),
            ),
          ),
        ));
  }
}
