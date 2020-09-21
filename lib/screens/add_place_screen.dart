import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/image_input.dart';
import '../providers/places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const String id = 'add-place-screen';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _selectedImage;

  void _selectImage(File pickedImage) {
    _selectedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _selectedImage == null) {
//      Scaffold.of(context).showSnackBar(
//        SnackBar(
//          content: Text('Please provide needed data'),
//        ),
//      );
      return;
    }
    Provider.of<Places>(context, listen: false)
        .addPlace(_titleController.text, _selectedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter title',
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: RaisedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
              elevation: 0,
              color: Theme.of(context).accentColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          )
        ],
      ),
    );
  }
}
