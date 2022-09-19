import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pages/home_page.dart';
import 'dart:async';

import 'Account.dart';

class AboutMe extends StatefulWidget {
  AboutMe({Key key}) : super(key: key);
  @override
  AboutMeState  createState() => AboutMeState();
}

class AboutMeState extends State<AboutMe>{
  @override
  Widget build(BuildContext context) {
    double screen_height = MediaQuery.of(context).size.height;
    double screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back,color: Colors.black
          ),
          onPressed: () {
          // Press and navigate to another page
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
           },
        ),
        title: Text("About Me", style: TextStyle(fontStyle: FontStyle.italic,color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          // ICON display
          IconButton(
            icon: Image.asset('asset/images/app_icon.jpg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: screen_height*0.014)),
          Container(
            height: screen_height*0.3,
            width: screen_width*0.95,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox.fromSize(
                size: Size.fromRadius(100), // Image radius
                child: Image.asset('asset/images/About_me.jpg',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: screen_height*0.01)),
          Container(
            child: Text("Serina Bird, Founder",
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff52bebe))
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: screen_height*0.42,
            decoration: BoxDecoration(border: Border.all(
              color: Colors.white,
              width: 1.0),
            ),
            child: Expanded(
              child: SingleChildScrollView(
                // for Vertical scrolling
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text("I grew up surrounded by rolls of fabric, buttons and ribbons. My mother, the amazing Lee Bird, "
                        "was in the rag trade and when I was a toddler, I would play under her table as she designed and made "
                        "patterns. Mum built her retail and wholesale empire while I was growing up.  She was big when shoulder"
                        " pads were big and hair even bigger.",style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("But as a young adult, I rejoiced in clothing but didn’t have the money to buy designer labels.  "
                        "I was gleefully a closet op-shopper – long before it was fashionable. I remember buying a fabulous "
                        "full-length fake fur coat ahead of a year in China in the mid-1990s.  The only problem was that it"
                        " was so lovely, people assumed it was real and I was loaded. Try haggling in a full-length fur coat "
                        "that people assume to be real.  [Caveat here: I do not support animal cruelty and I’m pretty sure "
                        "it was fully fake.]",style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("In my adulthood, I became The Joyful Frugalista.  I’m still pretty frugal, and I’ve even taken "
                        "frugal fashion to a new level.  It’s evolved beyond occasional op-shopping to embarrassing second-hand "
                        "as a way of life.  Second-hand, opped, free-loved or even vintage – it’s all a fabulous way to practice "
                        "sustainability and embrace your unique style (aka quirkiness).",style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("In October 2020, I held a clothes swap party for my birthday. After the event, I had bags of "
                        "clothing. I donated most to my Zonta Club and op shops. But as I was writing an article about "
                        "selling second-hand clothing for The Daily Telegraph (and associated titles), I decided to see "
                        "if I could sell some of my clothing second hand.  I found that there wasn’t a community that "
                        "resonated with me. ",style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("I wanted somewhere to go that was vibrant, fun and more about style than about having a "
                        "perfect body. I wanted to buy classic items that I could wear with pride at a job interview. "
                        "Or at a black-tie ball.  And I wanted it to be a bit like the treasure-seeking fun of being "
                        "in an op shop, but accessible on my phone or computer. Because sometimes, my life is busy and "
                        "I don’t have much time to get on my bike or in my car and head to a shop.",style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("So I created The Joyful Fashionista. It’s my baby. It’s my joy.  I hope you love it as much "
                        "as I do.",style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("I am grateful for the support of YWCA Canberra and the Canberra Innovation Network, who "
                        "provided me with grant funding that has been instrumental in bringing this concept to life."
                        ,style: TextStyle(color: Colors.black, fontSize: 15.0)),
                    Text("I also wish to acknowledge and support the Zonta Club of Canberra Breakfast. You will see "
                        "items here on sale to aid their charity. They do amazing things to support women and children, "
                        "especially in the Canberra community, and I am thrilled to be supporting them.",
                        style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  ],
                )
              ),
            ),
          ),
          Container(
            child: Text("Follow Us",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff52bebe))
            ),
          ),
          Container(
            child: IconButton(
                icon: Icon(Icons.facebook_outlined, size: 40),
              onPressed: () {
                String digital_url= "https://www.facebook.com/Joyfulfashionista/";
                var fbUrl =
                    "fb://facewebmodal/f?href=" + digital_url;
                launchFacebook(fbUrl, digital_url);
                },
            ),
          ),
        ],
      ),
    );
  }
}
Future<void> launchFacebook(String fbUrl,String fbWebUrl) async {
  try {
    bool launched = await launch(fbUrl, forceSafariVC: false);
    print("Launched Native app $launched");

    if (!launched) {
      await launch(fbWebUrl, forceSafariVC: false);
      print("Launched browser $launched");
    }
  } catch (e) {
    await launch(fbWebUrl, forceSafariVC: false);
    print("Inside catch");
  }
}