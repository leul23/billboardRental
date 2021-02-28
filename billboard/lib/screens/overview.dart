import 'package:billboard/screens/screens.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget{
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<OverviewPage> {
  int _currentIndex = 0;

@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget home = Column(
      children: [            
         // ignore: missing_required_param
         FlatButton(
          child: Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
            )
          ),
          padding: EdgeInsets.fromLTRB(20,10,20,20),
        ),
        Image.asset(
              "assets/icons/chat.png",
              height: size.height * 0.45,
            ),

        SizedBox(height: size.height * 0.03),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Color(0xD135B355),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BrowsePage()),);
              },
              child: Text("Billboard Listings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Color(0xD135B355),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClientPage()),);
              },
              child: Text("Client Inventory", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Color(0xD135B355),
              onPressed:() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OwnerMenu()),);
              },
              child: Text("Owner Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Overview"),
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


