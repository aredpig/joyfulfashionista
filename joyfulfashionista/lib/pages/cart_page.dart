import 'package:flutter/material.dart';
import 'package:joyfulfashionista/pages/verify_address.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../provider/loader_provider.dart';
import '../utlils/progressHUD.dart';
import '../widgets/widget_cart_product.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Color myYellowColor = const Color(0xff1ffc826);
  Color myBlueColor = const Color(0xff1b4573);
  @override
  void initState() {
    super.initState();
    var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    cartItemsList.resetStreams();
    cartItemsList.fetchCartItems();
  }

  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(builder: (context, loadermodel, child) {
      return Scaffold(
        body: ProgressHUD(
          child: _cartItemsList(),
          inAsyncCall: loadermodel.isApiCallProcess,
          opacity: 0.3,
        ),
      );
    });
  }

  Widget _cartItemsList() {
    return new Consumer<CartProvider>(
        // ignore: missing_return
        builder: (context, cartItemsList, child) {
      if (cartItemsList.cartItems != null &&
          cartItemsList.cartItems.length > 0) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartItemsList.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartProduct(data: cartItemsList.cartItems[index]);
                    }),
                Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                new Text(
                                  "Total: ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                new Text(
                                  "\$${cartItemsList.totalAmount.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            FlatButton(
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VerifyAddress()))
                              },
                              color: this.myBlueColor,
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Text(
                                    "Checkout",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )))
              ],
            )
          ],
        );
      } else {
        return Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
            "There are not products in cart",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
      }
    });
  }
}
