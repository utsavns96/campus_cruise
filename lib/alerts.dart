import 'package:flutter/material.dart';

void alertspage() => runApp(MaterialApp(
  title: 'Campus Cruise',
  home: alertsscreen(),
));

class alertsscreen extends StatefulWidget {
  const alertsscreen({super.key});

  @override
  State<alertsscreen> createState() => _alertsscreenState();
}

class _alertsscreenState extends State<alertsscreen> {
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

class AlertScreenPage extends StatefulWidget {
  const AlertScreenPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AlertScreenPage> createState() => _basicState();
}

class _basicState extends State<AlertScreenPage> {
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
          ],
        )
    );
  }
}
