import 'package:campus_cruise/login.dart';
import 'package:flutter/material.dart';

void registrationsuccessfulpage() => runApp(MaterialApp(
  title: 'Campus Cruise',
  home: registrationsuccessfulscreen(),
));

class registrationsuccessfulscreen extends StatefulWidget {
  const registrationsuccessfulscreen({super.key});

  @override
  State<registrationsuccessfulscreen> createState() => _registrationsuccessfulscreenState();
}

class _registrationsuccessfulscreenState extends State<registrationsuccessfulscreen> {
  @override
  void initState(){
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

class RegistrationSuccessfulScreenPage extends StatefulWidget {
  const RegistrationSuccessfulScreenPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RegistrationSuccessfulScreenPage> createState() => _basicState();
}

class _basicState extends State<RegistrationSuccessfulScreenPage> {
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

