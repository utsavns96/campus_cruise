import 'package:campus_cruise/home.dart';
import 'package:campus_cruise/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    title: 'Campus Cruise',
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
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
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'Enter valid mail id as abc@uic.edu',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter password',
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
                        onPressed: () async {
                          try {
                            await _authService.signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const MenuPage(
                                        title: 'Campus Cruise')));
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'An error occurred: ${e.toString()}'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterScreenPage(
                                      title: 'Campus Cruise')));
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
        ));
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to exit?',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            content: const Text('Click Yes to exit, No continue',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: const Text("NO",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: const Text("YES",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    )),
              ),
            ],
          ),
        ) ??
        false;
  }
}
