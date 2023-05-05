import 'package:flutter/material.dart';

class TextCadastro extends StatefulWidget {
  
  final String text;

  TextCadastro({Key? key, required this.text}) : super(key: key);

  @override
  State<TextCadastro> createState() => _TextCadastroState();
}

class _TextCadastroState extends State<TextCadastro> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text, style: const TextStyle (color: Colors.black, fontSize: 15,  fontWeight: FontWeight.w600),);
  }
}