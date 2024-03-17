import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImageProfile extends StatefulWidget {
  ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  final User? user = FirebaseAuth.instance.currentUser;
  String? url;
  File? imageFile;

  Future getImage() async {
    ImagePicker _picker = ImagePicker();
    final XFile? imageGallery =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      imageFile = File(imageGallery.path);
      var ref = FirebaseStorage.instance
          .ref()
          .child('images')
          .child("${user!.uid}.jpg");
      await ref.putFile(imageFile!);
      url = await ref.getDownloadURL();

      setState(() {
        
      });

      // uploadImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(width: 4, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  url == null
                      ? "https://www.pngitem.com/pimgs/m/78-786293_1240-x-1240-0-avatar-profile-icon-png.png"
                      : "$url",
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                  ),
                  color: Colors.blue),
              child: IconButton(
                onPressed: () {
                  getImage();
                },
                icon: const Center(child: Icon(Icons.add_a_photo)),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
