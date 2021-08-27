import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart' as latLng;

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInputWidget extends StatefulWidget {
  final Function selectedAddress;
  LocationInputWidget(this.selectedAddress);

  @override
  _LocationInputWidgetState createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String? _previewImageUrl;

  void _previewImage(double lat, double lng) {
    final staticMapImage = LocationHelper.generateLocationPreviewImage(
        latitude: lat, longitude: lng);

    setState(() {
      _previewImageUrl = staticMapImage;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    widget.selectedAddress(locData.latitude, locData.longitude);
    _previewImage(
      locData.latitude as double,
      locData.longitude as double,
    );
  }

  Future<void> _selectOnMap() async {
    final latLng.LatLng? selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
          isSelected: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    widget.selectedAddress(
        selectedLocation.latitude, selectedLocation.longitude);
    _previewImage(selectedLocation.latitude, selectedLocation.longitude);
    // print(selectedLocation.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black54)),
          width: double.infinity,
          height: 225,
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: _previewImageUrl == null
              ? Text('Location not chosen yet')
              : Image.network(_previewImageUrl as String),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: Icon(Icons.map),
              label: Text('Choose from Map'),
            ),
          ],
        ),
      ],
    );
  }
}
