import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place_model.dart';

class GreatePlacesProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get items {
    return [..._items];
  }

  void addPlaces(String pickTitle, File pickImage) {
    final newPlace = PlaceModel(
      id: DateTime.now().toString(),
      title: pickTitle,
      location: null,
      image: pickImage,
    );
    items.add(newPlace);
    notifyListeners();
  }
}
