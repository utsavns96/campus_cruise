import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

void RegistrationSuccessPage() =>
    runApp(MaterialApp(
      title: 'Campus Cruise',
      home: RegistrationSucessScreen(),
    ));

class RegistrationSucessScreen extends StatefulWidget {
  @override
  State<RegistrationSucessScreen> createState() =>
      _RegistrationSucessScreenState();
}

class _RegistrationSucessScreenState extends State<RegistrationSucessScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (_) => const Login()));
    });
  }

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
        backgroundColor: Colors.transparent,
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
                mainAxisAlignment: MainAxisAlignment.center, // This should center your Column's children
                children: <Widget>[
                  Container(
                    child: const Icon(
                      Icons.check_circle_outline, // This is the tick mark icon
                      size: 100.0, // Size of the tick mark
                      color: Colors.green, // Color for the tick mark
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Registration',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 40.0, // Larger text size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Successful',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 40.0, // Larger text size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'Thank you for registering!',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20.0, // Smaller text size
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}