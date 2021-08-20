import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place_model.dart';
import '../helpers/db_helpers.dart';

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
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (e) => PlaceModel(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
