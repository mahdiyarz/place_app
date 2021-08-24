import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInputWidget extends StatefulWidget {
  LocationInputWidget({Key? key}) : super(key: key);

  @override
  _LocationInputWidgetState createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImage = LocationHelper.generateLocationPreviewImage(
        latitude: locData.latitude as double,
        longitude: locData.longitude as double);

    setState(() {
      _previewImageUrl = staticMapImage;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black54)),
          width: double.infinity,
          height: 150,
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
        )
      ],
    );
  }
}
