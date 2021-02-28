import 'package:billboard/screens/screens.dart';
import 'package:flutter/material.dart';

class OwnerMenu extends StatefulWidget{
  @override
  _OwnerMenuState createState() => _OwnerMenuState();
}

class _OwnerMenuState extends State<OwnerMenu> {
  int _currentIndex = 0;

@override
  Widget build(BuildContext context) {
    
    Widget home = Column(
      children: [
          FlatButton(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(20),
            shadowColor: Color(0xFFFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,16.0),
                    child: Text("Requests Management", style: TextStyle(fontStyle: FontStyle.italic),),
                  ),
                ),
              ],
            )
          ),
          padding: EdgeInsets.fromLTRB(20,20,20,10),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerRequests()),
            );          
          },
        ),

          FlatButton(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(20),
            shadowColor: Color(0xFFFFFFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,16.0),
                    child: Text("Billboard Management", style: TextStyle(fontStyle: FontStyle.italic),),
                  ),
                ),
              ],
            )
          ),
          padding: EdgeInsets.fromLTRB(20,10,20,10),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerPage()),
            );          
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Owner Page"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            home,
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            ),
        ],
        onTap: (index){
          setState((){
            _currentIndex = index;
          });
        }, 
        ),
    );
  }
}


