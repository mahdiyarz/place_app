import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_places_provider.dart';
import './map_screen.dart';
import '../models/place_model.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detial';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments;
    final greatPlaceData =
        Provider.of<GreatePlacesProvider>(context, listen: false)
            .findById(id as String);
    return Scaffold(
      appBar: AppBar(
        title: Text(greatPlaceData.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              greatPlaceData.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            greatPlaceData.location!.address as String,
            style: TextStyle(fontSize: 28),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    initialLocation: greatPlaceData.location as PlaceLocation,
                    isSelected: false,
                  ),
                ),
              );
            },
            child: Text('Show on map'),
          ),
        ],
      ),
    );
  }
}
