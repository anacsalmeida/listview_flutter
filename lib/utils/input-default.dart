import 'package:firebase_listview/utils/text-cadastro.dart';
import 'package:flutter/material.dart';

class InputDefault extends StatefulWidget {

  final Widget input;
  final String nomeInput;

  InputDefault({Key? key, required this.input, required this.nomeInput}) : super(key: key);

  @override
  State<InputDefault> createState() => _InputDefaultState();
}

class _InputDefaultState extends State<InputDefault> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, right: 20, left: 20),
      child: Column(
        children: [
          TextCadastro(text: widget.nomeInput),
          Container(
            margin: const EdgeInsets.only(top:4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 217, 217, 217),
                border: Border.all(width: 3, color: Colors.black,),
                borderRadius: BorderRadius.circular(5), 
              ),
              child: widget.input,
            ),
        ],
      ),
    );
  }
}