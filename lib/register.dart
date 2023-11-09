import 'package:flutter/material.dart';

void registerpage() => runApp(MaterialApp(
  title: 'Campus Cruise',
  home: registerscreen(),
));

class registerscreen extends StatefulWidget {
  const registerscreen({super.key});

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
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

class RegisterScreenPage extends StatefulWidget {
  const RegisterScreenPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RegisterScreenPage> createState() => _basicState();
}

class _basicState extends State<RegisterScreenPage> {
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
