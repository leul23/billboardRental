import 'package:billboard/models/models.dart';
import 'package:billboard/screens/screens.dart';
import 'package:billboard/services/services.dart';
import 'package:billboard/bloc/blocs.dart';
import 'package:billboard/states/states.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowsePage extends StatefulWidget{
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<BrowsePage> {
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
        title: Text("Billboard Listings"),
      ),
      body:BlocBuilder<BillboardBloc, BillboardState>(
          builder: (_, state) {
            if (state is BillboardFailure) {
            return Text('Could not do billboard operation');
          }
          if (state is BillboardLoadSuccess) {

            final billboards = state.billboards;

          return ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {

          return Dismissible(
            key: ValueKey(_apiResponse.data[index].boardID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
            },
            confirmDismiss: (direction) async {
              final result = await showDialog (
                context: context,
                builder: (_) => BoardRequest()
              );
              
              // delete board
              if (result) {
               final request = 
                  RequestManipulation(
                    boardID: _apiResponse.data[index].boardID,
                    boardLocation:  _apiResponse.data[index].boardLocation,
                    boardPrice:  _apiResponse.data[index].boardPrice,
                    boardSize:  _apiResponse.data[index].boardSize,
                    userName: "leul",
                    status: "pending",
                  );
                  service.createRequest(request);

              showDialog(
                context: context, builder: (_) => AlertDialog(
                  title: Text('Done'),
                  content: Text('Request Successfull'),
                  actions: <Widget>[
                    FlatButton(child: Text('Ok'), onPressed: () {
                      Navigator.of(context).pop(_fetchBoards());
                    })
                  ],
                ));

              }
              print(result);
              return result;
            },

            // add / update board
            background: Container(
              color: Colors.green,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.request_page, color: Colors.white), alignment: Alignment.centerLeft,),
            ),
            child: ListTile(
              title: Text(
                '${billboards[index].boardLocation}',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('${billboards[index].boardPrice}' + " - " + '${billboards[index].boardSize}'),

              onTap: () {
                Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => RequestModify(boardID: '${billboards[index].boardID}')))
                  .then((_) {_fetchBoards();});
                },
              ),
            );
          },
          itemCount: billboards.length,
         );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}






// import 'package:billboard/models/models.dart';
// import 'package:billboard/screens/screens.dart';
// import 'package:billboard/services/services.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// class BrowsePage extends StatefulWidget{
//   @override
//   _BrowseState createState() => _BrowseState();
// }

// class _BrowseState extends State<BrowsePage> {
//    BoardService get service => GetIt.I<BoardService>();
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
//         title: Text("Billboard Listings"),
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
//           separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
//           itemBuilder: (_, index) {

//           return Dismissible(
//             key: ValueKey(_apiResponse.data[index].boardID),
//             direction: DismissDirection.startToEnd,
//             onDismissed: (direction) {
//             },
//             confirmDismiss: (direction) async {
//               final result = await showDialog (
//                 context: context,
//                 builder: (_) => BoardRequest()
//               );
              
//               // delete board
//               if (result) {
//                final request = 
//                   RequestManipulation(
//                     boardID: _apiResponse.data[index].boardID,
//                     boardLocation:  _apiResponse.data[index].boardLocation,
//                     boardPrice:  _apiResponse.data[index].boardPrice,
//                     boardSize:  _apiResponse.data[index].boardSize,
//                     userName: "User 1",
//                     status: "Pending",
//                   );
//                   service.createRequest(request);

//               showDialog(
//                 context: context, builder: (_) => AlertDialog(
//                   title: Text('Done'),
//                   content: Text('Request Successfull'),
//                   actions: <Widget>[
//                     FlatButton(child: Text('Ok'), onPressed: () {
//                       Navigator.of(context).pop(_fetchBoards());
//                     })
//                   ],
//                 ));

//               }
//               print(result);
//               return result;
//             },

//             // add / update board
//             background: Container(
//               color: Colors.green,
//               padding: EdgeInsets.only(left: 16),
//               child: Align(child: Icon(Icons.request_page, color: Colors.white), alignment: Alignment.centerLeft,),
//             ),
//             child: ListTile(
//               title: Text(
//                 _apiResponse.data[index].boardLocation,
//                 style: TextStyle(color: Theme.of(context).primaryColor),
//               ),
//               subtitle: Text(_apiResponse.data[index].boardPrice + " - " + _apiResponse.data[index].boardSize),

//               onTap: () {},
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
