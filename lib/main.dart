import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/places.dart';
import './screens/add_place_screen.dart';
import './screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'My Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        routes: {
          '/': (ctx) => PlacesListScreen(),
          AddPlaceScreen.id: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}


// dealing with location is not implemented yet due api