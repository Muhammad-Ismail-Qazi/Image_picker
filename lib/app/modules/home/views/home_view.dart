import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        centerTitle: true,
      ),
      body: Column(

        children: [
          Obx(()=>controller.imagePath.value ==''? const Text("No Image selected"): Image(image: FileImage(File(controller.imagePath.value)))),
          Obx(() =>controller.imageSize.value==''? const Text("") : Text(controller.imageSize.value)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                  child: const Text("Gallery")),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton(
                  onPressed: () => controller.pickImage(ImageSource.camera),
                  child: const Text("Camera")),
            ],
          ),
        ],
      ),
    );
  }
}