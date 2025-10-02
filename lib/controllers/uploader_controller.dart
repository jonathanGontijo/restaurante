import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploaderController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var imageOne = Rxn<File>();
  var imageTwo = Rxn<File>();
  var imageThree = Rxn<File>();
  var imageFour = Rxn<File>();
  var logo = Rxn<File>();
  var cover = Rxn<File>();

  RxList<String> _images = <String>[].obs;

  List<String> get images => _images;

  set setImages(String newValue) {
    _images.add(newValue);
  }

  RxString _imageOneUrl = ''.obs;
  RxString _imageTwoUrl = ''.obs;
  RxString _imageThreeUrl = ''.obs;
  RxString _imageFourUrl = ''.obs;
  RxString _logoUrl = ''.obs;
  RxString _coverUrl = ''.obs;

  String get imageOneUrl => _imageOneUrl.value;
  String get imageTwoUrl => _imageTwoUrl.value;
  String get imageThreeUrl => _imageThreeUrl.value;
  String get imageFourUrl => _imageFourUrl.value;
  String get logoUrl => _logoUrl.value;
  String get coverUrl => _coverUrl.value;

  set imageOneUrl(String newValue) {
    _imageOneUrl.value = newValue;
    images.add(newValue);
  }

  set imageTwoUrl(String newValue) {
    _imageTwoUrl.value = newValue;
  }

  set imageThreeUrl(String newValue) {
    _imageThreeUrl.value = newValue;
  }

  set imageFourUrl(String newValue) {
    _imageFourUrl.value = newValue;
  }

  set logoUrl(String newValue) {
    _logoUrl.value = newValue;
  }

  set coverUrl(String newValue) {
    _coverUrl.value = newValue;
  }

  Future<void> pickImage(String type) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      if (type == 'one') {
        imageOne.value = File(pickedImage.path);
        uploadImageToFirebase('one');
      } else if (type == 'two') {
        imageTwo.value = File(pickedImage.path);
        uploadImageToFirebase('two');
      } else if (type == 'three') {
        imageThree.value = File(pickedImage.path);
        uploadImageToFirebase('three');
      } else if (type == 'four') {
        imageFour.value = File(pickedImage.path);
        uploadImageToFirebase('four');
      } else if (type == 'logo') {
        logo.value = File(pickedImage.path);
        uploadImageToFirebase('logo');
      } else if (type == 'cover') {
        cover.value = File(pickedImage.path);
        uploadImageToFirebase('cover');
        return;
      }
    }
  }

  Future<void> uploadImageToFirebase(String type) async {
    if (type == 'one') {
      try {
        String fileName =
            'images/${DateTime.now().microsecondsSinceEpoch}_${imageOne.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(imageOne.value!);

        imageOneUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint('Error uploading image one: $e');
      }
    } else if (type == 'two') {
      try {
        String fileName =
            'images/${DateTime.now().microsecondsSinceEpoch}_${imageTwo.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(imageTwo.value!);

        imageTwoUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint('Error uploading image two: $e');
      }
    } else if (type == 'three') {
      try {
        String fileName =
            'images/${DateTime.now().microsecondsSinceEpoch}_${imageThree.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(imageThree.value!);

        imageThreeUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint('Error uploading image three: $e');
      }
    } else if (type == 'four') {
      try {
        String fileName =
            'images/${DateTime.now().microsecondsSinceEpoch}_${imageFour.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(imageFour.value!);

        imageFourUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint('Error uploading image four: $e');
      }
    } else if (type == 'logo') {
      try {
        String fileName =
            'logo/${DateTime.now().microsecondsSinceEpoch}_${logo.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(logo.value!);

        logoUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint('Error uploading logo: $e');
      }
    } else if (type == 'cover') {
      try {
        String fileName =
            'cover/${DateTime.now().microsecondsSinceEpoch}_${cover.value!.path.split('/').last}';
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref()
            .child(fileName)
            .putFile(cover.value!);

        coverUrl = await snapshot.ref.getDownloadURL();
      } catch (e) {
        debugPrint('Error uploading cover: $e');
      }
    }
  }
}
