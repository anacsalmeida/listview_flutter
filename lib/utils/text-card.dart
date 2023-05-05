import 'package:flutter/material.dart';

class TextCard extends StatefulWidget {
  final String text;

  TextCard({Key? key, required this.text}) : super(key: key);

  @override
  State<TextCard> createState() => _TextCardState();
}

class _TextCardState extends State<TextCard> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: const TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500));
  }
}
