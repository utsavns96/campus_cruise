// import 'dart:html';
import 'dart:async';

import 'package:campus_cruise/booked.dart';
import 'package:campus_cruise/home.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_maps_webservice/places.dart' as gmaps;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MapPage> {
  Location _locationController = new Location();

  String dropdownValue = '1';

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static LatLng _uicloc = LatLng(41.869849, -87.647914);
  static LatLng _homelocs = LatLng(41.698782, -88.184463);
  LatLng? _currentP = null;

  gmaps.GoogleMapsPlaces _places =
      gmaps.GoogleMapsPlaces(apiKey: "AIzaSyAxcYboZEC-2VQhftB4rPMo2Gsi_K-ywiE");

  final pickupController = TextEditingController();
  final dropoffController = TextEditingController();

  Future<void> _handlePressButton(BuildContext context, bool isPickup) async {
    gmaps.Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: 'AIzaSyAxcYboZEC-2VQhftB4rPMo2Gsi_K-ywiE',
      mode: Mode.overlay,
    );

    if (p != null) {
      final placeId = p.placeId;
      if (placeId != null) {
        gmaps.PlacesDetailsResponse detail =
            await _places.getDetailsByPlaceId(placeId);

        if (detail.status == "OK" && detail.result.geometry?.location != null) {
          final lat = detail.result.geometry!.location!.lat;
          final lng = detail.result.geometry!.location!.lng;

          LatLngBounds boundary = LatLngBounds(
            southwest: LatLng(41.86262999560797, -87.67623910689167),
            northeast: LatLng(41.87485447153885, -87.64407719873702),
          );
          if (boundary.contains(LatLng(lat, lng))) {
            setState(() {
              if (isPickup) {
                _uicloc = LatLng(lat, lng);
                pickupController.text = p.description ?? '';
              } else {
                _homelocs = LatLng(lat, lng);
                dropoffController.text = p.description ?? '';
              }
            });
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        'Selected location is outside the boundary. Please reselect a location.'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok'))
                    ],
                  );
                });
          }
        } else {
          // Handle the case where the place details are not available or the location is null
        }
      }
    }
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

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const MenuPage(
                        title: 'Campus Cruise',
                      )),
            );
          },
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
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen),
                        position: _currentP!),
                    Marker(
                        markerId: MarkerId("_sourceLocation"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueAzure),
                        position: _uicloc),
                    Marker(
                        markerId: MarkerId("_homeloc"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueMagenta),
                        position: _homelocs),
                  },
                  polygons: Set<Polygon>.of(
                    <Polygon>[
                      Polygon(
                        polygonId: PolygonId("0"),
                        points: [
                          LatLng(41.87421885646101, -87.64407719873702),
                          LatLng(41.86262999560797, -87.64713711078548),
                          LatLng(41.86362760041953, -87.67576633078501),
                          LatLng(41.87485447153885, -87.67623910689167)
                        ],
                        fillColor:
                            Color.fromARGB(255, 160, 159, 243).withAlpha(70),
                        strokeWidth: 3,
                        strokeColor: Color.fromARGB(255, 160, 159, 243),
                      ),
                    ],
                  ),
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
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: pickupController,
                    readOnly: true,
                    onTap: () => _handlePressButton(context, true),
                    decoration: InputDecoration(
                      labelText: 'Pick up location',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: dropoffController,
                    readOnly: true,
                    onTap: () => _handlePressButton(context, false),
                    decoration: InputDecoration(
                      labelText: 'Drop off location',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    children: <Widget>[
                      Text(
                        'Select number of riders',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['1', '2', '3', '4', '5']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              color: Colors.white,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BookedPage()));
                    },
                    child: Text(
                      'Book',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue, // background color
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
}
