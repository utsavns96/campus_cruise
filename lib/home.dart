import 'package:flutter/material.dart';

import 'alerts.dart';
import 'basicscreen.dart';
import 'book.dart';
import 'contactus.dart';

void homepage() => runApp(MaterialApp(
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
        title: Text(
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
        decoration: BoxDecoration(
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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage("assets/bgimage.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Image.asset('assets/logo.png')),
              Container(
                  padding: EdgeInsets.only(top: 50),
                  width: 300,
                  height: 100,
                  child: new FloatingActionButton(
                    child: Text('Shuttle Locator',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      //TO DO: Add login functionality
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  BasicScreenPage(title: 'Campus Cruise')));
                    },
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 50),
                  width: 300,
                  height: 100,
                  child: new FloatingActionButton(
                    child: Text('Book A Ride',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 50),
                  width: 300,
                  height: 100,
                  child: new FloatingActionButton(
                    child: Text('Alerts',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    onPressed: () {
                      //TO DO: Add login functionality
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  AlertScreenPage(title: 'Campus Cruise')));
                    },
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
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
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Feedback'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ContactUsPage(title: 'Campus Cruise')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
