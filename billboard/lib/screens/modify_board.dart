import 'package:billboard/models/models.dart';
import 'package:billboard/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BoardModify extends StatefulWidget {
 
  final String boardID;
  BoardModify({this.boardID});

  @override
  _BoardModifyState createState() => _BoardModifyState();
}

class _BoardModifyState extends State<BoardModify> {
  bool get isEditing => widget.boardID != null;

  BoardService get boardService => GetIt.I<BoardService>();

  String errorMessage;
  Board board;

  TextEditingController _idController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _sizeController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      boardService.getBoard(widget.boardID)
        .then((response) {
          setState(() {
            _isLoading = false;
          });

          if (response.error) {
            errorMessage = response.errorMessage ?? 'An error occurred';
          }
          board = response.data;
          _idController.text = board.boardID;
          _locationController.text = board.boardLocation;
          _priceController.text = board.boardPrice;
          _sizeController.text = board.boardSize;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Board' : 'Add Board')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                hintText: 'Board ID'
              ),
            ),

            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                hintText: 'Board Location'
              ),
            ),

            Container(height: 8),

            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                hintText: 'Board Price'
              ),
            ),

            TextField(
              controller: _sizeController,
              decoration: InputDecoration(
                hintText: 'Board Size'
              ),
            ),

            Container(height: 16),

            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  if (isEditing) {
                    setState(() {
                      _isLoading = true;
                    });
                    final board = 
                    BoardManipulation(
                      boardID: _idController.text,
                      boardLocation: _locationController.text,
                      boardPrice: _priceController.text,
                      boardSize: _sizeController.text
                    );
                    boardService.updateBoard(widget.boardID, board);
                    
                    setState(() {
                      _isLoading = false;
                    });

                    final title = 'Done';
                    final text = 'Your board was updated';

                     showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text(text),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                    );
                  }
                  
                  else {  
                    setState(() {
                      _isLoading = true;
                    });
                    final board = 
                    BoardManipulation(
                      boardID: _idController.text,
                      boardLocation: _locationController.text,
                      boardPrice: _priceController.text,
                      boardSize: _sizeController.text
                    );
                    boardService.createBoard(board);
                    
                    setState(() {
                      _isLoading = false;
                    });

                    final title = 'Done';
                    final text = 'Your board was added';

                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(title),
                        content: Text(text),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}