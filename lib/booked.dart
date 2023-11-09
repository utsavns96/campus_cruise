import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/';
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

    // Use or return the result here
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: pickUpLocation, zoom: 13),
          polylines: {
            Polyline(
                polylineId: PolylineId("route"),
                points: polyLineCoordinates,
                color: const Color.fromARGB(255, 148, 82, 255),
                width: 6)
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
          }),
    );
  }
}