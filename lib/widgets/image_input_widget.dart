import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as pathFile;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInputWidget extends StatefulWidget {
  final Function onSelectedImage;

  ImageInputWidget(this.onSelectedImage);
  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File? _storedImage;

  Future<void> _takeImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 20,
    );
    setState(() {
      _storedImage = File(imageFile!.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = pathFile.basename(imageFile!.path);
    final saveImage = await imageFile.saveTo('${appDir.path}/$fileName');
    widget.onSelectedImage(saveImage);
  }

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
            child: _storedImage != null
                ? Image.file(
                    _storedImage as File,
                    fit: BoxFit.cover,
                  )
                : Text(
                    'Image not taken yet',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 28,
                    ),
                  ),
          ),
          TextButton.icon(
            onPressed: _takeImage,
            icon: Icon(Icons.add_a_photo),
            label: _storedImage != null
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
