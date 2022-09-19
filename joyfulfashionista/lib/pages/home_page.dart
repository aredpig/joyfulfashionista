import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Page14-20/Account.dart';
import '../utlils/cart_icons.dart';
import 'cart_page.dart';
import 'dashboard_page.dart';
import 'login_page.dart';
import 'product_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color myYellowColor = Color(0xff1ffc826);
  Color myBlueColor = Color(0xff1b4573);
  List<Widget> _widgetList = [
    DashboardPage(),
    CartPage(),
    DashboardPage(),
    //Login(),
    Account(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.home,
              ),
              label: ' Store '
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.cart,
              ),
              label: 'My Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.favourite,
              ),
              label: 'Favourites'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CartIcons.account,
              ),
              label: 'My Account'
          ),
        ],
        selectedItemColor: this.myBlueColor,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
    );
  }
}
