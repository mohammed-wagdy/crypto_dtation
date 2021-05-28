
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {

  TextEditingController searchInput = TextEditingController();

  // For Pick Image
  PickedFile? imageFile;
  final picker = ImagePicker();

  // Get Image From Camera
  imgFromCamera() async {
    final pickedFile = picker.getImage(source: ImageSource.camera,imageQuality: 50);
    pickedFile.then((value){
      imageFile = value;
    });
  }

  // Get Image From Gallery
  imgFromGallery() async {
    final pickedFile = picker.getImage(source: ImageSource.gallery,imageQuality: 50);
    pickedFile.then((value){
      imageFile = value;
    });
  }


  @override
  void onInit() {
    super.onInit();
  }

}
