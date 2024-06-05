import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImageProfile extends StatefulWidget {
  const ImageProfile({super.key});

  @override
  State<ImageProfile> createState() => _ImageProfileState();
}

class _ImageProfileState extends State<ImageProfile> {
  final User? user = FirebaseAuth.instance.currentUser;
  String? imageUrl;
  File? imageFile;
  String imag = "";
  //
  String image = "";

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    try {
      final DocumentSnapshot doctordata = await FirebaseFirestore.instance
          .collection("doctors")
          .doc(user!.uid)
          .get();
      if (doctordata == null) {
        return;
      } else {
        setState(() {
          image = doctordata.get("image");
        });
      }
    } catch (e) {}
  }

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    final XFile? imageGallery =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGallery != null) {
      setState(() {
        imag = imageGallery.path;
      });
      imageFile = File(imageGallery.path);
      var ref = FirebaseStorage.instance
          .ref()
          .child('images')
          .child("${user!.uid}.jpg");
      await ref.putFile(imageFile!);
      imageUrl = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection("doctors")
          .doc(user!.uid)
          .update({'image': imageUrl});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          imag == ""
              ? image == ""
                  ? Container(
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
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://st3.depositphotos.com/1767687/17621/v/450/depositphotos_176214104-stock-illustration-default-avatar-profile-icon.jpg"),
                        ),
                      ),
                    )
                  : Container(
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
                            image,
                          ),
                        ),
                      ),
                    )
              : Container(
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
                      image: FileImage(File(imag)),
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 45,
              width: 45,
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
