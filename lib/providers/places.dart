import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:my_places/helpers/db_helper.dart';

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
    DbHelper.insert('user_places', {
      'id': pickedPlace.id,
      'title': pickedPlace.title,
      'image': pickedPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DbHelper.getData('user_places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              location: null,
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}
