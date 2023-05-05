import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_listview/utils/colors.dart';
import 'package:firebase_listview/utils/text-card.dart';
import 'package:flutter/material.dart';

import '../pages/my-home/my-home-page_controller.dart';

// ignore: must_be_immutable
class CardMovie extends StatefulWidget {
  CardMovie(
      {Key? key,
      required this.titulo,
      required this.baner,
      required this.ano,
      required this.descricao,
      required this.size})
      : super(key: key);
  final String titulo;
  final String baner;
  final String ano;
  final String descricao;

  Size size;

  @override
  State<CardMovie> createState() => _CardMovieState();
}

class _CardMovieState extends State<CardMovie> {
  Color colorText = Colors.white;
  final _controllerHome = MyHomePageController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.size.height * 0.014,
            right: widget.size.width * 0.05,
            left: widget.size.width * 0.05,
            bottom: widget.size.height * 0.014),
        child: Container(
          padding: EdgeInsets.only(
              top: widget.size.height * 0.0035,
              bottom: widget.size.height * 0.0035),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: colorDefaultWhite,
            ),
            color: const Color.fromARGB(255, 133, 20, 20),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 34, 34, 34).withOpacity(0.5),
                spreadRadius: widget.size.width * 0.015,
                blurRadius: widget.size.width * 0.02,
                offset: Offset(widget.size.width * 0.025,
                    widget.size.height * 0.013), // changes position of shadow
              ),
            ],
          ),
          child: ExpansionTile(
            title: TextCard(text: widget.titulo),
            iconColor: colorText,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: widget.size.width * 0.03,
                        bottom: widget.size.height * 0.014,
                        right: widget.size.width * 0.04),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.size.width * 0.015),
                      ),
                      height: widget.size.height * 0.1,
                      width: widget.size.width * 0.15,
                      child: CachedNetworkImage(
                        imageUrl: widget.baner,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    strokeWidth: 10.0),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextCard(text: widget.ano),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 3, bottom: 10, left: 0, right: 10),
                          child: TextCard(text: widget.descricao),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        {_controllerHome.deleteMovie(widget.titulo)},
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: colorBackground,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
