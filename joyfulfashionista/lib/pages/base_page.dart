import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/loader_provider.dart';
import '../utlils/progressHUD.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(builder: (context, loaderModel, child) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: ProgressHUD(
          child: PageUI(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: .3,
        ),
      );
    });
  }

  Widget PageUI() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: true,
      title: Text(
        'Fashonista',
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
