import 'package:flutter/material.dart';
import 'package:my_places/providers/places.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.id);
            },
          ),
        ],
      ),
      body: Consumer<Places>(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have not add any places yet, Please add some.',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddPlaceScreen.id);
                },
                icon: Icon(Icons.add),
                label: Text('Add'),
              ),
            ],
          ),
        ),
        builder: (ctx, places, ch) => places.items.length <= 0
            ? ch
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: places.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[i].image),
                  ),
                  title: Text(places.items[i].title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
