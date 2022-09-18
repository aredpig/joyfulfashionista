import 'package:flutter/material.dart';
import 'package:joyfulfashionista/Page14-20/aboutme.dart';
import 'package:joyfulfashionista/Page14-20/managemyaccount.dart';

import '../pages/cart_page.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);
  @override
  AccountState  createState() => AccountState();
}

class AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff52bebe),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: IconButton(
          icon: Image.asset('asset/images/app_icon.jpg'),
        ),
        actions:<Widget>[
          Padding(
              padding: EdgeInsets.only(right: screen_width*0.001),
              child: IconButton(
                icon: Icon(
                    Icons.shopping_cart_outlined,color: Colors.black
                ),
                onPressed: () {
                  // Press and navigate to another page
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));
                },
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: screen_width*0.001),
              child: IconButton(
                icon: Icon(
                    Icons.favorite_border,color: Colors.black
                ),
                onPressed: () {
                  // Press and navigate to another page
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                },
              )
          ),
        ]
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader( // <-- SEE HERE
              decoration: BoxDecoration(color: const Color(0xff52bebe)),
              accountName: Text(
                "Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
              ),
              title: const Text('Page 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: screen_height*0.05)),
          Container(
            width: screen_width*1,
            child: Column(
              children: [
                Container(
                  child: ClipOval(
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(100), // Image radius
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
                      style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: screen_height*0.03)),
          Container(
            //height: screen_height*0.3,
            width: screen_width*0.8,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                  ),
                  title: const Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManageMyAccount()));
                  },
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )
                  ),
                ),
                ListTile(

                  leading: Icon(
                    Icons.favorite_border,
                  ),
                  title: const Text('Favourite Vendors',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ManageMyAccount()));
                  },
                ),
                ListTile(

                  leading: Icon(
                    Icons.local_shipping_outlined,
                  ),
                  title: const Text('Track Shipment',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                ListTile(

                  leading: Icon(
                    Icons.description_outlined,
                  ),
                  title: const Text('About Us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutMe()));
                  },
                ),
                ListTile(

                  leading: Icon(
                    Icons.settings_outlined,
                  ),
                  title: const Text('Settings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),ListTile(

                  leading: Icon(
                    Icons.messenger_outline,
                  ),
                  title: const Text('Messages',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),ListTile(

                  leading: Icon(
                    Icons.dashboard_customize_outlined,
                  ),
                  title: const Text('Dashboard',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  shape:RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                  ),
                  onTap: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}