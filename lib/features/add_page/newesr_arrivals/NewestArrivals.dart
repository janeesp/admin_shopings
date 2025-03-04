import 'dart:io';

import 'package:arabic_font/arabic_font.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';
import '../../model_page/banner_model.dart';
import '../../model_page/newest_model.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController Name_controller=TextEditingController();
  TextEditingController rate_controller=TextEditingController();
  TextEditingController Totel_controller=TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? Text("No image selected")
                  : Image.file(_image!, width: 100, height: 100),
              ElevatedButton(onPressed: () {
                pickImage();
              },
                  child: Text("pickImage")),
          
              TextFormField(
                controller: Name_controller,
                decoration: InputDecoration(
                  hintText: "name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: scrWidth*0.02,
              ),
              TextFormField(
                controller: rate_controller,
                decoration: InputDecoration(
                  hintText: "rate",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: scrWidth*0.02,
              ),
              TextFormField(
                controller: Totel_controller,
                decoration: InputDecoration(
                  hintText: "total",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                  onPressed: () {
                    if(Name_controller.text!=""&&rate_controller.text!=""
                        &&Totel_controller.text!=""){
                      DressModel items =DressModel(
                        image: imageUrl,
                        name: Name_controller.text,
                        rate: double.tryParse(rate_controller.text),
                        total: double.tryParse(Totel_controller.text),
                      );
                      FirebaseFirestore.instance.collection("products").add(
                          items.toMap()
                      ).then((value) {
                        value.update({
                          "id":value.id
                        });
                      },);
                      print(imageUrl);
                      print("-----------------");
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("pleas add items!",
                          style: ArabicTextStyle(arabicFont: ArabicFont.amiri,color: Colors.red),)));
                    }
          
          
                  }, child: Text("add"))
            ],
          ),
        ),
      ),
    );
  }
}