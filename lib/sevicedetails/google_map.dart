import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapData extends StatefulWidget {
  MapData(this.orderid, this.latitude, this.longitude, {Key? key})
      : super(key: key);
  String orderid;
  String latitude;
  String longitude;

  @override
  State<MapData> createState() => _MapDataState();
}

class _MapDataState extends State<MapData> {
  late Completer<GoogleMapController> _controller = Completer();

/*  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(double.parse(widget.latitude),  88.47979029999999),
    zoom: 14.4746,
  );*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId('SomeId'),
        position: LatLng(
            double.parse(widget.latitude == null ? "0.0" : widget.latitude),
            double.parse(widget.longitude == null ? "0.0" : widget.longitude)),
        infoWindow: InfoWindow(title: 'The title of the marker')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (widget.latitude == "0.0" && widget.longitude == "0.0")
          ? Center(
              child: Text("Latitude and longitude not found"),
            )
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(widget.latitude),
                    double.parse(widget.longitude)),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: Set<Marker>.of(_markers),
            ),
    );
  }

  // Marker markers = Marker();
  void _onMapCreated(Completer<GoogleMapController> controller) {
    _controller = controller;

    final marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(
        double.parse(widget.latitude),
        double.parse(widget.longitude),
      ),
      // icon: BitmapDescriptor.,
    );

    setState(() {
      // markers[MarkerId('place_name')] = marker;
    });
  }

  List<Marker> _markers = [];
}
