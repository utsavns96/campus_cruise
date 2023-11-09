import 'package:flutter/material.dart';

void contactuspage() => runApp(MaterialApp(
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  // Container(
                  //   child: const Text(
                  //     "Click on the button below to call dispatch",
                  //     style: TextStyle(
                  //       fontFamily: 'Raleway',
                  //       fontSize: 20.0,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white,
                  //       letterSpacing: 1.0,
                  //     ),
                  //   ),
                  // ),
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: new FloatingActionButton(
                        child: Text('Call Dispatch',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          //TO DO: Add login functionality
                          //Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen(title: 'Campus Cruise')));
                        },
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      width: 300,
                      height: 100,
                      child: new FloatingActionButton(
                        child: Text('Email',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          //TO DO: Add login functionality
                          //Navigator.push(context, MaterialPageRoute(builder: (_) => BookingScreen(title: 'Campus Cruise')));
                        },
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      )
                  ),
                ],
              ),
            ),

          ],
        )
    );
  }
}