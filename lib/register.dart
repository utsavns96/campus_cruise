import 'package:campus_cruise/login.dart';
import 'package:campus_cruise/registrationsuccessful.dart';
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
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset('assets/logo.png')),
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 50),
                      child: const Text(
                        "Register:",
                        style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 8.0,
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Email ID',
                      hintText: 'Enter valid mail id as abc@uic.edu',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Password',
                      hintText: 'Enter password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    obscuringCharacter: '*',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Re-confirm your Password',
                      hintText: 'Enter password again',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    obscuringCharacter: '*',
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 50),
                    width: 300,
                    height: 100,
                    child: FloatingActionButton(
                      onPressed: () {
                        //TO DO: Add login functionality
                        Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationSucessScreen()));
                      },
                      backgroundColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: const Text('Register',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ))
                ],
            )
          ],
        )
    );
  }
}
