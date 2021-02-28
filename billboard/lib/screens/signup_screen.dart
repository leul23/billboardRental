import 'package:billboard/screens/screens.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[           
            SizedBox(height: size.height * 0.04),
            Image.asset(
              "assets/icons/signup.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0x3135B3F5),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                // onChanged: onChanged,
                cursorColor: Color(0xD135B355),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xD135B355),
                  ),
                  hintText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0x3135B3F5),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                // onChanged: onChanged,
                cursorColor: Color(0xD135B355),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xD135B355),
                  ),
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0x3135B3F5),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                // onChanged: onChanged,
                cursorColor: Color(0xD135B355),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xD135B355),
                  ),
                  hintText: "Phone",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Color(0x3135B3F5),
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                obscureText: true,
                cursorColor: Color(0x3135B3F5),
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: Color(0xD135B355),
                  ),
                  border: InputBorder.none,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()),);
                  },
                  child: Text("SIGNUP", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an Account ? ", style: TextStyle(color: Color(0xD135B355)),),
                GestureDetector(
                  onTap: () { 
                    Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                      },
                    ),);
                  },
                  child: Text(" Sign In", style: TextStyle(color: Color(0xD135B355),fontWeight: FontWeight.bold,),),
                )
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}
