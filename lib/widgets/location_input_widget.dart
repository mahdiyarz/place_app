import 'package:flutter/material.dart';

class LocationInputWidget extends StatefulWidget {
  LocationInputWidget({Key? key}) : super(key: key);

  @override
  _LocationInputWidgetState createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  String? _previewImageUrl;
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
              onPressed: () {},
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('Choose from Map'),
            ),
          ],
        )
      ],
    );
  }
}
