import 'package:flutter/material.dart';
import 'package:joyfulfashionista/Page14-20/aboutme.dart';
import 'package:joyfulfashionista/pages/base_page.dart';
import 'package:joyfulfashionista/pages/cart_page.dart';
import 'package:joyfulfashionista/pages/checkout_base.dart';
import 'package:joyfulfashionista/pages/home_page.dart';
import 'package:joyfulfashionista/pages/product_details.dart';
import 'package:joyfulfashionista/pages/product_page.dart';
import 'package:joyfulfashionista/provider/cart_provider.dart';
import 'package:joyfulfashionista/provider/loader_provider.dart';
import 'package:joyfulfashionista/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'Page14-20/managemyaccount.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color myYellowColor = Color(0xff1ffc826);
  Color myBlueColor = Color(0xff1b4573);
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          child: ProductPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoaderProvider(),
          child: BasePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: ProductDetails(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: CartPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: CheckoutBasePage(),
        ),
      ],
      child: MaterialApp(
        title: 'Fashionista App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          brightness: Brightness.light,
          dividerColor: this.myBlueColor,
          focusColor: this.myBlueColor,
          hintColor: this.myBlueColor,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 22.0, color: this.myBlueColor),
            headline2: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: this.myBlueColor,
            ),
            headline3: TextStyle(fontSize: 20.0, color: this.myBlueColor),
            headline4: TextStyle(fontSize: 18.0, color: this.myBlueColor),
            subtitle1: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.3),
            caption: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                height: 1.3),
            bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: this.myBlueColor,
            ),
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: this.myBlueColor),
        ),
        //////Launch page change here
        //home: AboutMe(),
        //home: ManageMyAccount(),
        home:HomePage(),

        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new HomePage(),
          '/login': (BuildContext context) => new Login(),
        },
      ),
    );
  }
}
