import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:campus_cruise/booked.dart';
import 'package:campus_cruise/home.dart';

class ShuttleLoc extends StatefulWidget {
  const ShuttleLoc({Key? key}) : super(key: key);

  @override
  State<ShuttleLoc> createState() => _ShuttleLocState();
}

class _ShuttleLocState extends State<ShuttleLoc> {
  BitmapDescriptor vanMarker = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/van4.png")
        .then((icon) {
      setState(() {
        vanMarker = icon;
      });
    });
  }

  static LatLng _uicloc = LatLng(41.869849, -87.647914);
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  Location _locationController = new Location();
  LatLng? _currentP;

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
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
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

  @override
  void initState() {
    addCustomIcon();
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = {};
    if (_currentP != null) {
      markers.add(
        Marker(
          markerId: MarkerId("_currentLocation"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          position: _currentP!,
        ),
      );
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
        ),
        body: Stack(children: <Widget>[
          _currentP == null
              ? Center(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/bgimage.png',
                        fit: BoxFit.cover,
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
                        icon: vanMarker,
                        position: _currentP!),
                  },
                )
        ]));
  }
}
