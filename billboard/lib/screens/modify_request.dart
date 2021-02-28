import 'package:billboard/models/models.dart';
import 'package:billboard/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RequestModify extends StatefulWidget {
 
  final String boardID;
  RequestModify({this.boardID});

  @override
  _RequestModifyState createState() => _RequestModifyState();
}

class _RequestModifyState extends State<RequestModify> {

  bool get isEditing => widget.boardID != null;
  BoardService get boardService => GetIt.I<BoardService>();

  String errorMessage;
  Request request;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      boardService.getRequest(widget.boardID)
      .then((response) {
        setState(() {
          _isLoading = false;
        });

        if (response.error) {
          errorMessage = response.errorMessage ?? 'An error occurred';
        }
        request = response.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Approve Request')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
           
            TextField(
              decoration: InputDecoration(
                hintText: 'Approve Request'
              ),
            ),
            Container(height: 16),

            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text('Approve', style: TextStyle(color: Colors.white)),
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  final request = 
                  RequestManipulation(
                    // boardID: 'board.boardID',
                    // boardLocation: 'board.boardLocation',
                    // boardPrice: 'board.boardPrice',
                    // boardSize: 'board.boardSize',
                    userName: 'User 1',
                    status: "Approved",
                  );
                  boardService.updateRequest(widget.boardID, request);
                  
                  setState(() {
                    _isLoading = false;
                  });

                  final title = 'Done';
                  final text = 'Request was approved';
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}