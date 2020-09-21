import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return _items;
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final pickedPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
      image: pickedImage,
    );
    _items.add(pickedPlace);
    notifyListeners();
  }
}
