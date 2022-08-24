import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utlils/cart_icons.dart';
import 'cart_page.dart';
import 'dashboard_page.dart';
import 'payment_screen.dart';

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
    // DashboardPage(),
    PaymentScreen(),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: this.myYellowColor,
      automaticallyImplyLeading: false,
      title: Text(
        'Fashionista',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Icon(
          Icons.notifications_none,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ], systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
