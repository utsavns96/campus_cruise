import 'package:flutter/material.dart';

void basicscreenpage() => runApp(MaterialApp(
  title: 'Campus Cruise',
  home: basicscreen(),
));

class basicscreen extends StatefulWidget {
  const basicscreen({super.key});

  @override
  State<basicscreen> createState() => _basicscreenState();
}

class _basicscreenState extends State<basicscreen> {
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

class BasicScreenPage extends StatefulWidget {
  const BasicScreenPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BasicScreenPage> createState() => _basicState();
}

class _basicState extends State<BasicScreenPage> {
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
