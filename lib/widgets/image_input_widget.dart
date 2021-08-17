import 'dart:io';

import 'package:flutter/material.dart';

class ImageInputWidget extends StatefulWidget {
  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black54,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            alignment: Alignment.center,
            child: _imageFile != null
                ? Image.file(_imageFile as File)
                : Text(
                    'Image not taken yet',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 28,
                    ),
                  ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add_a_photo),
            label: _imageFile != null
                ? Text('Replace an Other photo')
                : Text('Add photo'),
            style: ElevatedButton.styleFrom(
              primary: Colors.black54,
              onPrimary: Colors.white60,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              elevation: 0,
            ),
          )
        ],
      ),
    );
  }
}
