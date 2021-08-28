import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place_model.dart';
import '../helpers/db_helpers.dart';
import '../helpers/location_helper.dart';

class GreatePlacesProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get items {
    return [..._items];
  }

  PlaceModel findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> addPlaces(
      String pickTitle, File pickImage, PlaceLocation? pickedLocation) async {
    final address = await LocationHelper.getAddress(
        pickedLocation!.latitude as double, pickedLocation.longitude as double);
    final updatePlaceLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: address);
    final newPlace = PlaceModel(
      id: DateTime.now().toString(),
      title: pickTitle,
      location: updatePlaceLocation,
      image: pickImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'latitude': newPlace.location!.latitude as double,
      'longitude': newPlace.location!.longitude as double,
      'address': newPlace.location!.address as String,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (e) => PlaceModel(
            id: e['id'],
            title: e['title'],
            location: PlaceLocation(
              latitude: e['latitude'],
              longitude: e['longitude'],
              address: e['address'],
            ),
            image: File(e['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
