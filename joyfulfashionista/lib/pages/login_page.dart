import 'package:flutter/material.dart';
import '../api_service.dart';
import '../utlils/form_helper.dart';
import '../utlils/progressHUD.dart';
import 'profile_page.dart';
import 'signup_page.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  APIService apiServices;

  String username;
  String password;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Color myYellowColor = Color(0xff1ffc826);
  Color myBlueColor = Color(0xff1b4573);
  @override
  void initState() {
    apiServices = APIService();
    super.initState();
  }

  Widget _uiScreen() {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 100, right: 10, left: 10),
          decoration: BoxDecoration(
            image : new DecorationImage(
              image: new ExactAssetImage('asset/images/app_icon.jpg'),
              fit: BoxFit.scaleDown,
            ),

          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 40, right: 10, left: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: globalKey,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: this.myBlueColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (!value.contains('@') || !value.endsWith('.com')) {
                          return 'Please Enter a valid Email';
                        }
                        if (value.isEmpty) {
                          return 'Please enter Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: this.myBlueColor,
                        ),
                      ),
                      onChanged: (value) => username = value,
                    ),
                    TextFormField(
                      obscureText: hidePassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (value.length < 6) {
                          return 'Password is Too Short';
                        }
                        return null;
                      },
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: this.myBlueColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                      child:
                          Text('Login', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (validateAndSave()) {
                          setState(() {
                            isApiCallProcess = true;
                          });

                          apiServices
                              .loginCustomer(username, password)
                              .then((ret) {
                            if (ret != null) {
                              print(ret.data.token);
                              print(ret.data.toJson());

                              setState(() {
                                isApiCallProcess = false;
                              });

                              FormHelper.showMessage(
                                  context, 'Done', 'Logged In Successfully', 'Ok',
                                      () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => (Profile()),
                                      ),
                                    );
                                  }
                              );
                            } else {
                              FormHelper.showMessage(
                                context,
                                "WooCommerce App",
                                "Invalid Login!!",
                                "Ok",
                                    () {},
                              );
                            }
                          });
                        }
                      },
                      color: this.myBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Align(
                      child: GestureDetector(
                        child: Text(
                          'Don\'t have account sign up',
                          style:
                              TextStyle(color: this.myBlueColor, fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => (SignupPage()),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.myYellowColor,
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        child: _uiScreen(),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
