// import 'dart:html';
import 'dart:async';

import 'package:campus_cruise/booked.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MapPage> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _uicloc = LatLng(41.869849, -87.647914);
  static const LatLng _homelocs = LatLng(41.868473, -87.658735);
  LatLng? _currentP = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationUpdates();
  }

// code which just shows the from and to location in a box.
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
      body: Stack(
        children: <Widget>[
          _currentP == null
              ? Center(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/bgimage.png',
                        fit: BoxFit.cover, // or BoxFit.fill
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Center(
                        child: Text(
                          'Map Loading...',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : GoogleMap(
                  onMapCreated: ((GoogleMapController controller) =>
                      _mapController.complete(controller)),
                  initialCameraPosition: CameraPosition(
                    target: _uicloc,
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                        markerId: MarkerId("_currentLocation"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: _currentP!),
                    Marker(
                        markerId: MarkerId("_sourceLocation"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: _uicloc),
                  },
                ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgimage.png'),
                  fit: BoxFit
                      .cover, // You can use BoxFit.fill for a different effect
                ),
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Pick up location',
                      border: OutlineInputBorder(),
                      filled: true, // Add this line
                      fillColor: Colors.white, // Add this line
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Drop off location',
                      border: OutlineInputBorder(),
                      filled: true, // Add this line
                      fillColor: Colors.white, // Add this line
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    items:
                        <String>['1', '2', '3', '4', '5'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: Colors.white, // Add this line
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    hint: Text('Select number of riders'),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BookedPage()));
                    },
                    child: Text('Book'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );

    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();

    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }
}
