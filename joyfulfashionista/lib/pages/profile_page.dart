import 'package:flutter/material.dart';
import '../api_service.dart';
import '../utlils/profile_constants.dart';
import '../widgets/profile_list_item.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  APIService apiServices;
  String username;
  @override
  void initState() {
    apiServices = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                // Get name from server
                Text(
                  'Name_Tag',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Poppins"),
                ),
                SizedBox(height: 30),
                SocialIcons(),
                SizedBox(height: 30),
                ProfileListItems(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _nametag(){
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(children: [
          Container(


          )
        ],),
      ) ,
    );
  }
}


class SocialIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialIcon(
          color: Color(0xFF102397),
          iconData: facebook,
          onPressed: () {
            print('facebook');
          },
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function onPressed;

  SocialIcon({this.color, this.iconData, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(iconData, color: Colors.white),
        ),
      ),
    );
  }
}

class ProfileListItems extends StatelessWidget {
  final Function onPressed;

  ProfileListItems({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ProfileListItem(
            icon: IconData(0xf2d0, fontFamily: 'MaterialIcons'),
            text: 'Privacy',
            /////////Unsolved onpressed
            onPressed: () {
              print('here');
            },
          ),
          ProfileListItem(
            icon: IconData(0xe51e, fontFamily: 'MaterialIcons'),
            text: 'Purchase History',
          ),
          ProfileListItem(
            icon: IconData(0xf0f6, fontFamily: 'MaterialIcons'),
            text: 'Help & Support',
          ),
          ProfileListItem(
            icon: IconData(0xf26f, fontFamily: 'MaterialIcons'),
            text: 'Settings',
          ),

          ProfileListItem(
            icon: IconData(0xe3b3, fontFamily: 'MaterialIcons'),
            text: 'Logout',
          ),
        ],
      ),
    );
  }
}