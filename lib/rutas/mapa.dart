import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';

class MapsActivity extends StatefulWidget {
  static const nombreRuta = "/mapas";

  @override
  _MapsActivityState createState() => new _MapsActivityState();
}

class _MapsActivityState extends State<MapsActivity> {
  static const LatLng _center = const LatLng(38.9860385, -3.9620074);
  Set<Marker> markers = Set();
  MapType _currentMapType = MapType.normal;
  LatLng centerPosition;
  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
      print("dddd" + _currentMapType.toString());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            mapType: _currentMapType,
            myLocationEnabled: true,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            tiltGesturesEnabled: false,
            markers: markers,
            onCameraMove: _onCameraMove,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          new GuillotineMenu(),
        ],
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _onMapTypeButtonPressed,
            child: new Icon(
              Icons.layers,
              color: Colors.white,
            ),
          ),
          /*FloatingActionButton(
            //  onPressed: _onAddMarkerButtonPressed,
            onPressed: (){},
              child: new Icon(
                Icons.edit_location,
                color: Colors.white,
              )),*/
        ],
      ),
    );
  }

  void _onCameraMove(CameraPosition position) {
    centerPosition = position.target;
  }

  /*void _onAddMarkerButtonPressed() {
    InfoWindow infoWindow =
        InfoWindow(title: "Location" + markers.length.toString());
    Marker marker = Marker(
      markerId: MarkerId(markers.length.toString()),
      infoWindow: infoWindow,
      position: centerPosition,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );
    setState(() {
      markers.add(marker);
    });
  }*/
}
