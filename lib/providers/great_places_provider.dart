import 'package:flutter/cupertino.dart';

import '../models/place_model.dart';

class GreatePlacesProvider with ChangeNotifier {
  List<PlaceModel> _items = [];

  List<PlaceModel> get items {
    return [..._items];
  }
}
