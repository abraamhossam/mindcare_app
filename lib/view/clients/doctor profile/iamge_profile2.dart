import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImageProfile2 extends StatefulWidget {
  QueryDocumentSnapshot? doctor;
  ImageProfile2({super.key, this.doctor});

  @override
  State<ImageProfile2> createState() => _ImageProfile2State();
}

class _ImageProfile2State extends State<ImageProfile2> {
  //late DocumentSnapshot doctordata;

  String? imageUrl;
  File? imageFile;
  String imag = "";
  //
  String image = "";
  String type = '';

  @override
  void initState() {
    super.initState();
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
            child: Container(),
          )
        ],
      ),
    );
  }
}
