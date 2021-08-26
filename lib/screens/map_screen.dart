import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMap;
import 'package:latlong2/latlong.dart' as latLng;

import '../models/place_model.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelected;

  MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 45.469163,
      longitude: -75.694692,
    ),
    this.isSelected = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chose From Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(51.5, -0.09),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/mahdiyarz/ckss7n7mw1hpj18pf1kqsqhl0/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFoZGl5YXJ6IiwiYSI6ImNrc3I2ejlpODBqcGEzMW8zYTFmcmhoNTUifQ.-9eKSdDbne82Cbjz9fimTw',
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1IjoibWFoZGl5YXJ6IiwiYSI6ImNrc3I2ejlpODBqcGEzMW8zYTFmcmhoNTUifQ.-9eKSdDbne82Cbjz9fimTw',
              'id': 'mapbox.mapbox-streets-v8',
            },
          ),
          // MarkerLayerOptions(
          //   markers: [
          //     Marker(
          //       width: 80.0,
          //       height: 80.0,
          //       point: latLng.LatLng(51.5, -0.09),
          //       builder: (ctx) => Container(
          //         child: FlutterLogo(),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
      // GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //     target: LatLng(
      //       widget.initialLocation.latitude as double,
      //       widget.initialLocation.longitude as double,
      //     ),
      //   ),
      // ),
    );
  }
}
