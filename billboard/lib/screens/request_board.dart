import 'package:billboard/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BoardRequest extends StatelessWidget {
  BoardService get boardService => GetIt.I<BoardService>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Conformation'),
      content: Text('Are you sure you want to Request this board?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}