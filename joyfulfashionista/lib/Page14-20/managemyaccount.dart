import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joyfulfashionista/pages/home_page.dart';
import '../api_service.dart';
import '../pages/login_page.dart';
import 'Account.dart';

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
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xff52bebe),
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
                      Padding(padding: EdgeInsets.only(top: screen_height*0.03)),
                      Container(
                        child: ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(50), // Image radius
                            child:
                            //Image.network('imageUrl', fit: BoxFit.cover),
                            Image.asset('asset/images/head.jpg',
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: screen_height*0.01)),
                      Container(
                        //Api Service
                        child: Text("Username",
                            style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: screen_height*0.04)), // Space between each horizontal container
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("Number of followers",style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                            Padding(padding: EdgeInsets.only(left: screen_height*0.03)),
                            Text("number",style: TextStyle(fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                          ],
                        )
                      ),
                      Container(
                          child: Row(
                            children: [
                              Text("Positive rating",style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                              Padding(padding: EdgeInsets.only(left: screen_height*0.07)),
                              Text("number",style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
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
          Padding(padding: EdgeInsets.only(top: screen_height*0.03)),
          Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.payment_outlined,
                  ),
                  title: const Text('Payment Methods',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManageMyAccount()));
                  },
                  shape:RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.only(
                        //topLeft: Radius.circular(20),
                        //topRight: Radius.circular(20),
                      )
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                  ),
                  title: const Text('My Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManageMyAccount()));
                  },
                ),
                ListTile(

                  leading: Icon(
                    Icons.security_outlined,
                  ),
                  title: const Text('Change Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                Padding(padding: EdgeInsets.only(top: screen_height*0.4)),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: Size.fromWidth(350),
                      //backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        side: BorderSide(
                          color: Colors.black,
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

