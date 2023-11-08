import 'package:campus_cruise/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      title: 'Campus Cruise',
      home: Login(),
    ));

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset('assets/logo.png')),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 50),
                child: const Text(
                  "Login",
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
                    labelText: 'Username',
                    hintText: 'Enter valid mail id as abc@uic.edu',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter password',
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
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuPage(title: 'Campus Cruise')));
                    },
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: const Text('Login',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  )),
              Container(
                padding: const EdgeInsets.only(top: 150),
                child: const Text(
                  "New user? Click on the button below to register",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 50),
                  width: 150,
                  height: 100,
                  child: FloatingActionButton(
                    onPressed: () {
                      //TO DO: Add register functionality
                    },
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text('Register',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue,
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Next'),
        ),
      ),
    );
  }
}
