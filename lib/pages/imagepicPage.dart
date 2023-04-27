import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Imagespicker extends StatefulWidget {
  dynamic imagespicker;

  @override
  State<Imagespicker> createState() => _ImagespickerState();

  // pickImagesGall(ImageSource gallery) {
  //   this.imagespicker.pickImagesGall(gallery);
  // }
}

class _ImagespickerState extends State<Imagespicker> {
  late Future imageFile;
  late Future<XFile?> pickImage;

  pickImagesGall(
    ImageSource source,
  ) async {
    setState(() {
      imageFile = ImagePicker().pickImage(
        source: source,
      );
    });
  }

  Widget showImages() {
    return FutureBuilder<File>(
      //future: imageFile,
      builder: (BuildContext Context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            File(
              snapshot.data as String,
            ),
            //snapshot.data,
            // height: 136,
            // width: 185,
          );
        } else if (snapshot.error != null) {
          return Text('error Images Picking');
        } else {
          return Text('No Image');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var selectedFileName = '';
    // String DefultImageUrl = '';
    //var file;
    return Scaffold(
      body: Column(
        children: [showImages(), pickImagesGall(ImageSource.gallery)],
      ),
    );
  }
}
