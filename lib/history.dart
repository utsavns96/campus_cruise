import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import 'home.dart';

void HistoryPage() => runApp(MaterialApp(
      title: 'Campus Cruise',
      home: HistoryScreen(),
    ));

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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

class HistoryPageScreen extends StatefulWidget {
  const HistoryPageScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HistoryPageScreen> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPageScreen> {
  late DateTime currentDate;
  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now(); // Initialize currentDate to the current date
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          //extendBodyBehindAppBar: true,
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
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MenuPage(
                            title: 'Campus Cruise',
                          )),
                          (Route<dynamic> route) => false
                  );
                },
              ),
              centerTitle: true,
              //backgroundColor: Color(0x00000000),
              backgroundColor: Colors.lightBlueAccent,
              elevation: 0.0,
              bottom: const TabBar(
                tabs: [
                  Tab(child: Text('Upcoming')),
                  Tab(child: Text('Completed')),
                  Tab(child: Text('Cancelled')),
                ],
              )),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgimage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: TabBarView(children: [
              /*
              Tab 1 - Upcoming
               */
              Text('No Upcoming Rides',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              /*
              Tab 2 - Completed
               */
              ListView(
                children: <Widget>[
                  for (var i = 0; i < 20; i++)
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: const Icon(
                                Icons.directions_car,
                                color: Colors.green,
                                size: 50,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const Text('Pickup: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        getRandomAddress(), // Call the function here
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text('Dropoff: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        getRandomAddress(), // Call the function here
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text('Time: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        getRandomTimestamp(), // Call the function here
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                ],
              ),
              /*
              Tab 3 - Cancelled
               */
              ListView(
                children: <Widget>[
                  for (var i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.all(10.0),
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: const Icon(
                                Icons.remove_road,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const Text('Pickup: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        getRandomAddress(), // Call the function here
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text('Dropoff: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        getRandomAddress(), // Call the function here
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text('Time: ',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        getRandomTimestamp(), // Call the function here
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  String getRandomAddress() {
    var rng = new Random();
    var streets = [
      'Halsted St',
      'Taylor St',
      'Roosevelt St',
      'S Morgan St',
      'Laflin St'
    ];
    var houseNumbers = List<String>.generate(700,
        (i) => (i + rng.nextInt(2000)).toString()); //Generate random address

    var street = streets[rng.nextInt(streets.length)];
    var houseNumber = houseNumbers[rng.nextInt(houseNumbers.length)];

    return '$houseNumber $street, Chicago, IL';
  }

  String getRandomTimestamp() {
    var rng = new Random();
    DateTime newMinDate = currentDate
        .subtract(Duration(days: rng.nextInt(3))); // Subtract up to 30 days
    var startDate = DateTime.now()
        .subtract(Duration(days: 730)); // Start date is 730 days (2 years) ago
    var endDate = newMinDate; // End date

    var difference = endDate.difference(startDate);
    var randomDays = difference.inDays > 0 ? rng.nextInt(difference.inDays) : 0;

    currentDate =
        startDate.add(Duration(days: randomDays)); // Update currentDate

    // Add random hours and minutes
    currentDate = currentDate
        .add(Duration(hours: rng.nextInt(3), minutes: rng.nextInt(60)));

    var formatter =
        DateFormat('hh:mm dd-MM-yyyy'); // Specify the format you want
    var formattedTimestamp = formatter.format(currentDate);

    return formattedTimestamp; // This will be a string in 'hh:mm dd-MM-yyyy' format
  }
}
