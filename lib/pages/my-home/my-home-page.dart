import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_listview/pages/cadastro-movie/cadastro-movie.dart';
import 'package:firebase_listview/utils/card-movie.dart';
import 'package:firebase_listview/utils/colors.dart';
import 'package:flutter/material.dart';

import 'my-home-page_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon customIcon = const Icon(Icons.search);
  final stream = FirebaseFirestore.instance.collection('filmes').snapshots();
  final _controllerHome = MyHomePageController();
  Widget customSearchBar = const Text('Old Trash Movies');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        centerTitle: true,
        title: customSearchBar,
        backgroundColor: colorSecond,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(
                Icons.login_sharp,
                color: colorDefaultWhite,
              ),
              onPressed: null,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05, top: size.height * .02),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.info,
                    color: colorDefaultWhite,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.015),
                    child: const Text(
                      'Clique nos Cards para ter mais detalhes',
                      style: TextStyle(fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                    stream: stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return CardMovie(
                              titulo: data['titulo'],
                              baner: data['baner'],
                              ano: data['ano'],
                              descricao: data['descricao'],
                              size: size);
                        },
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorSecond,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => CadastroMovie()));
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
