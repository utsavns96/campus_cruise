import 'package:flutter/material.dart';

void alertspage() => runApp(const MaterialApp(
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
      body: Container(
        decoration: const BoxDecoration(
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
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              //padding: EdgeInsets.only(top: 100),
                              width:350,
                              height:30,
                              color: Colors.amber,
                              child: const Center(
                                child: Text(
                                  "ALERT",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                                width:350,
                                height:125,
                                color: Colors.black,
                                child: const Center(
                                  child: Text(
                                    "Night Ride Service Timings Change: Starting Fall 2023, NightRide Service will be available from 10:00 pm to 7:00 am on all 7 days of the week ",
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                              child: Container(
                                  width:350,
                                  height:30,
                                  color: Colors.red,
                                  child: const Center(
                                    child: Text(
                                        "WARNING",
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              )
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                                width:350,
                                height:125,
                                color: Colors.black,
                                child: const Center(
                                  child: Text(
                                    "Night Ride Services are currently disrupted from Taylor & Racine to Taylor & Ada streets due to roadwork. Riders are requested to take this into account while booking rides",
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            )
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width:350,
                              height:30,
                              color: Colors.deepPurpleAccent,
                              child: const Center(
                                child: Text(
                                    "NOTICE",
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )
                                ),
                              )
                            )
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              width:350,
                              height:125,
                              color: Colors.black,
                              child: const Center(
                                child: Text(
                                  "Night Ride 7 is currently unavailable due to maintenance. Wait times may be higher due to this.",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            )
                          )
                        ],
                      )
                    ]
                )
            )
          ],
        )
    );
  }
}
