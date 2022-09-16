import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joyfulfashionista/pages/home_page.dart';
import '../api_service.dart';

class ManageMyAccount extends StatefulWidget {
  ManageMyAccount({Key key}) : super(key: key);

@override
ManageMyAccountState createState() => ManageMyAccountState();
}

class ManageMyAccountState extends State<ManageMyAccount> {
  APIService apiServices;
  String username;
  @override
  void initState() {
    apiServices = APIService();
    super.initState();
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( //App Header Bar
        title: Text('Manage My Account',
          style: TextStyle(fontStyle: FontStyle.italic, // FontStyle
              color: Colors.black),// color
        ),//text config
        centerTitle: true,
        backgroundColor: Colors.white, // appbar background color
        leading: IconButton( // top left return button, use leading to set at left
              icon: Icon(
                Icons.arrow_back,color: Colors.black
              ),
            onPressed: () {
                // Press and navigate to another page
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                },
          ),
      ),
      body: Column( // Must use Column to build frame when layout is vertically
        children: [
          Container(
            child: Row( // Row to define element in horizontal layout
              children: [
                Container(
                  child: Column(
                    children: [
                      Card(
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(child: Text('Image')),
                        ),
                      ),
                      Text("data")
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 40.0)), // Space between each horizontal container
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Number of followers"),
                            Padding(padding: EdgeInsets.only(left: 30.0)),
                            Text("number")
                          ],
                        )
                      ),
                      Container(
                          child: Row(
                            children: [
                              Text("Positive rating"),
                              Padding(padding: EdgeInsets.only(left: 70.0)),
                              Text("number")
                            ],
                          )
                      )
                    ],
                  ),
                  alignment: Alignment(-0.8, 0.0),
                )
              ],
            )
          ),// Each element need a container to box it
          Container(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: Size.fromWidth(500),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )
                      //backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Payment Methods',
                        style: TextStyle(fontSize: 25)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: Size.fromWidth(500),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )
                      //backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Address',
                        style: TextStyle(fontSize: 25)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: Size.fromWidth(500),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )
                      //backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Change Password',
                        style: TextStyle(fontSize: 25)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 230.0)),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: Size.fromWidth(350),
                      //backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(
                          color: Color(0xff52bebe),
                          width: 2.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text('Log out',
                        style: TextStyle(fontSize: 25)),
                  ),
                ),
              ],
            ),

          )
        ],


      ), //main page use body to point out
    );
  }
}

