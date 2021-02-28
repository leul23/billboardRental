import 'package:billboard/models/models.dart';
import 'package:billboard/screens/screens.dart';
import 'package:billboard/services/services.dart';
import 'package:billboard/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


class ClientPage extends StatefulWidget{
  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<ClientPage> {

  BoardService get service => GetIt.I<BoardService>();
  APIResponse<List<RequestsForListing>> _apiResponse;
 
  bool _isLoading = false;

  @override
  void initState() {
    _fetchRequests();
    super.initState();
  }

  _fetchRequests() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getRequestsList();

    setState(() {
      _isLoading = false;
    });
  }
@override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Client Inventory"),
      ),
      body: BlocBuilder(                                                   
        builder: (_,state) {                       // this builds the bloc
           if (state is RequestFailure) {
            return Text('Could not do Request operation');
          }
          if (state is RequestLoadSuccess) {      // the app displayes data here 

            final requests = state.requests;       
            
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
                builder: (_) => RequestDelete()
              );
              
              // delete board
              if (result) {
                final deleteResult = await service.deleteRequest(_apiResponse.data[index].boardID);
            
              showDialog(
                context: context, builder: (_) => AlertDialog(
                  title: Text('Done'),
                  content: Text('The request was deleted successfully'),
                  actions: <Widget>[
                    FlatButton(child: Text('Ok'), onPressed: () {
                      Navigator.of(context).pop(_fetchRequests());
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
                '${requests[index].boardLocation}' + " - " + '${requests[index].boardPrice}' + " - " + '${requests[index].boardSize}',   //This uses data from bloc
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('${requests[index].status}'), //This uses data from bloc

              onTap: () {},
              ),
            );
          },
          itemCount: _apiResponse.data.length,
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

// class ClientPage extends StatefulWidget{
//   @override
//   _ClientState createState() => _ClientState();
// }

// class _ClientState extends State<ClientPage> {
//   int _currentIndex = 0;

//   BoardService get service => GetIt.I<BoardService>();
//   APIResponse<List<RequestsForListing>> _apiResponse;
 
//   bool _isLoading = false;

//   @override
//   void initState() {
//     _fetchRequests();
//     super.initState();
//   }

//   _fetchRequests() async {
//     setState(() {
//       _isLoading = true;
//     });

//     _apiResponse = await service.getRequestsList();

//     setState(() {
//       _isLoading = false;
//     });
//   }
// @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Client Inventory"),
//       ),
//       body: Builder(
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
//                 builder: (_) => RequestDelete()
//               );
              
//               // delete board
//               if (result) {
//                 final deleteResult = await service.deleteRequest(_apiResponse.data[index].boardID);
            
//               showDialog(
//                 context: context, builder: (_) => AlertDialog(
//                   title: Text('Done'),
//                   content: Text('The request was deleted successfully'),
//                   actions: <Widget>[
//                     FlatButton(child: Text('Ok'), onPressed: () {
//                       Navigator.of(context).pop(_fetchRequests());
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
//                 _apiResponse.data[index].boardLocation + " - " + _apiResponse.data[index].boardPrice + " - " + _apiResponse.data[index].boardSize,
//                 style: TextStyle(color: Theme.of(context).primaryColor),
//               ),
//               subtitle: Text(_apiResponse.data[index].status),

//               onTap: () {},
//               ),
//             );
//           },
//           itemCount: _apiResponse.data.length,
//          );
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text("Home"),
//             ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             title: Text("Profile"),
//             ),
//         ],
//         onTap: (index){
//           setState((){
//             _currentIndex = index;
//           });
//         }, 
//         ),
//     );
//   }
// }

