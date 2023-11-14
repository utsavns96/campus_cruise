import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'home.dart';

void contactuspage() => runApp(const MaterialApp(
      title: 'Campus Cruise',
      home: conactus(),
    ));

class conactus extends StatefulWidget {
  const conactus({super.key});

  @override
  State<conactus> createState() => _conactusState();
}

class _conactusState extends State<conactus> {
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
        backgroundColor: Color(0x00000000),
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

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ContactUsPage> createState() => _contactstate();
}

class _contactstate extends State<ContactUsPage> {
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
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MenuPage(
                        title: 'Campus Cruise',
                      )),
                      (Route<dynamic> route) => false
              );
            },
          ),
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //padding: const EdgeInsets.only(top: 100),
                    child: const Text(
                      "Contact Us",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 8.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 150),
                    child: const Text(
                      "Click on the button below to call dispatch",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: FloatingActionButton(
                        onPressed: () => launchUrlString('tel:123456789'),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call),
                              Text('Call Dispatch',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ]),
                      )),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 150, left: 15, right: 15),
                    child: const Text(
                      "Click on the button below to write an email to us at: contactus@campuscruise.com",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: FloatingActionButton(
                        onPressed: () => launchUrlString(
                            'mailto:usharm4@uic.edu?subject=CampusCruise: Contact Us'),
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.email),
                              Text('Email',
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )),
                            ]),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
