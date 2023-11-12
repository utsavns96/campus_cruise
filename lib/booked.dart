import 'package:campus_cruise/book.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class BookedPage extends StatefulWidget {
  const BookedPage({super.key});

  @override
  State<BookedPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BookedPage> {
  static const LatLng pickUpLocation = LatLng(41.869745, -87.648509);
  static const LatLng dropOffLocation =
      LatLng(41.871309928210664, -87.66177895956177);
  String apikey = 'AIzaSyAxcYboZEC-2VQhftB4rPMo2Gsi_K-ywiE';

  List<LatLng> polyLineCoordinates = [];

  Future<void> getPolyPoints() async {
    String apikey = 'AIzaSyAxcYboZEC-2VQhftB4rPMo2Gsi_K-ywiE';

    PolylinePoints polylinePoints = PolylinePoints();

    var result = await polylinePoints.getRouteBetweenCoordinates(
      apikey,
      PointLatLng(pickUpLocation.latitude, pickUpLocation.longitude),
      PointLatLng(dropOffLocation.latitude, dropOffLocation.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng pnt) => polyLineCoordinates.add(
            LatLng(pnt.latitude, pnt.longitude),
          ));

      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: pickUpLocation, zoom: 15),
            polylines: {
              Polyline(
                  polylineId: PolylineId("route"),
                  points: polyLineCoordinates,
                  color: const Color.fromARGB(255, 148, 82, 255),
                  width: 6),
            },
            markers: {
              Marker(
                markerId: MarkerId("Source"),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueAzure),
                position: pickUpLocation,
              ),
              Marker(
                markerId: MarkerId("Source"),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
                position: dropOffLocation,
              ),
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgimage.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Status: ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24),
                            ),
                            TextSpan(
                              text: ' Booked ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Driver Name: ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 24)),
                            TextSpan(
                                text: 'Niki Soni',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)),
                          ],
                        ),
                      ),

                      SizedBox(
                          height:
                              8.0), // This adds a space between the text and the stars
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < 4 ? Colors.yellow : Colors.grey,
                            size: 30, // This makes the stars bigger
                          );
                        }),
                      ),
                      SizedBox(height: 8.0),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Your driver is coming in ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)),
                            TextSpan(
                                text: '4',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 24)),
                            TextSpan(
                                text: ' minutes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showCancelRidePopup(context);
                      },
                      child: Text(
                        'Cancel Ride',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // This sets the background color
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showCancelRidePopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.all(0),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8, // 90% of screen width
          height:
              MediaQuery.of(context).size.height * 0.4, // 50% of screen height
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bgimage.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Cancel Ride?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                'Are you sure you want to cancel your ride?',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Re-booking after canceling a ride will place you at the end of the queue for pick up.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 10),
              TextButton(
                child: Text(
                  'Continue ride',
                  style: TextStyle(color: Colors.blue),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
              TextButton(
                child: Text(
                  'Cancel ride',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MapPage()),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
