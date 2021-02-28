import 'package:billboard/screens/screens.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/icon.png",
                  height: size.height * 0.35,
                ),
                Text("WELCOME TO BILLBOARD", style: TextStyle(fontWeight: FontWeight.bold)),                
                SizedBox(height: size.height * 0.01),
                Text("The way to go to rent billboards for all your needs.", style: TextStyle(fontStyle: FontStyle.italic)),
                SizedBox(height: size.height * 0.08),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: Color(0xD135B355),
                      onPressed:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                      },
                      child: Text("LOGIN", style: TextStyle(color: Colors.white)),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()),);
                      },
                      child: Text("SIGN UP", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),  
        ],
      ),
    ),
    );
  }
}
