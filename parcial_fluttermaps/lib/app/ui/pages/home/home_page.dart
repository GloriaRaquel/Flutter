
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 
class GoogleMapsPage extends StatefulWidget {
 
 
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}
 
class _GoogleMapsPageState extends State<GoogleMapsPage> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> listMarkers = {};
  MapType currentMapType = MapType.normal;
  //late BitmapDescriptor customIcon;
 
  static final CameraPosition initCameraPosition = CameraPosition(
      bearing: 30,
      target: LatLng(13.978960094536422, -89.56625543257736),
      tilt: 45,
      zoom: 11);
 
  @override
  Widget build(BuildContext context) {
    listMarkers.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(13.978960094536422, -89.56625543257736),
      infoWindow: InfoWindow(title: "Domicilios SV Santa Ana"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));
 
    listMarkers.add(Marker(
        markerId: MarkerId("2"),
        position: LatLng(13.985917567545679, -89.67944406559448),
        infoWindow: InfoWindow(title: "Domicilios SV Chalchuapa"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),));
 
    listMarkers.add(Marker(
        markerId: MarkerId("3"),
        position: LatLng(13.901096453797708, -89.50261120812088),
        infoWindow: InfoWindow(title: "Domicilios SV El Congo"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),));
 
   
 
    return Scaffold(
        appBar: AppBar(title: Text("Parcial")),
        body: Stack(
          children: [
            GoogleMap(
              mapType: currentMapType,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: initCameraPosition,
              compassEnabled: true,
              markers: listMarkers,
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                child: Icon(Icons.map, size: 30),
                onPressed: _onMapTypeChanged,
              ),
            )
          ],
        ));
  }
 
  void _onMapTypeChanged() {
    setState(() {
      currentMapType = currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }
 

 
  @override
  void initState() {
    super.initState();
  
  }
}