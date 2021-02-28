import 'package:billboard/screens/screens.dart';
import 'package:billboard/models/models.dart';
import 'package:billboard/services/services.dart';
import 'package:billboard/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class OwnerPage extends StatefulWidget{
  @override
  _OwnerState createState() => _OwnerState();
}

class _OwnerState extends State<OwnerPage> {
  
  BoardService get service => GetIt.I<BoardService>();
  APIResponse<List<BoardsForListing>> _apiResponse;
 
  bool _isLoading = false;

  @override
  void initState() {
    _fetchBoards();
    super.initState();
  }

  _fetchBoards() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getBoardsList();

    setState(() {
      _isLoading = false;
    });
  }

@override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("Owner Page"),
      ),
      //add board
      floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => BoardModify()))
          .then((_) {_fetchBoards();});
      },
      tooltip: 'Add Board',
      child: Icon(Icons.add),
      ), 
      
      body:BlocBuilder(
        builder: (_, state) {
          if (state is BillboardFailure) {
            return Text('Could not do billboard operation');
          }
          if (state is BillboardLoadSuccess) {

            final billboards = state.billboards;
 return ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green[500]),
          itemBuilder: (_, index) {

          return Dismissible(
            key: ValueKey(_apiResponse.data[index].boardID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
            },
            confirmDismiss: (direction) async {
              final result = await showDialog (
                context: context,
                builder: (_) => BoardDelete()
              );
              
              // delete board
              if (result) {
                final deleteResult = await service.deleteBoard(_apiResponse.data[index].boardID);
                
              showDialog(
                context: context, builder: (_) => AlertDialog(
                  title: Text('Done'),
                  content: Text('The board was deleted successfully'),
                  actions: <Widget>[
                    FlatButton(child: Text('Ok'), onPressed: () {
                      Navigator.of(context).pop(_fetchBoards());
                    })
                  ],
                ));

                return deleteResult?.data ?? false;
              }
              print(result);
              return result;
            },

            // add / update board
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(
              title: Text(
                '${billboards[index].boardLocation}',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('${billboards[index].boardPrice}' + " - " + '${billboards[index].boardSize}'),

              onTap: () {
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => BoardModify(boardID: '${billboards[index].boardID}')))
                  .then((_) {_fetchBoards();});
                },
              ),
            );
          },
          itemCount: billboards.length,
         );
            }
         return CircularProgressIndicator();
        }
        )
          
      );
    
  }
}






// import 'package:billboard/models/models.dart';
// import 'package:billboard/screens/screens.dart';
// import 'package:billboard/services/services.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// class OwnerPage extends StatefulWidget{
//   @override
//   _OwnerState createState() => _OwnerState();
// }

// class _OwnerState extends State<OwnerPage> {
  
//   BoardService get service => GetIt.I<BoardService>();
//   APIResponse<List<BoardsForListing>> _apiResponse;
 
//   bool _isLoading = false;

//   @override
//   void initState() {
//     _fetchBoards();
//     super.initState();
//   }

//   _fetchBoards() async {
//     setState(() {
//       _isLoading = true;
//     });

//     _apiResponse = await service.getBoardsList();

//     setState(() {
//       _isLoading = false;
//     });
//   }

// @override
//   Widget build(BuildContext context) {

//     return new Scaffold(
//       appBar: AppBar(
//         title: Text("Billboard Management"),
//       ),
//       //add board
//       floatingActionButton: FloatingActionButton(
//       onPressed: (){
//         Navigator.of(context)
//           .push(MaterialPageRoute(builder: (_) => BoardModify()))
//           .then((_) {_fetchBoards();});
//       },
//       tooltip: 'Add Board',
//       child: Icon(Icons.add),
//       ), 
      
//       body:Builder(
//           builder: (_) {
//             if (_isLoading) {
//               return Center(child: CircularProgressIndicator());
//             }

//             if (_apiResponse.error) {
//               return Center(child: Text(_apiResponse.errorMessage));
//             }
//           return ListView.separated(
//           separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green[500]),
//           itemBuilder: (_, index) {

//           return Dismissible(
//             key: ValueKey(_apiResponse.data[index].boardID),
//             direction: DismissDirection.startToEnd,
//             onDismissed: (direction) {
//             },
//             confirmDismiss: (direction) async {
//               final result = await showDialog (
//                 context: context,
//                 builder: (_) => BoardDelete()
//               );
              
//               // delete board
//               if (result) {
//                 final deleteResult = await service.deleteBoard(_apiResponse.data[index].boardID);
                
//               showDialog(
//                 context: context, builder: (_) => AlertDialog(
//                   title: Text('Done'),
//                   content: Text('The board was deleted successfully'),
//                   actions: <Widget>[
//                     FlatButton(child: Text('Ok'), onPressed: () {
//                       Navigator.of(context).pop(_fetchBoards());
//                     })
//                   ],
//                 ));

//                 return deleteResult?.data ?? false;
//               }
//               print(result);
//               return result;
//             },

//             // add / update board
//             background: Container(
//               color: Colors.red,
//               padding: EdgeInsets.only(left: 16),
//               child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
//             ),
//             child: ListTile(
//               title: Text(
//                 _apiResponse.data[index].boardLocation,
//                 style: TextStyle(color: Theme.of(context).primaryColor),
//               ),
//               subtitle: Text(_apiResponse.data[index].boardPrice + " - " + _apiResponse.data[index].boardSize),

//               onTap: () {
//                 Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => BoardModify(boardID: _apiResponse.data[index].boardID)))
//                   .then((_) {_fetchBoards();});
//                 },
//               ),
//             );
//           },
//           itemCount: _apiResponse.data.length,
//          );
//         },
//       ),
//     );
//   }
// }
