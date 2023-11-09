// import 'dart:html';
import 'dart:async';

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
              ? const Center(
                  child: Text("Loading.."),
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
                        icon: BitmapDescriptor.defaultMarker,
                        position: _currentP!),
                    Marker(
                        markerId: MarkerId("_sourceLocation"),
                        icon: BitmapDescriptor.defaultMarker,
                        position: _uicloc),
                  },
                ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Pick up location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Drop off location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  DropdownButton<String>(
                    items:
                        <String>['1', '2', '3', '4', '5'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    hint: Text('Select number of riders'),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {},
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

  //the second iteration is taking up the whole screen
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.transparent,
  //       leading: IconButton(
  //         icon: Icon(Icons.arrow_back, color: Colors.black),
  //         onPressed: () => Navigator.of(context).pop(),
  //       ),
  //     ),
  //     body: Stack(
  //       children: <Widget>[
  //         Container(
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomCenter,
  //               colors: [Colors.blue, Colors.black],
  //             ),
  //           ),
  //         ),
  //         Center(
  //           child: Card(
  //             elevation: 8.0,
  //             child: Padding(
  //               padding: EdgeInsets.all(16.0),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Text(
  //                     'Pick Up Location',
  //                     style: TextStyle(
  //                       fontSize: 20.0,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: 'Enter Drop off Location',
  //                       prefixIcon: Icon(Icons.search),
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                   SizedBox(height: 16.0),
  //                   Text('Where would you go?'),
  //                   DropdownButton<String>(
  //                     items:
  //                         <String>['1', '2', '3', '4', '5'].map((String value) {
  //                       return DropdownMenuItem<String>(
  //                         value: value,
  //                         child: Text(value),
  //                       );
  //                     }).toList(),
  //                     onChanged: (_) {},
  //                     hint: Text('Select number of riders'),
  //                   ),
  //                   SizedBox(height: 16.0),
  //                   ElevatedButton(
  //                     onPressed: () {},
  //                     child: Text('Book Ride'),
  //                     style: ElevatedButton.styleFrom(
  //                       primary: Colors.blue,
  //                       onPrimary: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.transparent,
  //       leading: IconButton(
  //         icon: Icon(Icons.arrow_back, color: Colors.black),
  //         onPressed: () => Navigator.of(context).pop(),
  //       ),
  //     ),
  //     body: Stack(
  //       children: <Widget>[
  //         Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Container(
  //             height: MediaQuery.of(context).size.height * 0.3,
  //             decoration: BoxDecoration(
  //               gradient: LinearGradient(
  //                 begin: Alignment.topCenter,
  //                 end: Alignment.bottomCenter,
  //                 colors: [Colors.blue, Colors.black],
  //               ),
  //             ),
  //           ),
  //         ),
  //         Center(
  //           child: Card(
  //             elevation: 8.0,
  //             child: Padding(
  //               padding: EdgeInsets.all(16.0),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: <Widget>[
  //                   Text(
  //                     'Pick Up Location',
  //                     style: TextStyle(
  //                       fontSize: 20.0,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: 'Enter Drop off Location',
  //                       prefixIcon: Icon(Icons.search),
  //                       border: OutlineInputBorder(),
  //                     ),
  //                   ),
  //                   SizedBox(height: 16.0),
  //                   Text('Where would you go?'),
  //                   DropdownButton<String>(
  //                     items:
  //                         <String>['1', '2', '3', '4', '5'].map((String value) {
  //                       return DropdownMenuItem<String>(
  //                         value: value,
  //                         child: Text(value),
  //                       );
  //                     }).toList(),
  //                     onChanged: (_) {},
  //                     hint: Text('Select number of riders'),
  //                   ),
  //                   SizedBox(height: 16.0),
  //                   ElevatedButton(
  //                     onPressed: () {},
  //                     child: Text('Book Ride'),
  //                     style: ElevatedButton.styleFrom(
  //                       primary: Colors.blue,
  //                       onPrimary: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
