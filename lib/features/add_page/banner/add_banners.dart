import 'dart:io';

import 'package:arabic_font/arabic_font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model_page/banner_model.dart';

class AddBanners extends StatefulWidget {
  const AddBanners({super.key});

  @override
  State<AddBanners> createState() => _AddBannersState();
}

class _AddBannersState extends State<AddBanners> {
  String imageUrl ="";
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print("❌ No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? Text("No image selected")
                : Image.file(File(_image!.path), width: 100, height: 100),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text("pickImage")),
            ),
            ElevatedButton(
                onPressed: () async {
                  String docid= FirebaseFirestore.instance.collection("banners").doc().id;
                  if (imageUrl.isEmpty) {
                    BannerModel items = BannerModel(
                      image: imageUrl,

                    );
                   await FirebaseFirestore.instance
                        .collection("banners")
                        .add(items.toMap()).then((value) {
                     value.update({
                       "id":value.id
                     });
                   },);;

                    print(imageUrl);
                    print("-----------------");
                  }
                },
                child: Text("add"))
          ],
        ),
      ),
    );
  }
}
