import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parcial_fluttermaps/app/ui/pages/home/home_page.dart';


void main() {
  runApp(MapsParcial());
}

class MapsParcial extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: GoogleMapsPage (),
      
    
    );
  }
}
