import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PoE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PoE Handmade Crochet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchSocial(String url, String fallbackUrl) async {
    try {
      bool launched =
          await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Text(
                  "PoE",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4.0),
                ),
                Text(
                  "Handmade Crochet",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 2.0),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // color: Colors.blue,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                          child: Icon(MdiIcons.phone),
                          onPressed: () => _makePhoneCall('tel:09964339401')),
                      FloatingActionButton(
                          child: Icon(MdiIcons.facebook),
                          onPressed: () => _launchSocial(
                              'https://www.facebook.com/PoEHandmadeCrochet',
                              'https://www.facebook.com/PoEHandmadeCrochet')),
                      FloatingActionButton(
                          child: Icon(MdiIcons.facebookMessenger),
                          onPressed: () =>
                              launch("http://m.me/PoEHandmadeCrochet?ref=94i"))
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Phone"),
                  //       GestureDetector(
                  //         onTap: () => _makePhoneCall('tel:09964339401'),
                  //         child: Text(
                  //           "09964339401",
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Facebook"),
                  //       GestureDetector(
                  //         onTap: () => _launchSocial(
                  //             'https://www.facebook.com/PoEHandmadeCrochet',
                  //             'https://www.facebook.com/PoEHandmadeCrochet'),
                  //         child: Text(
                  //           "PoE Handmade Crochet",
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Messenger"),
                  //       GestureDetector(
                  //         onTap: () =>
                  //             launch("http://m.me/PoEHandmadeCrochet?ref=94i"),
                  //         child: Text(
                  //           "PoE Handmade Crochet",
                  //           style: TextStyle(fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
