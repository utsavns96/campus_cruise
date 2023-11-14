import 'package:campus_cruise/login.dart';
import 'package:flutter/material.dart';

import 'alerts.dart';
import 'basicscreen.dart';
import 'book.dart';
import 'contactus.dart';
import 'feedback.dart';
import 'history.dart';
import 'shuttlelocator.dart';

void homepage() => runApp(const MaterialApp(
      title: 'Campus Cruise',
      home: home(),
    ));

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Campus Cruise',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0x00000000),
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimage.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(
              'Campus Cruise',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0x00000000),
            elevation: 0.0,
          ),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bgimage.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.only(top: 100, bottom: 100),
                      child: Image.asset('assets/logo.png')),
                  Container(
                      padding: const EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: FloatingActionButton(
                        onPressed: () {
                          //TO DO: Add login functionality

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShuttleLoc()),
                          );
                        },
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text('Shuttle Locator',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapPage()),
                          );
                        },
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text('Book A Ride',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      )),
                  Container(
                      padding: const EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: FloatingActionButton(
                        onPressed: () {
                          //TO DO: Add login functionality
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const AlertScreenPage(
                                      title: 'Campus Cruise')));
                        },
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text('Alerts',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      )),
                ],
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                  ),
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Colors.white,
                      ),
                      Text('Test User')
                    ],
                  )),
                ),
                ListTile(
                  title: const Text(
                    'History',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const HistoryPageScreen(
                                title: 'Campus Cruise')));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Feedback',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const FeedbackPage(title: 'Campus Cruise')));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const ContactUsPage(title: 'Campus Cruise')));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Future<bool> _onBackPressed() async {
    return await showDialog( //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Exit App'),
        content: Text('Do you want to exit the app?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:Text('No'),
          ),

          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            // onPressed: () => Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (BuildContext context) => Login()),
            //         (Route<dynamic> route) => false
            // ),
            //return true when click on "Yes"
            child:Text('Yes'),
          ),

        ],
      ),
    )??false; //if showDialouge had returned null, then return false
  }
}
