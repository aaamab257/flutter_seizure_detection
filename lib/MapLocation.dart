import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocation extends StatefulWidget {


  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = new Set();
  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Patiant',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(27.7099116, 85.3132340), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'My Location',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));


      //add more markers here
    });

    return markers;
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: GoogleMap(
        markers: getmarkers(),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }


}
