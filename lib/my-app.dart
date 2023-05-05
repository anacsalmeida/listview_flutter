import 'package:firebase_listview/pages/my-home/my-home-page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OT Movies',
      home: MyHomePage(title: 'Old Trash Movies'),
    );
  }
}